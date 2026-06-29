import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/astrologer_api.dart';
import '../widgets/slide_route.dart';
import '../screens/astrologers/astrologer_list_screen.dart';
import '../screens/astrologers/astrologer_profile_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/pooja/pooja_list_screen.dart';
import '../screens/pooja/pooja_detail_screen.dart';
import '../screens/shop/product_detail_screen.dart';
import '../screens/shop/orders_screen.dart';
import '../screens/consult/chat_history_screen.dart';
import '../screens/profile/my_profile_screen.dart';
import '../screens/settings/notif_settings_screen.dart';
import '../screens/wallet/wallet_screen.dart';
import '../screens/live/live_audience_screen.dart';

/// Central deep-link router for notifications + external links.
///
/// Everything funnels into [open(target, data)] which maps a logical target to
/// a screen. Sources:
///  1. In-app notification tap   → from `notification.type` + `notification.data`
///  2. Push tap (fg/bg/cold)     → from FCM `message.data`
///  3. External URI              → `rudraganga://<host>/<id>` or https App Link
///
/// A single [navigatorKey] lets the headless push/URI handlers navigate without
/// a BuildContext.
class DeepLink {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get _nav => navigatorKey.currentState;

  /// Resolve + navigate for an in-app or push notification. Prefers an explicit
  /// `data.deeplink` (admin-set / external) and otherwise routes by `type`.
  static void fromNotification({required String type, Map<String, dynamic> data = const {}}) {
    final explicit = data['deeplink']?.toString();
    if (explicit != null && explicit.isNotEmpty) {
      fromUri(explicit);
      return;
    }
    // Order notifications carry the orderId → open that order's detail directly.
    if (type == 'order_status') {
      final orderId = data['orderId']?.toString();
      final nav = _nav;
      if (orderId != null && orderId.isNotEmpty && nav != null) {
        nav.push(slideRoute(OrderDetailScreen(orderId: orderId)));
        return;
      }
    }
    // "Astrologer is live" carries the liveSessionId → open the live room.
    if (type == 'live') {
      final liveSessionId = data['liveSessionId']?.toString();
      final nav = _nav;
      if (liveSessionId != null && liveSessionId.isNotEmpty && nav != null) {
        nav.push(slideRoute(LiveAudienceScreen(liveSessionId: liveSessionId, headline: 'Live now')));
        return;
      }
    }
    // "Astrologer is online/available" carries the profileId → open that
    // astrologer's detail page directly (the whole point of "tap to connect").
    if (type == 'astrologer_available' || type == 'incoming_request' || type == 'missed_call') {
      final profileId = data['profileId']?.toString();
      if (profileId != null && profileId.isNotEmpty) {
        _openAstrologer(profileId);
        return;
      }
    }
    // Astrologer published an AI recap (Feature 1) → open that chat's history,
    // where the summary + suggested products render at the top.
    if (type == 'astrologer_suggestion') {
      final sessionId = data['sessionId']?.toString();
      final nav = _nav;
      if (sessionId != null && sessionId.isNotEmpty && nav != null) {
        nav.push(slideRoute(ChatHistoryScreen(sessionId: sessionId, astrologerName: 'Your astrologer')));
        return;
      }
    }
    // Re-engagement nudge (Feature 2) → open that astrologer's profile.
    if (type == 'reengage') {
      final profileId = data['profileId']?.toString();
      if (profileId != null && profileId.isNotEmpty) {
        _openAstrologer(profileId);
        return;
      }
    }
    _route(_targetForType(type, data));
  }

  /// Resolve + navigate for an external URI:
  ///   rudraganga://wallet            https://rudraganga.app/wallet
  ///   rudraganga://astrologers       https://rudraganga.app/astrologers
  ///   rudraganga://pooja             rudraganga://notifications
  ///   rudraganga://profile           rudraganga://settings/notifications
  static void fromUri(String raw) {
    final uri = Uri.tryParse(raw.trim());
    if (uri == null) return;
    // For a custom scheme the path lives in `host` (rudraganga://wallet → host=wallet);
    // for https it lives in the path segments.
    final seg = <String>[
      if (uri.scheme != 'http' && uri.scheme != 'https' && uri.host.isNotEmpty) uri.host,
      ...uri.pathSegments,
    ].where((s) => s.isNotEmpty).toList();
    if (seg.isEmpty) return;
    // rudraganga://notification/<type> → route by the built-in type map.
    if (seg.first == 'notification' && seg.length >= 2) {
      _route(_targetForType(seg[1], const {}));
      return;
    }
    // rudraganga://product/<id> → that product's detail page (needs the id, so
    // handled here rather than via the param-less _Target factories).
    if ((seg.first == 'product' || seg.first == 'products') && seg.length >= 2 && _isObjectId(seg[1])) {
      final nav = _nav;
      if (nav != null) nav.push(slideRoute(ProductDetailScreen(productId: seg[1])));
      return;
    }
    // rudraganga://live/<liveSessionId> → open that live broadcast room.
    if (seg.first == 'live' && seg.length >= 2 && seg[1].isNotEmpty) {
      final nav = _nav;
      if (nav != null) {
        nav.push(slideRoute(LiveAudienceScreen(liveSessionId: seg[1], headline: 'Live now')));
      }
      return;
    }
    // rudraganga://astrologer/<id> → that astrologer's detail page; bare → list.
    if (seg.first == 'astrologer' || seg.first == 'astrologers') {
      if (seg.length >= 2 && _isObjectId(seg[1])) {
        _openAstrologer(seg[1]);
        return;
      }
      _route(const _Target.astrologers());
      return;
    }
    // rudraganga://chat-history/<sessionId> → that chat's history (with its AI
    // recap, if published). sessionId is a UUID, not a Mongo ObjectId.
    if (seg.first == 'chat-history' && seg.length >= 2 && seg[1].isNotEmpty) {
      final nav = _nav;
      if (nav != null) {
        nav.push(slideRoute(ChatHistoryScreen(sessionId: seg[1], astrologerName: 'Your astrologer')));
      }
      return;
    }
    // rudraganga://order/<id> → that order's detail page; bare → orders list.
    if (seg.first == 'order' || seg.first == 'orders') {
      final nav = _nav;
      if (nav != null) {
        nav.push(slideRoute(seg.length >= 2 && _isObjectId(seg[1])
            ? OrderDetailScreen(orderId: seg[1])
            : const OrdersScreen()));
      }
      return;
    }
    _route(_targetForPath(seg));
  }

  static bool _isObjectId(String s) => RegExp(r'^[a-f0-9]{24}$', caseSensitive: false).hasMatch(s);

  /// Fetch one astrologer by profile id and open their detail page. Used by the
  /// "astrologer is online" notification ("tap to connect") and the
  /// rudraganga://astrologer/<id> deep link. Falls back to the astrologers list
  /// if the navigator isn't ready or the fetch fails.
  static Future<void> _openAstrologer(String profileId) async {
    final nav = _nav;
    final ctx = navigatorKey.currentContext;
    if (nav == null || ctx == null) return;
    try {
      final a = await ctx.read<AstrologerApi>().getPublic(profileId);
      // `nav` may have changed across the await; re-read.
      navigatorKey.currentState?.push(slideRoute(AstrologerProfileScreen(
        profileId: a.id,
        userId: a.userId,
        bio: a.bio,
        avatar: a.avatar,
        coverPhoto: a.coverPhoto,
        name: a.name,
        desc: a.expertise.isNotEmpty ? a.expertise.join(', ') : 'Vedic astrology',
        languages: a.languages.isNotEmpty ? a.languages.join(', ') : 'Hindi, English',
        gifts: 0,
        followers: '${a.reviewCount}',
        call: a.callRate, chat: a.chatRate, video: a.videoRate,
        status: a.cardStatus,
      )));
    } catch (_) {
      navigatorKey.currentState?.push(slideRoute(const AstrologerListScreen()));
    }
  }

  /// The canonical shareable https link for a product (also opens the app via
  /// App Links). Keep in sync with the deep-link router above.
  static String productShareUrl(String productId) => 'https://rudraganga.app/product/$productId';

  /// Open an admin-managed banner's tap target. The `link` is a value chosen in
  /// the admin "Tap target" dropdown:
  ///   • '' / null              → not tappable (no-op)
  ///   • 'pooja/<id>'           → that pooja's detail page (direct)
  ///   • 'pooja?category=<id>'  → the pooja list filtered to a category
  ///   • a known target slug    → internal screen (wallet/astrologers/pooja/…)
  ///   • an http(s):// URL      → opened in the device browser
  static Future<void> openBannerLink(String? link) async {
    final l = (link ?? '').trim();
    if (l.isEmpty) return;
    if (l.startsWith('http://') || l.startsWith('https://')) {
      final uri = Uri.tryParse(l);
      if (uri != null && await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
      return;
    }
    final nav = _nav;
    if (nav == null) return;
    // A specific pooja → push its detail page.
    final m = RegExp(r'^pooja/([a-f0-9]{24})$', caseSensitive: false).firstMatch(l);
    if (m != null) {
      nav.push(slideRoute(PoojaDetailScreen(poojaId: m.group(1)!)));
      return;
    }
    // A category → open the pooja list pre-filtered to it.
    final cm = RegExp(r'^pooja\?category=([a-f0-9]{24})$', caseSensitive: false).firstMatch(l);
    if (cm != null) {
      nav.push(slideRoute(PoojaListScreen(initialCategoryId: cm.group(1))));
      return;
    }
    fromUri(l); // any other internal slug → existing screen router
  }

  // ── type → target (built-in system notifications) ──
  static _Target _targetForType(String type, Map<String, dynamic> data) {
    switch (type) {
      case 'withdrawal_status':
      case 'wallet':
        return const _Target.wallet();
      case 'incoming_request':
      case 'missed_call':
      case 'astrologer_available':
        return const _Target.astrologers();
      case 'pooja_status':
        return const _Target.pooja();
      case 'session_started':
      case 'request_accepted':
        // A live session resumes automatically once the socket reconnects (the
        // SessionProvider holds it). Open the astrologers area as a safe anchor.
        return const _Target.astrologers();
      case 'order_status':
      case 'gift_received':
      case 'system':
      default:
        return const _Target.notifications();
    }
  }

  // ── path → target (external URIs / admin deep-links) ──
  static _Target _targetForPath(List<String> seg) {
    switch (seg.first) {
      case 'wallet':
        return const _Target.wallet();
      case 'astrologers':
      case 'astrologer':
        return const _Target.astrologers();
      case 'pooja':
      case 'poojas':
        return const _Target.pooja();
      case 'profile':
        return const _Target.profile();
      case 'settings':
        return const _Target.settings();
      case 'notifications':
      default:
        return const _Target.notifications();
    }
  }

  static void _route(_Target t) {
    final nav = _nav;
    if (nav == null) return; // navigator not mounted yet (e.g. very early cold start)
    nav.push(slideRoute(t.build()));
  }
}

/// A resolved navigation target. Kept tiny so the resolver stays declarative.
class _Target {
  final Widget Function() build;
  const _Target.wallet() : build = _wallet;
  const _Target.astrologers() : build = _astrologers;
  const _Target.pooja() : build = _pooja;
  const _Target.profile() : build = _profile;
  const _Target.settings() : build = _settings;
  const _Target.notifications() : build = _notifications;
}

Widget _wallet() => const WalletScreen();
Widget _astrologers() => const AstrologerListScreen();
Widget _pooja() => const PoojaListScreen();
Widget _profile() => const MyProfileScreen();
Widget _settings() => const NotifSettingsScreen();
Widget _notifications() => const NotificationsScreen();

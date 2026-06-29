import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/astrologer_api.dart';
import '../../api/gift_api.dart';
import '../../api/profile_api.dart';
import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/session_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/cover_assets.dart';
import '../../theme/rg_colors.dart';
import '../common/coming_soon_screen.dart';
import '../../widgets/cached_image.dart';
import '../../widgets/slide_route.dart';
import '../consult/requesting_screen.dart';
import '../live/live_audience_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../wallet/wallet_screen.dart';
import 'astrologer_store_screen.dart';
import 'gift_sheet.dart';

/// Outcome of the pre-consult profile-completion gate.
enum _GateResult { complete, skip }

/// Detailed astrologer profile: cover photo, avatar, rating, follow + send-gift,
/// languages, bio, lifetime stats, gifts received, reviews. The action bar is
/// status-aware: online → Chat/Call/Video; busy/offline → a "Notify me" button
/// (or "you'll be notified" once requested). Status updates live over the socket.
class AstrologerProfileScreen extends StatefulWidget {
  final String name;
  final String desc;
  final String languages;
  final int gifts;
  final String followers;
  final int call;
  final int chat;
  final int video;
  final String status;
  final String? profileId; // AstrologerProfile id (null for static/dummy)
  final String? userId; // owning user id — matches live socket presence events
  final String? bio; // real admin/astrologer-authored About text
  final String? avatar; // uploaded profile photo URL
  final String? coverPhoto; // uploaded wide cover/banner URL

  const AstrologerProfileScreen({
    super.key,
    required this.name,
    required this.desc,
    required this.languages,
    required this.gifts,
    required this.followers,
    required this.call,
    required this.chat,
    required this.video,
    required this.status,
    this.profileId,
    this.userId,
    this.bio,
    this.avatar,
    this.coverPhoto,
  });

  @override
  State<AstrologerProfileScreen> createState() => _AstrologerProfileScreenState();
}

class _AstrologerProfileScreenState extends State<AstrologerProfileScreen> {
  bool _following = false;

  // Live followers count (null until loaded → falls back to the passed label).
  int? _followers;

  // Live status (seeded from the param, then patched by socket events).
  late String _status = widget.status;
  String? _liveSessionId; // set when _status == 'live' — the broadcast to join
  StreamSubscription? _statusSub;

  // Services the user is already waiting on (restored from backend on open).
  final Set<String> _notified = {};

  // Real reviews + gifts-received (null = loading; empty list = none).
  List<AstroReview>? _reviews;
  List<ReceivedGift>? _giftsReceived;

  // Re-fetch the live status whenever a consultation ends, since the user may
  // have stayed on this screen (it sits under the call/chat screen) and missed
  // the live broadcast, or the astro's status flipped busy→available.
  SessionProvider? _session;
  SessionPhase _lastPhase = SessionPhase.idle;
  void _onSessionPhase() {
    final s = _session;
    if (s == null || !mounted) return;
    // Refresh as soon as the session reaches a terminal/cleared state. We watch
    // for the transition INTO `ended` (the session-ended event) AND into `idle`
    // (clear() after the summary dialog). Triggering on `ended` is the important
    // one: the previous code only fired on `→ idle`, but if the user dismissed
    // the summary differently (or clear() lagged) the screen never re-pulled and
    // stayed stuck on a stale 'offline'. Either transition now kicks the refresh.
    final reachedEnd = _lastPhase != SessionPhase.ended && s.phase == SessionPhase.ended;
    final reachedIdle = _lastPhase != SessionPhase.idle && s.phase == SessionPhase.idle;
    if (reachedEnd || reachedIdle) {
      _refreshStatus(); // re-pull live status (the astrologer is free now)
    }
    _lastPhase = s.phase;
  }

  // Re-pull the live status, retrying briefly. A just-ended session writes the
  // astrologer's post-call status on the backend (busy → available, presence
  // recomputed) ASYNCHRONOUSLY; a single immediate fetch can race that write and
  // read a transient 'offline'. We poll a few times with backoff and stop as
  // soon as the status settles to a live value (online/busy) — which is why the
  // astrologer app (still connected) shows online while this screen showed a
  // stale offline. Guarded by a token so overlapping refreshes don't fight.
  int _refreshToken = 0;
  Future<void> _refreshStatus() async {
    final id = widget.profileId;
    if (id == null) return;
    final myToken = ++_refreshToken;
    // Poll past the slowest case: a VIDEO call's heavy Agora teardown delays the
    // astrologer's post-call presence re-assert by a couple of seconds, so the
    // window must extend well beyond it (chat/call settle almost immediately).
    const delays = [
      Duration.zero,
      Duration(milliseconds: 400),
      Duration(milliseconds: 900),
      Duration(seconds: 2),
      Duration(seconds: 3),
      Duration(seconds: 4),
    ];
    for (final d in delays) {
      if (d > Duration.zero) await Future.delayed(d);
      if (!mounted || myToken != _refreshToken) return; // superseded / disposed
      try {
        final a = await context.read<AstrologerApi>().getPublic(id, forceRefresh: true);
        if (!mounted || myToken != _refreshToken) return;
        setState(() { _status = a.cardStatus; _liveSessionId = a.liveSessionId; if (a.cardStatus == 'online') _notified.clear(); });
        // Settled to a live status → done. Keep polling only while it still
        // reads offline (the case the race produces) in case the write lagged.
        if (a.cardStatus != 'offline') return;
      } catch (_) {/* keep current; try the next attempt */}
    }
  }

  @override
  void initState() {
    super.initState();
    // Keep this astrologer's status fresh via the 3s socket poll while we're here.
    if (widget.profileId != null) {
      context.read<SocketService>().watchAstrologers([widget.profileId!]);
    }
    // Live presence: flip the action bar in real time if the astrologer goes
    // online / busy / offline while the seeker is on this screen.
    _statusSub = context.read<SocketService>().astrologerStatus.listen((s) {
      if (!mounted) return;
      // Match by profile id (preferred) or owning user id.
      final mine = (widget.profileId != null && s.profileId == widget.profileId) ||
          (widget.userId != null && s.profileId == widget.userId);
      if (!mine) return;
      setState(() {
        _status = s.cardStatus;
        if (s.live) _liveSessionId = s.liveSessionId;
        // They're available again → any "notify me" request is now fulfilled, so
        // clear the "you'll be notified" state. This breaks the stuck cycle when
        // an astrologer comes online (and goes offline again), restoring the
        // Notify-me button for the next offline period.
        if (s.cardStatus == 'online') _notified.clear();
      });
    });
    // Re-pull live status when a session ends (covers the missed-broadcast case).
    _session = context.read<SessionProvider>();
    _lastPhase = _session!.phase;
    _session!.addListener(_onSessionPhase);
    // Restore any existing "notify me" requests so we show the right state.
    final id = widget.profileId;
    if (id != null) {
      final profileApi = context.read<ProfileApi>();
      // Fetch the CURRENT live status on open (don't trust the passed-in status,
      // which can be stale after returning from a session). forceRefresh skips
      // the cache so a just-ended session reflects 'online' immediately.
      context.read<AstrologerApi>().getPublic(id, forceRefresh: true).then((a) {
        if (mounted) setState(() { _status = a.cardStatus; _liveSessionId = a.liveSessionId; });
      }).catchError((_) {/* keep current */});
      profileApi.myNotifyRequests(id).then((set) {
        if (mounted && set.isNotEmpty) setState(() => _notified.addAll(set));
      });
      // Restore the Follow/Unfollow button state + live follower count.
      profileApi.myFollow(id).then((f) {
        if (mounted && f != null) setState(() { _following = f.following; _followers = f.followers; });
      });
      // Real reviews + gifts received.
      context.read<AstrologerApi>().reviews(id, limit: 10).then((r) {
        if (mounted) setState(() => _reviews = r);
      }).catchError((_) { if (mounted) setState(() => _reviews = const []); });
      context.read<GiftApi>().received(id).then((g) {
        if (mounted) setState(() => _giftsReceived = g.items);
      }).catchError((_) { if (mounted) setState(() => _giftsReceived = const []); });
    }
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    _session?.removeListener(_onSessionPhase);
    super.dispose();
  }

  /// Tap a service. Online → proceed (Coming soon for now). Busy/offline →
  /// register a "notify me" request and flip to the notified state.
  Future<void> _onService(String service, VoidCallback proceed) async {
    if (_status == 'online') {
      proceed();
      return;
    }
    if (_notified.contains(service)) return; // already waiting
    final id = widget.profileId;
    if (id == null) return; // static/dummy card — nothing to persist
    setState(() => _notified.add(service)); // optimistic
    try {
      await context.read<ProfileApi>().notifyWhenAvailable(id, service);
    } catch (_) {
      if (mounted) setState(() => _notified.remove(service)); // roll back on failure
      return;
    }
    if (!mounted) return;
    final reason = _status == 'busy' ? 'free' : 'online';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(L10n.of(context).weLlLetYouKnowWhen(widget.name, reason)),
        behavior: SnackBarBehavior.floating,
      ));
  }

  /// Start a real consultation of [type] (chat|call|video): profile-completion
  /// gate → balance check → request → RequestingScreen. The astrologer's owning
  /// USER id (widget.userId) is required to address the request.
  Future<void> _startConsult(String type, int ratePerMin) async {
    final astroUserId = widget.userId;
    if (astroUserId == null) {
      // Static/dummy card — nothing real to call.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.of(context).thisAstrologerIsNotAvailableTo)));
      return;
    }

    // ── Profile-completion gate ──
    final gateNav = Navigator.of(context);
    final user = context.read<AuthProvider>().user;
    final hasBirth = user != null && user.profileCompleted && user.birthDetails.dob != null;
    if (!hasBirth) {
      final proceed = await _showProfileGate();
      if (proceed == _GateResult.complete) {
        await gateNav.push(slideRoute(const OnboardingScreen()));
        // Re-read after returning; if still incomplete, allow continuing anyway.
      } else if (proceed == null) {
        return; // dismissed
      }
      // _GateResult.skip → fall through and continue.
    }

    if (!mounted) return;

    // ── Balance check (need at least 1 minute) ──
    final wallet = context.read<WalletProvider>();
    if (ratePerMin > 0 && wallet.balance < ratePerMin) {
      final messenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);
      messenger.showSnackBar(SnackBar(
        content: Text(L10n.of(context).youNeedAtLeastRateperminFor(ratePerMin)),
        action: SnackBarAction(label: 'Recharge', onPressed: () => navigator.push(slideRoute(const WalletScreen()))),
      ));
      return;
    }

    // ── Request ──
    final session = context.read<SessionProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final t = L10n.of(context);
    try {
      await session.request(
        astrologerUserId: astroUserId,
        type: type,
        astrologerName: widget.name,
        astrologerProfileId: widget.profileId,
        astrologerAvatar: widget.avatar,
      );
      if (mounted) navigator.push(slideRoute(const RequestingScreen()));
    } catch (e) {
      final msg = e.toString().toLowerCase();
      final lowBalance = msg.contains('balance') || msg.contains('insufficient') || msg.contains('402');
      messenger.showSnackBar(SnackBar(
        content: Text(lowBalance ? t.notEnoughBalanceToStartPlease : t.couldNotStartTheConsultationPlease),
        action: lowBalance ? SnackBarAction(label: 'Recharge', onPressed: () => navigator.push(slideRoute(const WalletScreen()))) : null,
      ));
    }
  }

  Future<_GateResult?> _showProfileGate() {
    final c = context.rg;
    return showModalBottomSheet<_GateResult>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(22)), border: Border.all(color: c.line)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 18 + MediaQuery.of(ctx).padding.bottom),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.auto_awesome, color: c.gold, size: 38),
            const SizedBox(height: 12),
            Text(L10n.of(context).completeYourProfile, style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(L10n.of(context).addYourDateTimePlaceOf,
                textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.35)),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(ctx, _GateResult.complete), child: Text(L10n.of(context).completeProfile2))),
            TextButton(onPressed: () => Navigator.pop(ctx, _GateResult.skip), child: Text(L10n.of(context).skipForNow, style: TextStyle(color: c.muted))),
          ]),
        ),
      ),
    );
  }

  /// Compact follower count: 12400 → "12.4k", 2_100_000 → "2.1M".
  String _fmtCount(int n) {
    if (n >= 1000000) return L10n.of(context).n1000000Tostringasfixed1M((n / 1000000).toStringAsFixed(1));
    if (n >= 1000) return L10n.of(context).n1000Tostringasfixed1K((n / 1000).toStringAsFixed(1));
    return '$n';
  }

  Future<void> _onFollowTap() async {
    final profileApi = context.read<ProfileApi>();
    final id = widget.profileId;

    if (!_following) {
      // Follow — optimistic, then reconcile count from the server.
      final prev = _followers;
      setState(() { _following = true; if (_followers != null) _followers = _followers! + 1; });
      if (id == null) return; // static/dummy card — nothing to persist
      try {
        final r = await profileApi.setFollow(id, follow: true);
        if (mounted) setState(() { _following = r.following; _followers = r.followers; });
      } catch (_) {
        if (mounted) setState(() { _following = false; _followers = prev; }); // roll back
      }
      return;
    }

    // Unfollow — confirm with an optional reason first.
    final reason = await _askUnfollowReason();
    if (reason == null) return; // cancelled
    final prev = _followers;
    setState(() { _following = false; if (_followers != null && _followers! > 0) _followers = _followers! - 1; });
    if (id == null) return;
    try {
      final r = await profileApi.setFollow(id, follow: false, reason: reason);
      if (mounted) setState(() { _following = r.following; _followers = r.followers; });
    } catch (_) {
      if (mounted) setState(() { _following = true; _followers = prev; }); // roll back
    }
  }

  /// Returns the reason (possibly empty) if confirmed, or null if cancelled.
  Future<String?> _askUnfollowReason() {
    final c = context.rg;
    final ctrl = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (dctx) => AlertDialog(
        backgroundColor: c.ground2,
        title: Text(L10n.of(context).unfollowWidgetName(widget.name), style: TextStyle(color: c.ink, fontSize: 17)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(L10n.of(context).tellUsWhyOptionalItHelps, style: TextStyle(color: c.muted, fontSize: 13)),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              maxLines: 3,
              maxLength: 300,
              decoration: InputDecoration(hintText: L10n.of(context).reasonOptional),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dctx), child: Text(L10n.of(context).cancel, style: TextStyle(color: c.muted))),
          TextButton(onPressed: () => Navigator.pop(dctx, ctrl.text.trim()), child: Text(L10n.of(context).unfollow, style: TextStyle(color: c.red, fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final green = c.green;
    final name = widget.name, desc = widget.desc, status = _status;
    final gifts = widget.gifts;
    // Live follower count once loaded; otherwise the label passed in.
    final followers = _followers != null ? _fmtCount(_followers!) : widget.followers;
    final call = widget.call, chat = widget.chat, video = widget.video;
    final ringColor = switch (status) { 'live' => c.red, 'online' => green, 'busy' => c.red, _ => c.muted };

    void soon(String t, [IconData i = Icons.auto_awesome]) =>
        Navigator.of(context).push(slideRoute(ComingSoonScreen(title: t, icon: i)));

    return Scaffold(
      backgroundColor: c.ground,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ── Cover banner + overlapping avatar (FB/LinkedIn vibe) ──
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Cover image — real uploaded coverPhoto when present, else the
              // deterministic placeholder; both cached, with a gradient fallback.
              SizedBox(
                height: 170,
                width: double.infinity,
                child: CachedImage(
                  url: (widget.coverPhoto != null && widget.coverPhoto!.isNotEmpty)
                      ? widget.coverPhoto
                      : CoverAssets.coverFor(name),
                  fit: BoxFit.cover,
                ),
              ),
              // Dark gradient scrim for legibility.
              Positioned.fill(
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Colors.transparent, c.ground.withValues(alpha: 0.85)],
                    ),
                  ),
                ),
              ),
              // Back + share over the cover.
              Positioned(
                top: MediaQuery.of(context).padding.top + 4, left: 4, right: 4,
                child: Row(children: [
                  _circleBtn(c, Icons.arrow_back, () => Navigator.of(context).pop()),
                  const Spacer(),
                  _circleBtn(c, Icons.ios_share, () => soon(L10n.of(context).share)),
                ]),
              ),
              // Avatar overlapping the bottom edge + a presence dot.
              Positioned(
                left: 20, bottom: -44,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: c.ground, border: Border.all(color: ringColor, width: 3)),
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: c.card,
                        backgroundImage: cachedImageProvider(widget.avatar),
                        child: cachedImageProvider(widget.avatar) == null ? Icon(Icons.person, color: c.muted, size: 44) : null,
                      ),
                    ),
                    Positioned(
                      right: 4, bottom: 4,
                      child: Container(
                        height: 18, width: 18,
                        decoration: BoxDecoration(color: ringColor, shape: BoxShape.circle, border: Border.all(color: c.ground, width: 3)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 52),

          // ── Name, rating, follow + gift ──
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Flexible(child: Text(name, style: TextStyle(color: c.ink, fontSize: 22, fontWeight: FontWeight.w800))),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(color: ringColor.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(20), border: Border.all(color: ringColor.withValues(alpha: 0.5))),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(height: 6, width: 6, decoration: BoxDecoration(color: ringColor, shape: BoxShape.circle)),
                      const SizedBox(width: 5),
                      Text(
                        switch (status) { 'live' => 'LIVE', 'online' => L10n.of(context).statusOnline, 'busy' => L10n.of(context).statusBusy, _ => L10n.of(context).statusOffline },
                        style: TextStyle(color: ringColor, fontSize: 10.5, fontWeight: FontWeight.w800),
                      ),
                    ]),
                  ),
                ]),
                const SizedBox(height: 3),
                Text(desc, style: TextStyle(color: c.muted, fontSize: 13)),
                const SizedBox(height: 8),
                Row(children: [
                  Icon(Icons.star_rounded, color: c.gold, size: 18),
                  const SizedBox(width: 4),
                  Text('4.8', style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
                  Text(L10n.of(context).s21kReviews, style: TextStyle(color: c.muted, fontSize: 12)),
                  const SizedBox(width: 14),
                  Icon(Icons.group_outlined, color: c.gold, size: 16),
                  const SizedBox(width: 4),
                  Text(L10n.of(context).followersFollowers(followers), style: TextStyle(color: c.muted, fontSize: 12)),
                ]),
                const SizedBox(height: 14),
                // Follow + Send Gift + Store (one row).
                Row(children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _onFollowTap,
                      icon: Icon(_following ? Icons.person_remove_outlined : Icons.add, size: 17, color: _following ? c.muted : c.red),
                      label: Text(_following ? 'Unfollow' : L10n.of(context).follow, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: _following ? c.muted : c.red, fontWeight: FontWeight.w700, fontSize: 13)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        side: BorderSide(color: _following ? c.line : c.red),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => showGiftSheet(context, name, astrologerUserId: widget.userId),
                      icon: const Icon(Icons.card_giftcard, size: 17),
                      label: Text(L10n.of(context).gift, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: c.gold, foregroundColor: const Color(0xFF1A1408),
                        minimumSize: const Size.fromHeight(44),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: widget.profileId == null
                          ? null
                          : () => Navigator.of(context).push(slideRoute(AstrologerStoreScreen(profileId: widget.profileId!))),
                      icon: const Icon(Icons.storefront, size: 17),
                      label: Text(L10n.of(context).store, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: c.red, foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(44),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),

          // ── Lifetime stats ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _stat(c, Icons.chat_bubble_outline, '12.4k', L10n.of(context).chats),
                _stat(c, Icons.call, '8.1k', L10n.of(context).calls),
                _stat(c, Icons.videocam_outlined, '3.2k', L10n.of(context).videos),
                _stat(c, Icons.card_giftcard, '$gifts', L10n.of(context).gifts),
              ],
            ),
          ),
          const SizedBox(height: 22),

          // ── Languages ──
          _sectionTitle(c, L10n.of(context).languages),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Wrap(
              spacing: 8, runSpacing: 8,
              children: widget.languages.split(',').map((l) => Chip(
                    label: Text(l.trim(), style: TextStyle(color: c.ink, fontSize: 12.5)),
                    backgroundColor: c.ground2,
                    side: BorderSide(color: c.line),
                    visualDensity: VisualDensity.compact,
                  )).toList(),
            ),
          ),
          const SizedBox(height: 22),

          // ── About ── real admin/astrologer bio; fall back to generated copy
          // only when no bio has been written yet.
          _sectionTitle(c, L10n.of(context).about),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(
              (widget.bio != null && widget.bio!.isNotEmpty)
                  ? widget.bio!
                  : L10n.of(context).nameIsATrustedAstrologerWith(name, desc) +
                      L10n.of(context).theyHaveGuidedThousandsOfSeekers +
                      L10n.of(context).theirReadingsBlendClassicalVedicPrinciples +
                      L10n.of(context).findClarityAndActionableRemediesFor,
              style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.5),
            ),
          ),
          const SizedBox(height: 22),

          // ── Gifts received (real aggregate; hidden when none) ──
          if (_giftsReceived == null) ...[
            _sectionTitle(c, L10n.of(context).giftsReceived),
            const Padding(padding: EdgeInsets.all(16), child: Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)))),
            const SizedBox(height: 22),
          ] else if (_giftsReceived!.isNotEmpty) ...[
            _sectionTitle(c, L10n.of(context).giftsReceived),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 84,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _giftsReceived!.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (_, i) => _giftTile(c, _giftsReceived![i]),
                ),
              ),
            ),
            const SizedBox(height: 22),
          ],

          // ── Reviews (real; hidden when none) ──
          if (_reviews == null) ...[
            _sectionTitle(c, L10n.of(context).reviews),
            const Padding(padding: EdgeInsets.all(16), child: Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)))),
          ] else if (_reviews!.isNotEmpty) ...[
            _sectionTitle(c, L10n.of(context).reviews),
            ..._reviews!.map((r) => _reviewTile(c, r)),
          ],
          const SizedBox(height: 110), // room for bottom action bar
        ],
      ),

      // ── Sticky action bar ── online: Chat/Call/Video; busy/offline: Notify me.
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
        child: SafeArea(
          top: false,
          child: status == 'live'
              ? _joinLiveBar(c)
              : status == 'online'
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _action(c, Icons.chat_bubble_outline, L10n.of(context).chat, L10n.of(context).chatMin(chat), c.gold, const Color(0xFF1A1408), () => _onService('chat', () => _startConsult('chat', chat)))),
                          const SizedBox(width: 8),
                          Expanded(child: _action(c, Icons.call, L10n.of(context).call, L10n.of(context).callMin(call), c.red, Colors.white, () => _onService('call', () => _startConsult('call', call)))),
                          const SizedBox(width: 8),
                          Expanded(child: _action(c, Icons.videocam, L10n.of(context).video, L10n.of(context).videoMin(video), c.blue, Colors.white, () => _onService('video', () => _startConsult('video', video)))),
                        ],
                      ),
                    )
                  : _notifyBar(c, status),
        ),
      ),
    );
  }

  Widget _circleBtn(RgColors c, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(8), child: Icon(icon, color: Colors.white, size: 22)),
      ),
    );
  }

  Widget _stat(RgColors c, IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
        child: Column(children: [
          Icon(icon, color: c.gold, size: 18),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
          Text(label, style: TextStyle(color: c.muted, fontSize: 10.5)),
        ]),
      ),
    );
  }

  Widget _sectionTitle(RgColors c, String t) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: Row(children: [
          Container(width: 3, height: 16, decoration: BoxDecoration(color: c.gold, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 9),
          Text(t, style: TextStyle(color: c.ink, fontSize: 15.5, fontWeight: FontWeight.w800)),
        ]),
      );

  /// A real review row.
  Widget _reviewTile(RgColors c, AstroReview r) {
    final initial = r.name.isNotEmpty ? r.name[0].toUpperCase() : '?';
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(radius: 14, backgroundColor: c.card, child: Text(initial, style: TextStyle(color: c.gold, fontWeight: FontWeight.w700, fontSize: 12))),
            const SizedBox(width: 8),
            Expanded(child: Text(r.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13))),
            Row(children: List.generate(5, (s) => Icon(Icons.star_rounded, size: 13, color: s < r.rating ? c.gold : c.line))),
          ]),
          if (r.comment.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(r.comment, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.4)),
          ],
        ],
      ),
    );
  }

  /// A real gifts-received tile (image when available, else a gift icon).
  Widget _giftTile(RgColors c, ReceivedGift g) {
    return Container(
      width: 72,
      decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 28, width: 28,
            child: (g.image != null && g.image!.isNotEmpty)
                ? CachedImage(url: g.image, fit: BoxFit.contain, fallbackIcon: Icons.card_giftcard)
                : Icon(Icons.card_giftcard, color: c.gold, size: 22),
          ),
          const SizedBox(height: 4),
          Text('×${g.count}', style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  /// Action bar when the astrologer is broadcasting LIVE: a single prominent
  /// "Join live session" button that opens the audience room.
  Widget _joinLiveBar(RgColors c) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          final id = _liveSessionId;
          if (id == null || id.isEmpty) return;
          Navigator.of(context).push(slideRoute(
            LiveAudienceScreen(liveSessionId: id, headline: L10n.of(context).widgetNameIsLive(widget.name)),
          ));
        },
        icon: const Icon(Icons.live_tv),
        label: Text(L10n.of(context).joinLiveSession, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        style: ElevatedButton.styleFrom(
          backgroundColor: c.red, foregroundColor: Colors.white,
          minimumSize: const Size(0, 52),
        ),
      ),
    );
  }

  /// Action bar for a busy/offline astrologer: a one-line status explainer plus
  /// a "Notify me" button — which becomes a calm "you'll be notified" state once
  /// the request is registered (any of chat/call/video counts as notified).
  Widget _notifyBar(RgColors c, String status) {
    final notified = _notified.isNotEmpty;
    // Relevant copy for why the seeker can't connect right now.
    final headline = status == 'busy'
        ? L10n.of(context).widgetNameIsInASession(widget.name)
        : L10n.of(context).widgetNameIsOfflineRightNow(widget.name);
    final sub = notified
        ? (status == 'busy'
            ? L10n.of(context).weLlNotifyYouTheMoment
            : L10n.of(context).weLlNotifyYouTheMoment2)
        : L10n.of(context).getAHeadsUpTheMoment;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(status == 'busy' ? Icons.hourglass_top : Icons.nightlight_round, size: 15, color: c.muted),
          const SizedBox(width: 6),
          Expanded(child: Text(headline, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13))),
        ]),
        const SizedBox(height: 2),
        Text(sub, style: TextStyle(color: c.muted, fontSize: 11.5)),
        const SizedBox(height: 10),
        if (notified)
          // Calm "already notified" confirmation — not a tappable button.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: c.green.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: c.green.withValues(alpha: 0.5)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.check_circle, size: 16, color: c.green),
              const SizedBox(width: 7),
              Text(L10n.of(context).youLlBeNotified, style: TextStyle(color: c.green, fontWeight: FontWeight.w800, fontSize: 13)),
            ]),
          )
        else
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _onService('chat', () {}),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(12)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.notifications_active_outlined, size: 16, color: Colors.white),
                const SizedBox(width: 7),
                Text(L10n.of(context).notifyMe, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
              ]),
            ),
          ),
      ],
    );
  }

  Widget _action(RgColors c, IconData icon, String label, String price, Color bg, Color fg, VoidCallback onTap) {
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(icon, color: fg, size: 16),
                const SizedBox(width: 6),
                Text(label, style: TextStyle(color: fg, fontWeight: FontWeight.w800, fontSize: 13)),
              ]),
              Text(price, style: TextStyle(color: fg.withValues(alpha: 0.85), fontSize: 10.5)),
            ],
          ),
        ),
      ),
    );
  }
}


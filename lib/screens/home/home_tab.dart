import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../api/app_config_service.dart';
import '../../api/astrologer_api.dart';
import '../../api/category_api.dart';
import '../../api/profile_api.dart';
import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/notifications_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../services/deep_link.dart';
import '../../theme/rg_colors.dart';
import '../common/coming_soon_screen.dart';
import '../horoscope/horoscope_screen.dart';
import '../panchang/panchang_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../../widgets/slide_route.dart';
import '../astrologers/astrologer_profile_screen.dart';
import '../astrologers/astrologer_list_screen.dart';
import '../notifications/notifications_screen.dart';
import '../pooja/pooja_list_screen.dart';
import '../shop/product_list_screen.dart';
import '../videos/video_list_screen.dart';
import '../videos/youtube_player_screen.dart';
import '../wallet/wallet_screen.dart';
import 'widgets/astrologer_card.dart';
import 'widgets/home_bits.dart';
import 'widgets/section_header.dart';

/// Bumped to force the home astrologer rails to re-fetch their live lists (used
/// when the app returns to the foreground, so stale online/offline status is
/// corrected immediately instead of waiting for a socket broadcast that the
/// backend doesn't replay to a freshly-resumed client). The shell ticks this on
/// AppLifecycleState.resumed; each rail listens and reloads.
final ValueNotifier<int> homeRefreshTick = ValueNotifier<int>(0);

/// Home tab — dense, AstroSage-style static UI. Taps route to Coming soon.
class HomeTab extends StatelessWidget {
  /// Opens the shell's side drawer (the shell owns the Scaffold with the drawer).
  final VoidCallback? onMenu;
  const HomeTab({super.key, this.onMenu});

  void _soon(BuildContext context, String title, [IconData icon = Icons.auto_awesome]) {
    Navigator.of(context).push(slideRoute(ComingSoonScreen(title: title, icon: icon)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final auth = context.watch<AuthProvider>();
    final cfg = context.watch<AppConfigService>();
    final unread = context.watch<NotificationsProvider>().unread;
    final balance = context.watch<WalletProvider>().balance;
    final user = auth.user;
    final name = (user?.name?.trim().isNotEmpty ?? false) ? user!.name! : t.seeker;

    return Scaffold(
      backgroundColor: c.ground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _TopBar(
              name: name, tokens: balance, avatar: user?.avatar, onMenu: onMenu, unread: unread,
              onWallet: () => Navigator.of(context).push(slideRoute(const WalletScreen())),
              onBell: () => Navigator.of(context).push(slideRoute(const NotificationsScreen())),
            ),

            // ── Row 1: Kundli CTAs ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  _FeatureTile(icon: Icons.grid_view_rounded, svgAsset: 'assets/images/ic_free_kundli.svg', label: t.kFreeKundli, onTap: () => _soon(context, t.kFreeKundli, Icons.grid_view_rounded)),
                  _FeatureTile(icon: Icons.favorite, label: t.kMatching, onTap: () => _soon(context, t.kMatching, Icons.favorite)),
                  _FeatureTile(icon: Icons.menu_book_outlined, label: t.kBrihat, onTap: () => _soon(context, t.kBrihat, Icons.menu_book_outlined)),
                  _FeatureTile(icon: Icons.auto_awesome, svgAsset: 'assets/images/ic_kundli_ai.svg', label: t.kKundliAi, onTap: () => _soon(context, t.kKundliAi, Icons.auto_awesome)),
                ],
              ),
            ),

            // ── Row 2: Career / life topics ──
            SizedBox(
              height: 96,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                children: [
                  _TopicChip(icon: Icons.work_outline, label: t.tCareer, onTap: () => _soon(context, t.tCareer)),
                  _TopicChip(icon: Icons.volunteer_activism_outlined, label: t.tMarriage, onTap: () => _soon(context, t.tMarriage)),
                  _TopicChip(icon: Icons.show_chart, label: t.tFinance, onTap: () => _soon(context, t.tFinance)),
                  _TopicChip(icon: Icons.health_and_safety_outlined, label: t.tHealth, onTap: () => _soon(context, t.tHealth)),
                  _TopicChip(icon: Icons.school_outlined, label: t.tEducation, onTap: () => _soon(context, t.tEducation)),
                  _TopicChip(icon: Icons.flight_takeoff_outlined, label: t.tTravel, onTap: () => _soon(context, t.tTravel)),
                ],
              ),
            ),

            // ── Profile nudge (only if incomplete) ──
            if (user != null && !user.profileCompleted)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                child: _Nudge(onTap: () => Navigator.of(context).push(slideRoute(const OnboardingScreen()))),
              ),

            // ── Promo banner (admin-managed; hidden if toggled off OR none) ──
            if (cfg.showBanners && cfg.banners.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _PromoCarousel(banners: cfg.banners, onTap: () => _soon(context, t.offers, Icons.local_offer_outlined)),
              ),

            // ── Book a Pooja banner (hidden if toggled off OR no banners) ──
            if (cfg.showPooja && cfg.poojaBanners.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                child: _BookPoojaBanner(banners: cfg.poojaBanners, onTap: () => Navigator.of(context).push(slideRoute(const PoojaListScreen()))),
              ),

            // ── Featured astrologers (API-only; header + rail hide when empty) ──
            if (cfg.showFeatured) _FeaturedRail(title: t.secFeatured, seeAllLabel: t.seeAll),

            // ── Nearby astrologers (location-aware; API-bound by city) ──
            if (cfg.showNearby) _NearbySection(title: t.secNearby, seeAllLabel: t.seeAll),

            // ── Available / Call & Chat (random ONLINE astrologers; API-only,
            //    header + rail hide when empty) ──
            _CallChatRail(title: t.secCallChat, seeAllLabel: t.seeAll),

            // ── AI astrologers ── hidden until a real AI-astrologer backend
            // exists. No dummy placeholders; the whole section (header + CTA)
            // stays hidden while there's nothing real to show.
            // (Re-enable with an API-bound rail once AI astrologers are live.)

            // ── Products (category chips, API-bound with images) ──
            SectionHeader(t.secProducts, seeAllLabel: t.seeAll,
                onSeeAll: () => Navigator.of(context).push(slideRoute(
                    ProductListScreen(title: t.secProducts)))),
            const _ProductsRail(),

            // ── Videos (admin-managed YouTube; section hidden when there's none) ──
            if (cfg.showVideos && cfg.videos.isNotEmpty) ...[
              SectionHeader(t.secVideos, seeAllLabel: t.seeAll,
                  onSeeAll: () => Navigator.of(context).push(slideRoute(VideoListScreen(kind: 'video', title: t.secVideos)))),
              _videoRail(context, cfg.videos),
            ],

            // ── Astrology's lessons (hidden when there's none) ──
            if (cfg.showLessons && cfg.lessons.isNotEmpty) ...[
              SectionHeader(t.secLessons, seeAllLabel: t.seeAll,
                  onSeeAll: () => Navigator.of(context).push(slideRoute(VideoListScreen(kind: 'lesson', title: t.secLessons)))),
              _videoRail(context, cfg.lessons),
            ],

            // ── Others (icon grid) ──
            SectionHeader(t.secOthers),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: 0.82,
                children: [
                  OthersIcon(icon: Icons.calendar_month_outlined, label: t.dailyPanchang, onTap: () => Navigator.of(context).push(slideRoute(const PanchangScreen()))),
                  OthersIcon(icon: Icons.support_agent_outlined, label: t.talkToAstrologer, onTap: () => _soon(context, t.astrologers)),
                  OthersIcon(icon: Icons.menu_book_outlined, label: t.brihatKundli, onTap: () => _soon(context, t.brihatKundli, Icons.menu_book_outlined)),
                  OthersIcon(icon: Icons.edit_note_outlined, label: t.dailyNotes, onTap: () => _soon(context, t.dailyNotes, Icons.edit_note_outlined)),
                  OthersIcon(icon: Icons.help_outline, label: t.askAQuestion, onTap: () => _soon(context, t.askAQuestion, Icons.help_outline)),
                  OthersIcon(icon: Icons.auto_awesome, svgAsset: 'assets/images/ic_kundli_ai.svg', label: 'Kundli AI+', onTap: () => _soon(context, 'Kundli AI+', Icons.auto_awesome)),
                  OthersIcon(icon: Icons.pin_outlined, label: t.numerology, onTap: () => _soon(context, t.numerology, Icons.pin_outlined)),
                  OthersIcon(icon: Icons.picture_as_pdf_outlined, label: t.free50Pages, onTap: () => _soon(context, t.freeReport, Icons.picture_as_pdf_outlined)),
                  OthersIcon(icon: Icons.diversity_3_outlined, label: t.freeMatrimony, onTap: () => _soon(context, t.matrimony, Icons.diversity_3_outlined)),
                  OthersIcon(icon: Icons.book_outlined, label: t.lalKitab, onTap: () => _soon(context, t.lalKitab, Icons.book_outlined)),
                  OthersIcon(icon: Icons.favorite_border, label: t.loveMatch, onTap: () => _soon(context, t.loveMatch, Icons.favorite_border)),
                  OthersIcon(icon: Icons.nightlight_outlined, label: t.horoscope, onTap: () => Navigator.of(context).push(slideRoute(const HoroscopeScreen()))),
                ],
              ),
            ),

            // ── History ──
            SectionHeader(t.secHistory, seeAllLabel: t.seeAll, onSeeAll: () => _soon(context, t.secHistory)),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: _EmptyHistory(hint: t.startReadingHint, startLabel: t.startBtn, onTap: () => _soon(context, t.secFeatured)),
            ),

            // ── Share ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 20),
              child: ElevatedButton.icon(
                onPressed: () => _soon(context, t.shareApp, Icons.ios_share),
                icon: const Icon(Icons.ios_share, size: 18),
                label: Text(t.shareApp),
                style: ElevatedButton.styleFrom(
                  backgroundColor: c.gold,
                  foregroundColor: const Color(0xFF1A1408),
                  minimumSize: const Size.fromHeight(52),
                ),
              ),
            ),

            const SizedBox(height: 96), // room for floating buttons + navbar
          ],
        ),
      ),
    );
  }

  /// Videos/lessons rail: admin-managed YouTube items. Tapping a card plays the
  /// video INSIDE the app (WebView). Only rendered when the list is non-empty.
  Widget _videoRail(BuildContext context, List<Map<String, dynamic>> items) {
    return SizedBox(
      height: 162,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: items.map((v) => VideoCard(
              title: (v['title'] ?? '').toString(),
              thumbnail: (v['thumbnail'] ?? '').toString().isEmpty ? null : v['thumbnail'].toString(),
              onTap: () => Navigator.of(context).push(slideRoute(YouTubePlayerScreen(
                youtubeId: (v['youtubeId'] ?? '').toString(),
                youtubeUrl: (v['youtubeUrl'] ?? '').toString(),
                title: (v['title'] ?? L10n.of(context).video).toString(),
              ))),
            )).toList(),
      ),
    );
  }

}

// ───────────────────────── private widgets ─────────────────────────

/// Home "Featured" rail bound to the public astrologers API. Shows the static
/// [fallback] cards while the first fetch is in flight (or if it fails), so the
/// home never renders an empty/janky rail.
class _FeaturedRail extends StatefulWidget {
  final String title;
  final String seeAllLabel;
  const _FeaturedRail({required this.title, required this.seeAllLabel});

  @override
  State<_FeaturedRail> createState() => _FeaturedRailState();
}

class _FeaturedRailState extends State<_FeaturedRail> {
  List<Astrologer>? _items; // null = not loaded yet → show fallback
  StreamSubscription? _statusSub;

  @override
  void initState() {
    super.initState();
    _load();
    _statusSub = context.read<SocketService>().astrologerStatus.listen((s) {
      setState(() => _items = patchAstroStatus(_items, s));
    });
    homeRefreshTick.addListener(_load); // re-fetch live status on app resume
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    homeRefreshTick.removeListener(_load);
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final list = await context.read<AstrologerApi>().list(featured: true, limit: 10);
      if (mounted) {
        setState(() => _items = list);
        // Register these ids with the 3s status poll so cards self-correct.
        context.read<SocketService>().watchAstrologers(list.map((a) => a.id));
      }
    } catch (_) {
      // Keep the static fallback on error.
    }
  }

  @override
  Widget build(BuildContext context) {
    // API-only: no dummy fallback. While loading show nothing (no header flash);
    // when loaded-empty hide the whole section (header + CTA). Only render the
    // header once there are real astrologers.
    final live = _items;
    if (live == null || live.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(widget.title, seeAllLabel: widget.seeAllLabel,
            onSeeAll: () => Navigator.of(context).push(slideRoute(
                AstrologerListScreen(featured: true, title: widget.title)))),
        SizedBox(
          height: 158,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: live.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (_, i) => _liveAstroRailCard(context, live[i]),
          ),
        ),
      ],
    );
  }
}

/// Return a new list with the matching astrologer's live status patched, or the
/// same list reference if it isn't present. Shared by all API-bound home rails.
List<Astrologer>? patchAstroStatus(List<Astrologer>? items, AstrologerStatus s) {
  if (items == null) return null;
  final i = items.indexWhere((a) => a.id == s.profileId);
  if (i < 0) return items;
  final next = [...items];
  next[i] = next[i].copyWith(isOnline: s.isOnline, currentCallStatus: s.currentCallStatus);
  return next;
}

/// One live-astrologer card for the home rails (tap → profile). Shared by the
/// Featured / Call-&-Chat / Nearby rails so they look identical.
Widget _liveAstroRailCard(BuildContext context, Astrologer a) => GestureDetector(
      onTap: () => Navigator.of(context).push(slideRoute(AstrologerProfileScreen(
        profileId: a.id,
        userId: a.userId,
        bio: a.bio,
        avatar: a.avatar,
        coverPhoto: a.coverPhoto,
        name: a.name,
        desc: a.expertise.isNotEmpty ? a.expertise.join(', ') : L10n.of(context).vedicAstrology,
        languages: a.languages.isNotEmpty ? a.languages.join(', ') : L10n.of(context).hindiEnglish,
        gifts: 0, followers: '${a.reviewCount}',
        call: a.callRate, chat: a.chatRate, video: a.videoRate,
        status: a.cardStatus,
      ))),
      child: AstrologerCard(
        name: a.name, ratePerMin: a.minRate, status: a.cardStatus,
        languages: a.languages, rating: a.rating, imageUrl: a.avatar,
      ),
    );

/// Home "Call & Chat" rail — a small set of RANDOM, currently-ONLINE
/// astrologers (server-side $sample; never offline). "See all" opens the full
/// directory (incl. offline) with search/filters/categories. Falls back to the
/// static rail while the first fetch is in flight or if it fails.
class _CallChatRail extends StatefulWidget {
  final String title;
  final String seeAllLabel;
  const _CallChatRail({required this.title, required this.seeAllLabel});

  @override
  State<_CallChatRail> createState() => _CallChatRailState();
}

class _CallChatRailState extends State<_CallChatRail> {
  List<Astrologer>? _items; // null = not loaded → fallback
  StreamSubscription? _statusSub;

  @override
  void initState() {
    super.initState();
    _load();
    _statusSub = context.read<SocketService>().astrologerStatus.listen((s) {
      if (!mounted) return;
      // This rail is "online now": drop anyone who just went offline; patch the
      // rest (e.g. available → busy) in place.
      final cur = _items;
      if (cur == null) return;
      final i = cur.indexWhere((a) => a.id == s.profileId);
      if (i < 0) return;
      setState(() {
        if (!s.isOnline) {
          _items = [...cur]..removeAt(i);
        } else {
          _items = patchAstroStatus(cur, s);
        }
      });
    });
    homeRefreshTick.addListener(_load); // re-fetch live status on app resume
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    homeRefreshTick.removeListener(_load);
    super.dispose();
  }

  Future<void> _load() async {
    try {
      // Random + online only → a fresh, "available now" selection each visit.
      final list = await context.read<AstrologerApi>().list(online: true, random: true, limit: 4);
      if (mounted) {
        setState(() => _items = list);
        context.read<SocketService>().watchAstrologers(list.map((a) => a.id));
      }
    } catch (_) {/* keep static fallback */}
  }

  @override
  Widget build(BuildContext context) {
    // API-only: no dummy fallback. Hide the whole section (header + CTA) until
    // there are real online astrologers to show.
    final live = _items;
    if (live == null || live.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(widget.title, seeAllLabel: widget.seeAllLabel,
            onSeeAll: () => Navigator.of(context).push(slideRoute(
                AstrologerListScreen(title: widget.title)))),
        SizedBox(
          height: 158,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: live.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (_, i) => _liveAstroRailCard(context, live[i]),
          ),
        ),
      ],
    );
  }
}

/// Products rail — admin-managed product categories (name + image) from the
/// API, shown as circular chips. Hidden entirely until at least one category
/// loads (no static fallback — these are fully admin-driven).
class _ProductsRail extends StatefulWidget {
  const _ProductsRail();

  @override
  State<_ProductsRail> createState() => _ProductsRailState();
}

class _ProductsRailState extends State<_ProductsRail> {
  List<Category>? _items; // null = loading

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final list = await context.read<CategoryApi>().list();
      if (mounted) setState(() => _items = list);
    } catch (_) {
      if (mounted) setState(() => _items = const []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    // While loading → reserve the row height so the page doesn't jump.
    if (items == null) return const SizedBox(height: 100);
    if (items.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (_, i) {
          final cat = items[i];
          // Tapping a category → Products list pre-filtered to that category.
          return ProductChip(
            label: cat.name, imageUrl: cat.image,
            onTap: () => Navigator.of(context).push(slideRoute(
                ProductListScreen(title: cat.name, initialCategoryId: cat.id))),
          );
        },
      ),
    );
  }
}

/// Nearby astrologers — resolves the device's city (GPS → backend reverse
/// geocode), shows it beside the header in small text, and lists astrologers
/// in that city via the API. Falls back to the static rail (and no city label)
/// when location is unavailable or the fetch fails.
class _NearbySection extends StatefulWidget {
  final String title;
  final String seeAllLabel;
  const _NearbySection({required this.title, required this.seeAllLabel});

  @override
  State<_NearbySection> createState() => _NearbySectionState();
}

class _NearbySectionState extends State<_NearbySection> {
  String? _city; // resolved city label, e.g. "Bengaluru, Karnataka"
  bool _locating = true; // resolving location
  bool _loaded = false; // the API list call has completed at least once
  List<Astrologer>? _items; // null = not loaded → fallback rail
  StreamSubscription? _statusSub;

  @override
  void initState() {
    super.initState();
    _resolve();
    _statusSub = context.read<SocketService>().astrologerStatus.listen((s) {
      if (mounted) setState(() => _items = patchAstroStatus(_items, s));
    });
    homeRefreshTick.addListener(_resolve); // re-fetch live status on app resume
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    homeRefreshTick.removeListener(_resolve);
    super.dispose();
  }

  /// Best-effort: get coarse coords (if permission already granted), reverse
  /// geocode to a city, then load that city's astrologers. Never prompts here —
  /// permission is asked once during onboarding; we just use it if available.
  Future<void> _resolve() async {
    final t = L10n.of(context);
    String? city;
    try {
      final perm = await Geolocator.checkPermission();
      debugPrint(t.nearbyPermissionPerm(perm));
      if (perm == LocationPermission.always || perm == LocationPermission.whileInUse) {
        // getCurrentPosition can hang on emulators with no live fix — fall back
        // to the last known position if it times out / returns null.
        Position? pos;
        try {
          pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
              .timeout(const Duration(seconds: 6));
        } catch (e) {
          debugPrint(t.nearbyGetcurrentpositionFailedETryingLast(e));
          pos = await Geolocator.getLastKnownPosition();
        }
        pos ??= await Geolocator.getLastKnownPosition();
        debugPrint(t.nearbyPositionPosLatitudePosLongitude(pos?.latitude ?? 'null', pos?.longitude ?? 'null'));
        if (!mounted) return;
        if (pos != null) {
          city = await context.read<ProfileApi>().reverseGeocode(pos.latitude, pos.longitude);
          debugPrint(t.nearbyReversegeocodeCityCity(city));
        }
      }
    } catch (e) {
      debugPrint(t.nearbyResolveErrorE(e)); // optional — fall through to no-city list
    }

    if (!mounted) return;
    setState(() { _city = (city ?? '').isEmpty ? null : city; _locating = false; });
    await _load();
  }

  Future<void> _load() async {
    try {
      final list = await context.read<AstrologerApi>().list(city: _city, limit: 10);
      if (mounted) {
        setState(() { _items = list; _loaded = true; });
        context.read<SocketService>().watchAstrologers(list.map((a) => a.id));
      }
    } catch (_) {
      if (mounted) setState(() => _loaded = true); // keep fallback rail
    }
  }

  void _openSeeAll() {
    Navigator.of(context).push(slideRoute(AstrologerListScreen(
      title: widget.title,
      initialCity: _city,
    )));
  }

  @override
  Widget build(BuildContext context) {
    // While location is still resolving (undefined / "Locating…"), hide the whole
    // section — header, "See all" CTA and rail — until a city is found. No point
    // showing a nearby CTA before we know where "nearby" is.
    if (_locating) {
      return const SizedBox.shrink();
    }
    // Hide the entire section (header + rail) once we've resolved a city and the
    // API confirms there are no astrologers there — no point showing an empty CTA.
    if (_loaded && _city != null && (_items?.isEmpty ?? false)) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          widget.title,
          // Show just the city (drop ", State") so the chip stays short.
          subtitle: _locating ? L10n.of(context).locating : _city?.split(',').first.trim(),
          subtitleIcon: Icons.location_on_outlined,
          seeAllLabel: widget.seeAllLabel,
          onSeeAll: _openSeeAll,
        ),
        _rail(),
      ],
    );
  }

  Widget _rail() {
    final live = _items;
    return SizedBox(
      height: 158,
      child: (live == null)
          ? const Center(child: CircularProgressIndicator()) // API-only: loader, no dummy
          : (live.isEmpty
              ? _emptyNearby() // only the no-city case reaches here (city-empty hides the section)
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: live.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (_, i) => _liveAstroRailCard(context, live[i]),
                )),
    );
  }

  Widget _emptyNearby() {
    final c = context.rg;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(L10n.of(context).noNearbyAstrologersYet, style: TextStyle(color: c.muted, fontSize: 13)),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final String name;
  final int tokens;
  final String? avatar;
  final VoidCallback? onMenu;
  final VoidCallback? onWallet;
  final VoidCallback? onBell;
  final int unread;
  const _TopBar({required this.name, required this.tokens, this.avatar, this.onMenu, this.onWallet, this.onBell, this.unread = 0});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 12, 4),
      child: Row(
        children: [
          // Hamburger → opens the shell's side drawer.
          IconButton(
            onPressed: onMenu,
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.menu, color: c.ink, size: 26),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: c.ground2,
            backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
            child: avatar == null ? Icon(Icons.person, color: c.muted, size: 20) : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${L10n.of(context).namaste} 🙏', style: TextStyle(color: c.muted, fontSize: 11)),
                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          // Wallet pill → tappable, opens the Wallet page.
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onWallet,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 7, 6, 7),
              decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(30), border: Border.all(color: c.line)),
              child: Row(children: [
                Icon(Icons.account_balance_wallet_outlined, size: 15, color: c.gold),
                const SizedBox(width: 6),
                Text('₹$tokens', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13)),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: c.red, shape: BoxShape.circle),
                  child: const Icon(Icons.add, size: 12, color: Colors.white),
                ),
              ]),
            ),
          ),
          // Bell with unread count badge.
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: onBell,
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.notifications_none_rounded, color: c.ink, size: 24),
              ),
              if (unread > 0)
                Positioned(
                  right: 4, top: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.ground, width: 1.5)),
                    child: Text(unread > 9 ? '9+' : '$unread',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w800, height: 1.1)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  /// Optional SVG asset; when set it renders instead of [icon] (tinted gold).
  final String? svgAsset;
  const _FeatureTile({required this.icon, required this.label, required this.onTap, this.svgAsset});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Container(
                height: 52, width: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(15), border: Border.all(color: c.line)),
                child: svgAsset != null
                    ? SvgPicture.asset(svgAsset!, width: 28, height: 28, colorFilter: ColorFilter.mode(c.gold, BlendMode.srcIn))
                    : Icon(icon, color: c.gold, size: 26),
              ),
              const SizedBox(height: 7),
              Text(label, style: TextStyle(color: c.ink, fontSize: 11.5, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _TopicChip({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: SizedBox(
          width: 62,
          child: Column(
            children: [
              Container(
                height: 54, width: 54,
                decoration: BoxDecoration(color: c.ground2, shape: BoxShape.circle, border: Border.all(color: c.line)),
                child: Icon(icon, color: c.gold, size: 24),
              ),
              const SizedBox(height: 6),
              Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: c.muted, fontSize: 10.5, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Nudge extends StatelessWidget {
  final VoidCallback onTap;
  const _Nudge({required this.onTap});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: c.redSoft,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.red.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          Icon(Icons.auto_awesome, color: c.gold, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(t.completeProfile, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13))),
          Icon(Icons.chevron_right, color: c.red, size: 20),
        ]),
      ),
    );
  }
}

/// "Book a Pooja" banner → opens the pooja listing. Uses an admin-managed cropped
/// image (5:1) when one exists, else the built-in gradient CTA.
class _BookPoojaBanner extends StatelessWidget {
  final VoidCallback onTap;
  final List<Map<String, dynamic>> banners;
  const _BookPoojaBanner({required this.onTap, this.banners = const []});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    // Reuse the promo carousel exactly: all active pooja banners auto-rotate,
    // each routing to its own admin-set tap target. When there are none, fall
    // back to the built-in "Book a Pooja" CTA (→ pooja list). `onTap` is the
    // default for banners without a custom link (handled inside the carousel).
    return _PromoCarousel(
      banners: banners,
      onTap: onTap,
      fallback: _builtInCta(context, c, onTap),
    );
  }

  Widget _builtInCta(BuildContext context, RgColors c, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(colors: [c.redDeep, c.gold], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Row(children: [
          Container(
            height: 44, width: 44,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.temple_hindu, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(L10n.of(context).bookAPooja, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 2),
              Text(L10n.of(context).panditLedPoojasAtYourChosen, style: const TextStyle(color: Colors.white70, fontSize: 11.5)),
            ]),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ]),
      ),
    );
  }
}

/// Admin-managed promo banner carousel — auto-rotating image slides with dot
/// indicators. Images are static placeholders now; later they come from the
/// backend (admin uploads + schedules them).
class _PromoCarousel extends StatefulWidget {
  final VoidCallback onTap;
  final List<Map<String, dynamic>> banners; // admin-managed; empty → fallback
  // What to show when there are no admin banners. Null → the promo gradient
  // slides (default). The pooja slot passes its "Book a Pooja" CTA here so the
  // same carousel widget serves both placements with the right empty state.
  final Widget? fallback;
  const _PromoCarousel({required this.onTap, this.banners = const [], this.fallback});
  @override
  State<_PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<_PromoCarousel> {
  final _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-advance every 4s.
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients) return;
      final count = _count;
      if (count <= 1) return;
      final current = (_controller.page ?? 0).round();
      final next = (current + 1) % count;
      _controller.animateToPage(next, duration: const Duration(milliseconds: 450), curve: Curves.easeInOut);
    });
  }

  int get _count => widget.banners.isNotEmpty ? widget.banners.length : _fallbackSlides(context.rg).length;

  // Token-based gradient slides (fallback when no admin banners exist).
  List<(String, String, List<Color>)> _fallbackSlides(RgColors c) => [
        (L10n.of(context).festivalOffer, L10n.of(context).upTo30OffOnGemstones, [c.redDeep, c.red]),
        (L10n.of(context).talkToTopAstrologers, L10n.of(context).firstConsultationSpecial, [c.violet, c.indigo]),
        (L10n.of(context).rudrakshaCollection, L10n.of(context).authenticEnergised, [c.green, c.mint]),
      ];

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final useImages = widget.banners.isNotEmpty;
    // No admin banners + a custom fallback (pooja CTA) → show that instead of the
    // promo gradient slides.
    if (!useImages && widget.fallback != null) return widget.fallback!;
    final slides = _fallbackSlides(c);
    // Admin banners are cropped to 5:1 in the console. Size the strip to that
    // SAME 5:1 ratio so BoxFit.cover fills it with zero clipping — what the admin
    // crops is exactly what shows here. (Gradient fallback keeps a compact 72px.)
    // Image width = screen − 16px page padding each side − 2px slide margin each side.
    final width = MediaQuery.of(context).size.width - 36;
    final height = useImages ? (width / 5).clamp(72.0, 140.0) : 72.0;

    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: _controller,
        itemCount: useImages ? widget.banners.length : slides.length,
        itemBuilder: (_, i) {
          if (useImages) {
            final b = widget.banners[i];
            final img = (b['image'] ?? '').toString();
            final link = (b['link'] ?? '').toString();
            return GestureDetector(
              // Route to the admin-chosen tap target; if none set, fall back to
              // the carousel's generic onTap (Offers → Coming soon).
              onTap: link.isNotEmpty ? () => DeepLink.openBannerLink(link) : widget.onTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: c.ground2),
                child: img.isEmpty
                    ? const SizedBox()
                    : Image.network(img, fit: BoxFit.cover, width: double.infinity,
                        errorBuilder: (_, __, ___) => Container(color: c.ground2)),
              ),
            );
          }
          final (title, sub, colors) = slides[i];
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: colors, begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 11.5)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  final VoidCallback onTap;
  final String hint;
  final String startLabel;
  const _EmptyHistory({required this.onTap, required this.hint, required this.startLabel});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
      child: Row(children: [
        Icon(Icons.history, color: c.muted, size: 24),
        const SizedBox(width: 12),
        Expanded(child: Text(hint, style: TextStyle(color: c.muted, fontSize: 12.5))),
        TextButton(onPressed: onTap, child: Text(startLabel, style: TextStyle(color: c.red, fontWeight: FontWeight.w700))),
      ]),
    );
  }
}

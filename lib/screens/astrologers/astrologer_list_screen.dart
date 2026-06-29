import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../api/astrologer_api.dart';
import '../../api/profile_api.dart';
import '../../api/socket_service.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/rg_colors.dart';
import '../common/coming_soon_screen.dart';
import '../wallet/wallet_screen.dart';
import '../../widgets/cached_image.dart';
import '../../widgets/slide_route.dart';
import 'astrologer_profile_screen.dart';
import 'filters_sheet.dart';

/// API-bound astrologer directory: category chips + debounced search + filters +
/// smooth infinite-scroll pagination + rich cards.
///   [aiMode]      = AI astrologers (chat-only, still static placeholders)
///   [featured]    = only featured astrologers (the "See all featured" entry)
///   [initialCity] = pre-scope the list to a city ("See all nearby")
///   [title]       = optional custom app-bar title
class AstrologerListScreen extends StatefulWidget {
  final bool aiMode;
  final bool featured;
  final String? initialCity;
  final String? title;
  const AstrologerListScreen({super.key, this.aiMode = false, this.featured = false, this.initialCity, this.title});

  @override
  State<AstrologerListScreen> createState() => _AstrologerListScreenState();
}

/// Process-lived cache of each screen's DEFAULT (unfiltered) first page, so
/// re-opening Featured / Call & Chat / Nearby shows the previous results
/// instantly while a fresh fetch refreshes them in the background. Cleared on
/// app restart (it's just an in-memory Map). Keyed by the screen variant.
class _AstroListCache {
  static final Map<String, List<Astrologer>> _byKey = {};
  static List<Astrologer>? get(String key) => _byKey[key];
  static void set(String key, List<Astrologer> items) => _byKey[key] = items;
}

class _AstrologerListScreenState extends State<AstrologerListScreen> {
  late final AstrologerApi _api;
  int _cat = 0;
  final _search = TextEditingController();
  final _scroll = ScrollController();
  Timer? _debounce;
  AstrologerFilters _filters = const AstrologerFilters();
  int get _activeFilterCount =>
      _filters.expertise.length + _filters.languages.length + (_filters.onlineOnly ? 1 : 0) + (_filters.maxPrice < 100 ? 1 : 0);

  // Category chips — first is "All", rest map to the `expertise` query param.
  static const _cats = ['All', 'Vedic', 'Tarot', 'Numerology', 'Vastu', 'Palmistry', 'KP', 'Love'];

  // Live list state + pagination.
  static const _pageSize = 20;
  List<Astrologer> _items = [];
  bool _loading = true;
  bool _loadingMore = false;
  bool _hasMore = true;
  int _page = 1;
  String? _error;

  // Cache key for THIS screen's default view (the cache only covers the
  // unfiltered first page — what you see when you open the screen).
  String get _cacheKey => 'ai:${widget.aiMode}|feat:${widget.featured}|city:${widget.initialCity ?? '-'}';
  // True when no search/chip/filter is active → the view IS the default one.
  bool get _isDefaultView =>
      _search.text.trim().isEmpty && _cat == 0 && _activeFilterCount == 0;

  // AI is still static (chat-only placeholders) until the AI backend exists.
  static const _ai = [
    {'name': 'Tara AI', 'desc': 'Instant Vedic answers • 24×7', 'lang': 'All languages', 'chat': 0},
    {'name': 'Jyoti AI', 'desc': 'Love & career guidance', 'lang': 'Hindi, English', 'chat': 0},
    {'name': 'Vedu AI', 'desc': 'Remedies & predictions', 'lang': 'All languages', 'chat': 0},
  ];

  StreamSubscription? _statusSub;

  @override
  void initState() {
    super.initState();
    _api = context.read<AstrologerApi>();
    _scroll.addListener(_onScroll);
    // Realtime: patch a card's status the moment its astrologer goes
    // online/busy/offline (no refetch, no spinner).
    _statusSub = context.read<SocketService>().astrologerStatus.listen(_applyStatus);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<SocketService>().trackPage('astrologer-list');
    });
    if (!widget.aiMode) {
      // Show cached results instantly (no spinner), then refresh in background.
      final cached = _AstroListCache.get(_cacheKey);
      if (cached != null && cached.isNotEmpty) {
        _items = cached;
        _loading = false;
        _hasMore = cached.length >= _pageSize;
      }
      _load();
    } else {
      _loading = false;
    }
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    _debounce?.cancel();
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  /// Patch the matching card's live status (online/busy/offline) in place.
  void _applyStatus(AstrologerStatus s) {
    final i = _items.indexWhere((a) => a.id == s.profileId);
    if (i < 0) return;
    setState(() {
      _items[i] = _items[i].copyWith(isOnline: s.isOnline, currentCallStatus: s.currentCallStatus);
    });
  }

  // Map a live Astrologer to the Map shape _AstroCard already renders.
  Map<String, dynamic> _toCard(Astrologer a) => {
        'id': a.id,
        'name': a.name,
        // Full expertise (• separated) + experience; the desc Text ellipsizes
        // what doesn't fit rather than hard-capping at 2.
        'desc': [a.expertise.join(' • '), if (a.experienceYears > 0) L10n.of(context).aExperienceyearsYrsExp(a.experienceYears)].where((s) => s.isNotEmpty).join(' • '),
        // Full deduped language list (comma-joined); the card shows 2 + "+N".
        'lang': a.languages.map((l) => l.trim()).where((l) => l.isNotEmpty).toSet().join(', '),
        'rating': a.rating,
        'reviews': a.reviewCount,
        'call': a.callRate, 'chat': a.chatRate, 'video': a.videoRate,
        'status': a.cardStatus,
        'avatar': a.avatar,
      };

  // Effective query from the chips/search/filters.
  String? get _expertise {
    if (_filters.expertise.isNotEmpty) return _filters.expertise.first;
    return _cat == 0 ? null : _cats[_cat];
  }

  // First selected language (backend matches one), or null when none chosen.
  String? get _language => _filters.languages.isNotEmpty ? _filters.languages.first : null;

  // Price cap only when the slider is below its max (100 = "no limit").
  int? get _maxPrice => _filters.maxPrice < 100 ? _filters.maxPrice.round() : null;

  Future<void> _load() async {
    // Only show the full-screen spinner when we have nothing to show yet.
    // If cached/previous items are already on screen, refresh silently.
    final t = L10n.of(context);
    final hadItems = _items.isNotEmpty;
    setState(() { _loading = !hadItems; _error = null; _page = 1; });
    try {
      final list = await _api.list(
        q: _search.text.trim(), expertise: _expertise, language: _language,
        online: _filters.onlineOnly ? true : null,
        featured: widget.featured ? true : null,
        maxPrice: _maxPrice,
        city: widget.initialCity,
        page: 1, limit: _pageSize,
      );
      if (!mounted) return;
      setState(() { _items = list; _hasMore = list.length >= _pageSize; _loading = false; });
      context.read<SocketService>().watchAstrologers(list.map((a) => a.id));
      // Cache the default (unfiltered) view for instant re-open next time.
      if (_isDefaultView) _AstroListCache.set(_cacheKey, list);
    } catch (_) {
      // Keep showing cached items on a refresh error; only error when empty.
      if (mounted) setState(() { _loading = false; if (!hadItems) _error = t.couldNotLoadAstrologers; });
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore || _loading) return;
    setState(() => _loadingMore = true);
    try {
      final next = _page + 1;
      final more = await _api.list(
        q: _search.text.trim(), expertise: _expertise, language: _language,
        online: _filters.onlineOnly ? true : null,
        featured: widget.featured ? true : null,
        maxPrice: _maxPrice,
        city: widget.initialCity,
        page: next, limit: _pageSize,
      );
      if (mounted) {
        setState(() { _items = [..._items, ...more]; _page = next; _hasMore = more.length >= _pageSize; _loadingMore = false; });
        context.read<SocketService>().watchAstrologers(more.map((a) => a.id));
      }
    } catch (_) {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  // Prefetch 400px before the end so scrolling stays smooth (no visible stop).
  void _onScroll() {
    if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 400) { _loadMore(); }
  }

  void _onSearch(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (widget.aiMode) { setState(() {}); } else { _load(); }
      if (_search.text.trim().isNotEmpty) context.read<SocketService>().trackSearch(_search.text.trim());
    });
  }

  void _soon(String t, [IconData i = Icons.auto_awesome]) =>
      Navigator.of(context).push(slideRoute(ComingSoonScreen(title: t, icon: i)));

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final ai = widget.aiMode;

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        // Back arrow auto-shows when pushed; for the tab use it's hidden.
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title ?? (ai ? L10n.of(context).aiAstrologers : widget.featured ? L10n.of(context).featuredAstrologers : L10n.of(context).astrologers),
                style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
            if ((widget.initialCity ?? '').isNotEmpty)
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.location_on_outlined, size: 12, color: c.muted),
                const SizedBox(width: 2),
                Text(widget.initialCity!.split(',').first, style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
              ]),
          ],
        ),
        actions: [
          // Wallet pill → Wallet page.
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).push(slideRoute(const WalletScreen())),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.line)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.account_balance_wallet_outlined, size: 14, color: c.gold),
                const SizedBox(width: 5),
                // Live wallet balance — same value as the Home top bar.
                Text('₹${context.watch<WalletProvider>().balance}',
                    style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 12.5)),
              ]),
            ),
          ),
          // Filters only for human astrologers (AI is chat-only — no filters).
          if (!ai)
            Stack(children: [
              IconButton(
                onPressed: () async {
                  final res = await showFiltersSheet(context, _filters);
                  if (res != null) { setState(() => _filters = res); _load(); }
                },
                icon: Icon(Icons.tune, color: c.ink, size: 22),
              ),
              if (_activeFilterCount > 0)
                Positioned(
                  right: 6, top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                    decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.ground, width: 1.5)),
                    child: Text('$_activeFilterCount', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w800)),
                  ),
                ),
            ]),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // Global search.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
            child: TextField(
              controller: _search,
              textInputAction: TextInputAction.search,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: ai ? L10n.of(context).searchAiAstrologers : L10n.of(context).searchAstrologersByName,
                prefixIcon: Icon(Icons.search, color: c.muted, size: 21),
                isDense: true,
              ),
            ),
          ),
          // Category chips — human astrologers only (AI is chat-only).
          if (!ai) ...[
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _cats.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final sel = i == _cat;
                  return ChoiceChip(
                    label: Text(_cats[i]),
                    selected: sel,
                    onSelected: (_) { setState(() => _cat = i); if (!ai) _load(); },
                    showCheckmark: false,
                    backgroundColor: c.ground2,
                    selectedColor: c.redSoft,
                    side: BorderSide(color: sel ? c.red : c.line),
                    labelStyle: TextStyle(color: sel ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 13),
                  );
                },
              ),
            ),
            const SizedBox(height: 6),
          ],
          // Cards.
          Expanded(child: _buildBody(c, ai)),
        ],
      ),
    );
  }

  Widget _buildBody(RgColors c, bool ai) {
    // AI mode: static placeholder list, filtered by the search box.
    if (ai) {
      final q = _search.text.trim().toLowerCase();
      final data = _ai.where((d) => q.isEmpty || (d['name'] as String).toLowerCase().contains(q)).toList();
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) => _AstroCard(data: data[i], ai: true, onTap: () => _soon(L10n.of(context).aiChat, Icons.auto_awesome)),
      );
    }

    if (_loading) return Center(child: CircularProgressIndicator(color: c.red));
    if (_error != null) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.cloud_off, color: c.muted, size: 40), const SizedBox(height: 12),
        Text(_error!, style: TextStyle(color: c.ink)), const SizedBox(height: 12),
        OutlinedButton(onPressed: _load, child: Text(L10n.of(context).retry)),
      ]));
    }
    if (_items.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.person_search, color: c.muted, size: 44), const SizedBox(height: 12),
        Text(_search.text.trim().isNotEmpty || _activeFilterCount > 0 || _cat != 0 ? L10n.of(context).noAstrologersMatch : L10n.of(context).noAstrologersYet,
            style: TextStyle(color: c.muted)),
      ]));
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.separated(
        controller: _scroll,
        padding: const EdgeInsets.all(16),
        itemCount: _items.length + (_hasMore ? 1 : 0), // +1 = loading footer
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          if (i >= _items.length) {
            // Footer: spinner while the next page loads (prefetched before end).
            return const Padding(padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2.4))));
          }
          final a = _items[i];
          final card = _toCard(a);
          return _AstroCard(
            data: card, ai: false,
            onTap: () => Navigator.of(context).push(slideRoute(AstrologerProfileScreen(
              profileId: a.id,
              userId: a.userId,
              bio: a.bio,
              avatar: a.avatar,
              coverPhoto: a.coverPhoto,
              name: a.name, desc: card['desc'] as String, languages: card['lang'] as String,
              gifts: 0, followers: '${a.reviewCount}',
              call: a.callRate, chat: a.chatRate, video: a.videoRate,
              status: a.cardStatus,
            ))),
          );
        },
      ),
    );
  }
}

class _AstroCard extends StatelessWidget {
  final Map data;
  final bool ai;
  final VoidCallback onTap;
  const _AstroCard({required this.data, required this.ai, required this.onTap});

  /// Tapping a service: available → proceed; busy/offline → save a "notify me
  /// when available" request to the DB and confirm ONLY on a successful save.
  Future<void> _service(BuildContext context, String service, String status) async {
    if (ai || status == 'online') {
      onTap(); // proceed to chat/call/video (Coming soon for now)
      return;
    }
    final name = data['name'] as String;
    final reason = status == 'busy' ? 'free' : 'online';
    final id = data['id'] as String?;
    final messenger = ScaffoldMessenger.of(context); // capture before await
    final t = L10n.of(context); // capture before await
    if (id == null) return; // static/dummy card — no real id to persist against

    bool ok = true;
    try {
      await context.read<ProfileApi>().notifyWhenAvailable(id, service);
    } catch (_) {
      ok = false;
    }
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(ok
            ? t.weLlLetYouKnowWhen2(name, reason)
            : t.couldnTSetTheReminderPlease),
        behavior: SnackBarBehavior.floating,
      ));
  }

  /// Distinct premium card for AI astrologers — a rich violet→indigo gradient
  /// SURFACE (vivid in both light & dark) with a glowing sparkle avatar, the
  /// name + tagline, and a single clean "Chat Now" pill. All colors come from
  /// the admin palette tokens (violet / indigo / gold) so Theme Studio flows
  /// straight through.
  Widget _buildAiCard(BuildContext context, RgColors c) {
    final aiA = c.violet;
    final aiB = c.indigo;
    const onAi = Colors.white;
    final onAiDim = Colors.white.withValues(alpha: 0.80);
    final imageUrl = (data['avatar'] as String?)?.trim();
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [aiA, aiB],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            boxShadow: [BoxShadow(color: aiA.withValues(alpha: 0.35), blurRadius: 20, spreadRadius: -2, offset: const Offset(0, 8))],
          ),
          // Clip so the full-height photo follows the rounded corners.
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // IntrinsicHeight lets the left photo stretch to the content's height.
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Left: full-height photo, ~30% of the card width ──
                  Expanded(
                    flex: 3, // 3 : 7  ≈ 30%
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.14),
                        image: cachedImageProvider(imageUrl) != null
                            ? DecorationImage(image: cachedImageProvider(imageUrl)!, fit: BoxFit.cover)
                            : null,
                      ),
                      // Sparkle placeholder when there's no photo yet.
                      child: (imageUrl == null || imageUrl.isEmpty)
                          ? const Center(child: Icon(Icons.auto_awesome, color: Colors.white, size: 34))
                          : null,
                    ),
                  ),
                  // ── Right: content (name, tagline, Chat pill) ──
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data['name'], maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: onAi, fontWeight: FontWeight.w800, fontSize: 17, letterSpacing: 0.2)),
                          const SizedBox(height: 4),
                          Text(data['desc'], maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: onAiDim, fontSize: 12.5, height: 1.3)),
                          const SizedBox(height: 14),
                          // Full-width white "Chat Now" pill.
                          SizedBox(
                            width: double.infinity,
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(14),
                                onTap: () => _service(context, 'chat', 'online'),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 11),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.chat_bubble_rounded, color: aiA, size: 16),
                                      const SizedBox(width: 8),
                                      Text(L10n.of(context).chatNow, style: TextStyle(color: aiA, fontWeight: FontWeight.w800, fontSize: 13.5)),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                        decoration: BoxDecoration(color: aiA.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                                        child: Text('₹${data['chat'] ?? 0}/min', style: TextStyle(color: aiA, fontSize: 10, fontWeight: FontWeight.w800)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final green = c.green;
    final status = data['status'] as String? ?? (ai ? 'online' : 'offline');
    final available = ai || status == 'online';
    final cardImageUrl = (data['avatar'] as String?)?.trim();

    // AI astrologers get a distinct, more "AI" premium card.
    if (ai) return _buildAiCard(context, c);

    // Status colour + label (drives ring, dot, and the badge pill).
    final (Color statusColor, String statusLabel) = ai
        ? (c.gold, L10n.of(context).ai)
        : switch (status) {
            'live' => (c.red, L10n.of(context).live2),
            'online' => (green, L10n.of(context).online),
            'busy' => (c.red, L10n.of(context).busy),
            _ => (c.muted, L10n.of(context).offline),
          };
    final ringColor = ai ? c.gold : statusColor;

    return Opacity(
      // Dim unavailable astrologers so they read as "not bookable now".
      opacity: available ? 1 : 0.78,
      child: Material(
      color: c.ground2,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: available ? c.line : statusColor.withValues(alpha: 0.4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar with status-colored ring + status dot.
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: ringColor.withValues(alpha: 0.18), blurRadius: 8, spreadRadius: 1)],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ringColor, width: 2)),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: c.card,
                            backgroundImage: cachedImageProvider(cardImageUrl),
                            child: cachedImageProvider(cardImageUrl) == null ? Icon(Icons.person, color: c.muted, size: 28) : null,
                          ),
                        ),
                      ),
                      if (!ai)
                        Positioned(
                          right: 2, bottom: 2,
                          child: Container(
                            height: 14, width: 14,
                            decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle, border: Border.all(color: c.ground2, width: 2.5)),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name line: full name (left) · rating pill (only when
                        // > 0) · chevron. Rating lives here, NOT on the
                        // expertise line, so the expertise reads cleanly.
                        Row(
                          children: [
                            Expanded(child: Text(data['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15.5))),
                            if (((data['rating'] as num?)?.toDouble() ?? 0) > 0) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: c.gold.withValues(alpha: 0.14),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(mainAxisSize: MainAxisSize.min, children: [
                                  Icon(Icons.star_rounded, size: 12, color: c.gold),
                                  const SizedBox(width: 2),
                                  Text(((data['rating'] as num?)?.toDouble() ?? 0).toStringAsFixed(1),
                                      style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w800)),
                                  Text(' (${data['reviews'] ?? data['followers'] ?? 0})',
                                      style: TextStyle(color: c.gold.withValues(alpha: 0.8), fontSize: 9.5, fontWeight: FontWeight.w600)),
                                ]),
                              ),
                            ],
                            const SizedBox(width: 4),
                            Icon(Icons.chevron_right, size: 18, color: c.muted),
                          ],
                        ),
                        const SizedBox(height: 3),
                        // Expertise / experience — clean line, no rating crowding it.
                        Text(data['desc'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.muted, fontSize: 12)),
                        const SizedBox(height: 7),
                        // Language chips. (Status is shown by the avatar ring +
                        // dot, so no Online/Busy text badge here.)
                        Builder(builder: (_) {
                          final allLangs = (data['lang'] as String).split(',').map((l) => l.trim()).where((l) => l.isNotEmpty).toList();
                          final shown = allLangs.take(2).toList();
                          final extra = allLangs.length - shown.length; // >0 → "+N"
                          Widget chip(String label) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: c.line), color: c.card),
                                child: Text(label, style: TextStyle(color: c.muted, fontSize: 10)),
                              );
                          return Wrap(
                            spacing: 6, runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              for (final l in shown) chip(l),
                              if (extra > 0) chip('+$extra'),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Service price chips — or full-width Notify when busy/offline.
              if (ai)
                _SvcChip(label: L10n.of(context).chat, price: data['chat'], color: c.gold, fg: c.gold, onTap: () => _service(context, 'chat', status))
              else if (!available)
                _NotifyButton(onTap: () => _service(context, 'chat', status))
              else
                Row(children: [
                  Expanded(child: _SvcChip(label: L10n.of(context).chat, price: data['chat'], color: c.red, fg: c.red, onTap: () => _service(context, 'chat', status))),
                  const SizedBox(width: 8),
                  Expanded(child: _SvcChip(label: L10n.of(context).call, price: data['call'], color: green, fg: green, onTap: () => _service(context, 'call', status))),
                  const SizedBox(width: 8),
                  Expanded(child: _SvcChip(label: L10n.of(context).video, price: data['video'], color: c.blue, fg: c.blue, onTap: () => _service(context, 'video', status))),
                ]),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

/// Per-service price chip (label + ₹/min stacked) — the Card-4 button.
class _SvcChip extends StatelessWidget {
  final String label;
  final int? price;
  final Color color;
  final Color fg;
  final VoidCallback onTap;
  const _SvcChip({required this.label, required this.price, required this.color, required this.fg, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final priceText = (price == null || price == 0) ? L10n.of(context).free : L10n.of(context).priceMin(price!);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(label, style: TextStyle(color: fg, fontWeight: FontWeight.w800, fontSize: 12.5)),
          const SizedBox(height: 1),
          Text(priceText, style: TextStyle(color: fg.withValues(alpha: 0.85), fontSize: 10, fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}

/// Full-width red Notify button for busy/offline astrologers.
class _NotifyButton extends StatelessWidget {
  final VoidCallback onTap;
  const _NotifyButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.notifications_active_outlined, size: 16, color: Colors.white),
          const SizedBox(width: 7),
          Text(L10n.of(context).notifyMe, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
        ]),
      ),
    );
  }
}



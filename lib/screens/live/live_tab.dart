import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/live_api.dart';
import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import 'live_audience_screen.dart';

/// The user app "Live" tab: astrologers broadcasting right now. Each card has a
/// Join button → the audience room. Empty-state when nobody is live; a search
/// bar (by name) once ≥1 card exists. Pull to refresh + 5s poll + socket events.
///
/// Card layout follows the proven _AstroCard pattern from the astrologer list
/// (Material → InkWell → Container; a fixed-height banner; and a footer Row whose
/// meta is Expanded and whose Join button has a bounded width). The earlier
/// "black card" bug came from a footer `Row(Expanded + ElevatedButton.icon)` —
/// mixing a flexible child with an intrinsic-width button makes the Row demand an
/// unbounded width and the whole subtree fails to lay out (renders black). The
/// Join button here is wrapped so it has a definite width and never triggers that.
class LiveTab extends StatefulWidget {
  const LiveTab({super.key});

  @override
  State<LiveTab> createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {
  final _search = TextEditingController();
  List<LiveCard> _all = [];
  bool _loading = true;
  String _query = '';
  String? _error;
  StreamSubscription<AstrologerStatus>? _statusSub;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() => _query = _search.text.trim().toLowerCase()));
    _load();
    _statusSub = context.read<SocketService>().astrologerStatus.listen((_) {
      if (mounted) _load(silent: true);
    });
    _pollTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (mounted) _load(silent: true);
    });
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    _pollTimer?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    try {
      final items = await context.read<LiveApi>().list();
      if (!mounted) return;
      setState(() {
        _all = items;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        if (!silent || _all.isEmpty) _error = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  List<LiveCard> get _filtered {
    if (_query.isEmpty) return _all;
    return _all.where((c) => c.astrologerName.toLowerCase().contains(_query)).toList();
  }

  void _join(LiveCard card) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => LiveAudienceScreen(
        liveSessionId: card.id,
        headline: card.title.isEmpty ? card.astrologerName : card.title,
      ),
    )).then((_) => _load(silent: true));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Row(children: [
          Icon(Icons.live_tv, color: c.red, size: 22),
          const SizedBox(width: 8),
          Text(L10n.of(context).liveNow, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        ]),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _all.isEmpty
                ? RefreshIndicator(
                    onRefresh: () => _load(),
                    color: c.red,
                    child: _EmptyState(onRefresh: () => _load(), error: _error),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                        child: TextField(
                          controller: _search,
                          style: TextStyle(color: c.ink),
                          decoration: InputDecoration(
                            hintText: L10n.of(context).searchByAstrologerName,
                            prefixIcon: Icon(Icons.search, color: c.muted),
                            suffixIcon: _query.isEmpty
                                ? null
                                : IconButton(icon: Icon(Icons.close, color: c.muted), onPressed: _search.clear),
                            isDense: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => _load(),
                          color: c.red,
                          child: _list(c),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _list(RgColors c) {
    final items = _filtered;
    if (items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 80),
          Center(child: Icon(Icons.search_off, color: c.muted, size: 48)),
          const SizedBox(height: 12),
          Center(child: Text(L10n.of(context).noLiveAstrologerNamedSearchText(_search.text.trim()), style: TextStyle(color: c.muted))),
        ],
      );
    }
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (_, i) => _LiveCardTile(card: items[i], onJoin: () => _join(items[i])),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final String? error;
  const _EmptyState({required this.onRefresh, this.error});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final hasError = error != null && error!.isNotEmpty;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 90),
        Icon(hasError ? Icons.cloud_off : Icons.live_tv_outlined, color: c.muted, size: 64),
        const SizedBox(height: 16),
        Center(
          child: Text(hasError ? L10n.of(context).couldnTLoadLiveSessions : L10n.of(context).noOneIsLiveRightNow,
              style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 17)),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            hasError
                ? L10n.of(context).checkYourConnectionAndTryAgain(error!)
                : L10n.of(context).whenAnAstrologerGoesLiveThey,
            textAlign: TextAlign.center,
            style: TextStyle(color: c.muted, height: 1.4),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: OutlinedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: Text(L10n.of(context).refresh),
            style: OutlinedButton.styleFrom(foregroundColor: c.red, side: BorderSide(color: c.red)),
          ),
        ),
      ],
    );
  }
}

/// One live astrologer. Built on the proven _AstroCard skeleton: Material →
/// InkWell → Container, a fixed-height banner, then a content area. The footer
/// keeps the meta in an Expanded and gives the Join button a definite width so
/// the Row never needs an unbounded/intrinsic measurement.
class _LiveCardTile extends StatelessWidget {
  final LiveCard card;
  final VoidCallback onJoin;
  const _LiveCardTile({required this.card, required this.onJoin});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Material(
      color: c.ground2,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onJoin,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.line),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Banner — fixed height. SizedBox bounds it; the Stack fills it.
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [c.redDeep, c.red, c.gold],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: cachedImageProvider(card.astrologerAvatar) != null
                          ? Image(image: cachedImageProvider(card.astrologerAvatar)!, fit: BoxFit.cover)
                          : const Center(child: Icon(Icons.videocam, color: Colors.white, size: 38)),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: _pill(
                        color: c.red,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.circle, color: Colors.white, size: 7),
                          const SizedBox(width: 5),
                          Text(L10n.of(context).live, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1)),
                        ]),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: _pill(
                        color: Colors.black45,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.visibility, color: Colors.white, size: 13),
                          const SizedBox(width: 4),
                          Text('${card.viewerCount}', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              // Content.
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card.astrologerName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15.5)),
                    if (card.title.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(card.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: c.muted, fontSize: 13)),
                    ],
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Meta (topic chip + rating). Expanded bounds it.
                        Expanded(
                          child: Row(
                            children: [
                              if (card.topic.isNotEmpty)
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                                    decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(20)),
                                    child: Text(card.topic,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: c.red, fontSize: 11.5, fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              if (card.rating > 0) ...[
                                const SizedBox(width: 8),
                                Icon(Icons.star, color: c.gold, size: 14),
                                const SizedBox(width: 3),
                                Text(card.rating.toStringAsFixed(1), style: TextStyle(color: c.muted, fontSize: 12.5)),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Join — fixed width, so the Row has no intrinsic-width child.
                        SizedBox(
                          width: 104,
                          height: 38,
                          child: ElevatedButton.icon(
                            onPressed: onJoin,
                            icon: const Icon(Icons.play_arrow, size: 18),
                            label: Text(L10n.of(context).join),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: c.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _pill({required Color color, required Widget child}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: child,
      );
}

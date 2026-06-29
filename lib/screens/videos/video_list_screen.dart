import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/video_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'youtube_player_screen.dart';

/// Full "See all" screen for Videos or Lessons — debounced search + infinite
/// scroll pagination. Tapping a row plays the video inside the app (WebView).
class VideoListScreen extends StatefulWidget {
  final String kind; // 'video' | 'lesson'
  final String title;
  const VideoListScreen({super.key, required this.kind, required this.title});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late final VideoApi _api;
  final _search = TextEditingController();
  final _scroll = ScrollController();
  Timer? _debounce;

  static const _pageSize = 20;
  List<VideoItem> _items = [];
  bool _loading = true, _loadingMore = false, _hasMore = true;
  int _page = 1;
  String? _error;

  @override
  void initState() {
    super.initState();
    _api = context.read<VideoApi>();
    _scroll.addListener(_onScroll);
    _load();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final hadItems = _items.isNotEmpty;
    setState(() { _loading = !hadItems; _error = null; _page = 1; });
    try {
      final res = await _api.list(kind: widget.kind, q: _search.text.trim(), page: 1, limit: _pageSize);
      if (!mounted) return;
      setState(() { _items = res.items; _hasMore = res.items.length >= _pageSize; _loading = false; });
    } catch (_) {
      if (mounted) setState(() { _loading = false; if (!hadItems) _error = L10n.of(context).couldNotLoad; });
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore || _loading) return;
    setState(() => _loadingMore = true);
    try {
      final next = _page + 1;
      final res = await _api.list(kind: widget.kind, q: _search.text.trim(), page: next, limit: _pageSize);
      if (mounted) setState(() { _items = [..._items, ...res.items]; _page = next; _hasMore = res.items.length >= _pageSize; _loadingMore = false; });
    } catch (_) {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  void _onScroll() {
    if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 400) _loadMore();
  }

  void _onSearch(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), _load);
  }

  void _play(VideoItem v) {
    Navigator.of(context).push(slideRoute(
      YouTubePlayerScreen(youtubeId: v.youtubeId, youtubeUrl: v.youtubeUrl, title: v.title),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        title: Text(widget.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 17)),
        iconTheme: IconThemeData(color: c.ink),
      ),
      body: Column(
        children: [
          // Search.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _search,
              onChanged: _onSearch,
              style: TextStyle(color: c.ink, fontSize: 14),
              decoration: InputDecoration(
                hintText: L10n.of(context).searchWidgetTitleTolowercase(widget.title.toLowerCase()),
                hintStyle: TextStyle(color: c.muted),
                prefixIcon: Icon(Icons.search, color: c.muted, size: 20),
                suffixIcon: _search.text.isEmpty ? null : IconButton(
                  icon: Icon(Icons.close, color: c.muted, size: 18),
                  onPressed: () { _search.clear(); _load(); setState(() {}); },
                ),
                filled: true, fillColor: c.card,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.red)),
              ),
            ),
          ),
          Expanded(child: _body(c)),
        ],
      ),
    );
  }

  Widget _body(RgColors c) {
    if (_loading) return Center(child: CircularProgressIndicator(color: c.red));
    if (_error != null) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(_error!, style: TextStyle(color: c.muted)),
        const SizedBox(height: 12),
        OutlinedButton(onPressed: _load, child: Text(L10n.of(context).retry)),
      ]));
    }
    if (_items.isEmpty) {
      return Center(child: Text(L10n.of(context).nothingHereYet, style: TextStyle(color: c.muted)));
    }
    return RefreshIndicator(
      color: c.red,
      onRefresh: _load,
      child: ListView.separated(
        controller: _scroll,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        itemCount: _items.length + (_hasMore ? 1 : 0),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          if (i >= _items.length) {
            return Padding(padding: const EdgeInsets.all(16), child: Center(child: CircularProgressIndicator(color: c.red, strokeWidth: 2)));
          }
          return _VideoRow(item: _items[i], onTap: () => _play(_items[i]));
        },
      ),
    );
  }
}

/// A horizontal thumbnail + title row for the list (distinct from the home rail card).
class _VideoRow extends StatelessWidget {
  final VideoItem item;
  final VoidCallback onTap;
  const _VideoRow({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 148, height: 84,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: c.line),
              image: item.thumbnail != null
                  ? DecorationImage(image: NetworkImage(item.thumbnail!), fit: BoxFit.cover)
                  : null,
            ),
            child: Center(
              child: Container(
                height: 36, width: 36,
                decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(9)),
                child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(item.title, maxLines: 3, overflow: TextOverflow.ellipsis,
                style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w600, height: 1.3)),
          ),
        ],
      ),
    );
  }
}

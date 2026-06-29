import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../theme/rg_colors.dart';

/// Plays a YouTube video INSIDE the app via a WebView (the YouTube IFrame embed),
/// so the user never leaves for the external YouTube app. Pass [youtubeId]
/// (preferred) and/or [youtubeUrl]; the id is derived from the url if needed.
class YouTubePlayerScreen extends StatefulWidget {
  final String youtubeId;
  final String youtubeUrl;
  final String title;
  const YouTubePlayerScreen({super.key, this.youtubeId = '', this.youtubeUrl = '', this.title = 'Video'});

  @override
  State<YouTubePlayerScreen> createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late final WebViewController _controller;
  bool _loading = true;

  /// Pull the 11-char video id out of any common YouTube URL form.
  static String _idFrom(String url) {
    final patterns = [
      RegExp(r'youtu\.be/([A-Za-z0-9_-]{11})'),
      RegExp(r'[?&]v=([A-Za-z0-9_-]{11})'),
      RegExp(r'youtube\.com/(?:embed|shorts)/([A-Za-z0-9_-]{11})'),
    ];
    for (final re in patterns) {
      final m = re.firstMatch(url);
      if (m != null) return m.group(1)!;
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    final id = widget.youtubeId.isNotEmpty ? widget.youtubeId : _idFrom(widget.youtubeUrl);
    // Embed with autoplay + inline playback. `playsinline=1` keeps it in our view
    // on iOS rather than going fullscreen-native.
    final embed = 'https://www.youtube.com/embed/$id?autoplay=1&playsinline=1&rel=0&modestbranding=1';
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF000000))
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) { if (mounted) setState(() => _loading = true); },
        onPageFinished: (_) { if (mounted) setState(() => _loading = false); },
        onWebResourceError: (e) { debugPrint('YT webview error: ${e.errorCode} ${e.description}'); },
      ))
      ..loadRequest(Uri.parse(embed));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 16)),
        leading: IconButton(icon: Icon(Icons.close, color: c.ink), onPressed: () => Navigator.of(context).pop()),
      ),
      body: Stack(
        children: [
          // 16:9 player pinned to the top; rest of the screen stays ground-colored.
          Align(
            alignment: Alignment.topCenter,
            child: AspectRatio(aspectRatio: 16 / 9, child: WebViewWidget(controller: _controller)),
          ),
          if (_loading)
            Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(color: Colors.black, child: Center(child: CircularProgressIndicator(color: c.red))),
              ),
            ),
        ],
      ),
    );
  }
}

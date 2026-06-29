import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../theme/rg_colors.dart';

/// Renders an admin-authored legal document (HTML body) inside a WebView, styled
/// to match the app's reading view. Used for Terms & Privacy when the backend
/// has published content; otherwise callers fall back to the built-in screens.
class LegalWebViewScreen extends StatefulWidget {
  final String title;
  final String html; // sanitized-ish HTML body from the admin editor
  const LegalWebViewScreen({super.key, required this.title, required this.html});

  @override
  State<LegalWebViewScreen> createState() => _LegalWebViewScreenState();
}

class _LegalWebViewScreenState extends State<LegalWebViewScreen> {
  WebViewController? _controller;
  bool _loading = true;

  String _wrap(RgColors c) {
    String hex(Color x) => '#${x.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';
    return '''
<!doctype html><html><head><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
  :root { color-scheme: ${c.ground.computeLuminance() < 0.5 ? 'dark' : 'light'}; }
  body { margin:0; padding:18px 16px 32px; background:${hex(c.ground)}; color:${hex(c.ink)};
         font-family:-apple-system,Roboto,'Segoe UI',sans-serif; font-size:15px; line-height:1.65; }
  h1,h2,h3 { color:${hex(c.ink)}; line-height:1.3; margin:1.2em 0 .4em; }
  h1{font-size:20px} h2{font-size:17px} h3{font-size:15px}
  p,li { color:${hex(c.muted)}; }
  a { color:${hex(c.red)}; }
  ul,ol { padding-left:22px; }
  hr { border:none; border-top:1px solid ${hex(c.line)}; margin:18px 0; }
</style></head><body>${widget.html}</body></html>''';
  }

  @override
  void initState() {
    super.initState();
    // Defer controller build until we have theme (context) — done in build via _ensure.
  }

  void _ensure(RgColors c) {
    if (_controller != null) return;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(c.ground)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) { if (mounted) setState(() => _loading = false); },
      ))
      ..loadHtmlString(_wrap(c));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    _ensure(c);
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        title: Text(widget.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 17)),
        iconTheme: IconThemeData(color: c.ink),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller!),
          if (_loading) Center(child: CircularProgressIndicator(color: c.red)),
        ],
      ),
    );
  }
}

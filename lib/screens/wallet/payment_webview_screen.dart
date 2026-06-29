import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// In-app PayU checkout. Loads the backend's auto-submitting redirect page (which
/// posts to PayU's hosted checkout) inside a WebView, so the user never leaves
/// the app. When PayU's callback lands on our `/payu/result?status=…` page, we
/// detect that URL, pop, and return true (success) / false (failed/cancelled).
class PaymentWebViewScreen extends StatefulWidget {
  final String url; // the /payments/payu/recharge-redirect/<txnid> URL
  final String title;
  const PaymentWebViewScreen({super.key, required this.url, this.title = 'Payment'});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _loading = true;
  bool _done = false; // guard against popping twice

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFBF6EF))
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) { if (mounted) setState(() => _loading = true); },
        onPageFinished: (url) {
          if (mounted) setState(() => _loading = false);
          _maybeFinish(url);
        },
        onNavigationRequest: (req) => _maybeFinish(req.url) ? NavigationDecision.prevent : NavigationDecision.navigate,
        onUrlChange: (c) => _maybeFinish(c.url ?? ''),
        onHttpError: (e) { debugPrint('RGPAY http error: ${e.response?.statusCode}'); },
        onWebResourceError: (e) { debugPrint('RGPAY resource error: ${e.errorCode} ${e.description}'); },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  // Detect the result page and close with the outcome.
  bool _maybeFinish(String url) {
    if (_done) return false;
    if (url.contains('/payu/result')) {
      _done = true;
      final success = url.contains('status=success');
      // Defer pop out of the navigation callback.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.of(context).pop(success);
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return PopScope(
      // Backing out = treat as cancelled (returns null → caller refreshes anyway).
      canPop: true,
      child: Scaffold(
        backgroundColor: c.ground,
        appBar: AppBar(
          backgroundColor: c.ground,
          title: Text(widget.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
          leading: IconButton(icon: Icon(Icons.close, color: c.ink), onPressed: () => Navigator.of(context).pop(null)),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_loading)
              Container(
                color: c.ground,
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CircularProgressIndicator(color: c.red),
                    const SizedBox(height: 14),
                    Text(L10n.of(context).loadingSecurePayment, style: TextStyle(color: c.muted, fontSize: 13)),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

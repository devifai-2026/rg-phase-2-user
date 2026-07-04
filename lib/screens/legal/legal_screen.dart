import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/app_config_service.dart';
import '../../api/content_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import 'legal_content.dart';
import 'legal_webview_screen.dart';

/// Resolves a legal doc by key: prefers admin-published content (rendered in a
/// WebView), falling back to the built-in [LegalDoc] if the backend has none.
/// This is what the auth-screen Terms/Privacy links push to.
class LegalResolverScreen extends StatelessWidget {
  final String contentKey; // 'terms' | 'privacy'
  final LegalDoc fallback;
  const LegalResolverScreen({super.key, required this.contentKey, required this.fallback});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final api = context.read<ContentApi>();
    return FutureBuilder<LegalContent?>(
      future: api.fetch(contentKey),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return Scaffold(
            backgroundColor: c.ground,
            appBar: AppBar(backgroundColor: c.ground, title: Text(fallback.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)), iconTheme: IconThemeData(color: c.ink)),
            body: Center(child: CircularProgressIndicator(color: c.red)),
          );
        }
        final doc = snap.data;
        if (doc != null && doc.hasBody) {
          return LegalWebViewScreen(title: doc.title.isNotEmpty ? doc.title : fallback.title, html: doc.body);
        }
        return LegalScreen(doc: fallback); // built-in fallback
      },
    );
  }
}

/// Renders a [LegalDoc] (Terms or Privacy) as a clean, themed, scrollable page.
class LegalScreen extends StatelessWidget {
  final LegalDoc doc;
  const LegalScreen({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(doc.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 24 + MediaQuery.of(context).padding.bottom),
          children: [
            Text(doc.title, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: c.ink)),
            const SizedBox(height: 4),
            Text(doc.lastUpdated, style: TextStyle(fontSize: 12.5, color: c.muted)),
            const SizedBox(height: 16),
            // Highlighted intro note.
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: c.redSoft,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: c.red.withValues(alpha: 0.3)),
              ),
              child: Text(doc.intro, style: TextStyle(fontSize: 13.5, color: c.ink, height: 1.5)),
            ),
            const SizedBox(height: 8),
            ...doc.blocks.map((b) => _block(c, b)),
            const SizedBox(height: 24),
            Center(
              child: Text(
                L10n.of(context).s2026Rudraganga18ForGuidanceAnd(context.read<AppConfigService>().appName),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.5, color: c.muted, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _block(RgColors c, LegalBlock b) {
    if (b.heading != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(b.heading!, style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w800, color: c.ink)),
      );
    }
    if (b.paragraph != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(b.paragraph!, style: TextStyle(fontSize: 14, color: c.muted, height: 1.55)),
      );
    }
    // Bullets.
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: b.bullets!.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 10),
                  child: Container(width: 5, height: 5, decoration: BoxDecoration(color: c.gold, shape: BoxShape.circle)),
                ),
                Expanded(child: Text(item, style: TextStyle(fontSize: 14, color: c.muted, height: 1.5))),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Convenience entry points — try admin content (user-app surface) first, fall
// back to the built-in copy.
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});
  @override
  Widget build(BuildContext context) => const LegalResolverScreen(contentKey: 'terms-user', fallback: termsDoc);
}

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});
  @override
  Widget build(BuildContext context) => const LegalResolverScreen(contentKey: 'privacy-user', fallback: privacyDoc);
}

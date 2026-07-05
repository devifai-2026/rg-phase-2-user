import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/vedic_extras_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/birth_details_form.dart';

/// Marriage / love compatibility (aggregate match) — instant, VedicAstro-backed.
/// Two birth-detail forms (place-searched); shows Guna Milan + doshas + score.
/// Language defaults to the app language; a picker re-runs like horoscope.
class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});
  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  BirthDetails? _girl;
  BirthDetails? _boy;
  late String _lang;
  bool _loading = false;
  String? _error;
  MatchResult? _result;

  @override
  void initState() {
    super.initState();
    _lang = context.read<SettingsProvider>().effectiveLangCode;
  }

  Future<void> _run() async {
    if (_girl == null || _boy == null || !_girl!.isComplete || !_boy!.isComplete) {
      setState(() => _error = L10n.of(context).fillBothPartners);
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() { _loading = true; _error = null; });
    try {
      final res = await context.read<VedicExtrasApi>().match(girl: _girl!, boy: _boy!, lang: _lang);
      if (!mounted) return;
      setState(() { _result = res; _loading = false; });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() { _loading = false; _error = e.statusCode == null ? L10n.of(context).errNetwork : e.message; });
    } catch (_) {
      if (!mounted) return;
      setState(() { _loading = false; _error = L10n.of(context).errGeneric; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground, elevation: 0, foregroundColor: c.ink,
        title: Text(t.compatibility, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        actions: [IconButton(tooltip: t.language, onPressed: _pickLanguage, icon: Icon(Icons.translate_rounded, color: c.gold))],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          Text(t.matchingIntro, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.4)),
          const SizedBox(height: 14),
          BirthDetailsForm(title: t.partner1, showName: true, onChanged: (b) => _girl = b),
          const SizedBox(height: 12),
          BirthDetailsForm(title: t.partner2, showName: true, onChanged: (b) => _boy = b),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: c.red, minimumSize: const Size.fromHeight(50)),
              onPressed: _loading ? null : _run,
              icon: _loading
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                  : const Icon(Icons.favorite),
              label: Text(_loading ? '…' : t.checkCompatibility, style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          if (_error != null) ...[const SizedBox(height: 12), Text(_error!, style: TextStyle(color: c.red, fontSize: 13))],
          if (_result != null) ...[const SizedBox(height: 20), _resultCard(c, t, _result!)],
        ],
      ),
    );
  }

  Widget _resultCard(RgColors c, L10n t, MatchResult r) {
    final score = r.score.clamp(0, 100);
    final scoreColor = score >= 60 ? c.green : score >= 35 ? c.gold : c.red;
    return Column(children: [
      // Score dial.
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(18), border: Border.all(color: scoreColor.withValues(alpha: 0.5))),
        child: Column(children: [
          Text(t.overallScore, style: TextStyle(color: c.muted, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          const SizedBox(height: 8),
          Text('$score', style: TextStyle(color: scoreColor, fontSize: 46, fontWeight: FontWeight.w900, height: 1)),
          Text('/ 100', style: TextStyle(color: c.muted, fontSize: 13)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: score / 100, minHeight: 8, backgroundColor: c.line, valueColor: AlwaysStoppedAnimation(scoreColor)),
          ),
          if (r.summary.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(r.summary, textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontSize: 13.5, height: 1.4)),
          ],
        ]),
      ),
      const SizedBox(height: 12),
      // Koota scores.
      Row(children: [
        if (r.ashtakoot.isNotEmpty) Expanded(child: _miniStat(c, 'Ashtakoot', r.ashtakoot)),
        if (r.ashtakoot.isNotEmpty && r.dashkoot.isNotEmpty) const SizedBox(width: 10),
        if (r.dashkoot.isNotEmpty) Expanded(child: _miniStat(c, 'Dashkoot', r.dashkoot)),
      ]),
      const SizedBox(height: 12),
      // Dosha rows from the raw response (label → text).
      ..._doshaRows(c, r.raw),
    ]);
  }

  Widget _miniStat(RgColors c, String label, String value) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
        child: Column(children: [
          Text(value, style: TextStyle(color: c.gold, fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
        ]),
      );

  // Render the text dosha fields (mangaldosh, pitradosh, kaalsarpdosh, …).
  List<Widget> _doshaRows(RgColors c, Map<String, dynamic> raw) {
    const keys = ['mangaldosh', 'pitradosh', 'kaalsarpdosh', 'manglikdosh_saturn', 'manglikdosh_rahuketu'];
    final rows = <Widget>[];
    for (final k in keys) {
      final v = raw[k];
      if (v is String && v.trim().isNotEmpty) {
        rows.add(Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.info_outline, size: 15, color: c.muted),
              const SizedBox(width: 8),
              Expanded(child: Text(v, style: TextStyle(color: c.ink, fontSize: 12.5, height: 1.4))),
            ]),
          ),
        ));
      }
    }
    return rows;
  }

  Future<void> _pickLanguage() async {
    final c = context.rg;
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: c.ground2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 8),
          for (final locale in SettingsProvider.supportedLocales)
            ListTile(
              title: Text(SettingsProvider.languageNames[locale.languageCode] ?? locale.languageCode, style: TextStyle(color: c.ink, fontWeight: FontWeight.w600)),
              trailing: _lang == locale.languageCode ? Icon(Icons.check_circle, color: c.red) : null,
              onTap: () => Navigator.of(ctx).pop(locale.languageCode),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (picked != null && picked != _lang) {
      setState(() => _lang = picked);
      if (_result != null) _run();
    }
  }
}

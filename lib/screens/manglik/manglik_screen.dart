import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/vedic_extras_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/birth_details_form.dart';

/// Manglik (Mangal) Dosha check — instant, VedicAstro-backed. One birth-detail
/// form; shows whether Manglik is present (by Mars/Saturn/Rahu-Ketu), the % score,
/// and the contributing factors. Language defaults to the app language.
class ManglikScreen extends StatefulWidget {
  const ManglikScreen({super.key});
  @override
  State<ManglikScreen> createState() => _ManglikScreenState();
}

class _ManglikScreenState extends State<ManglikScreen> {
  BirthDetails? _birth;
  late String _lang;
  bool _loading = false;
  String? _error;
  ManglikResult? _result;

  @override
  void initState() {
    super.initState();
    _lang = context.read<SettingsProvider>().effectiveLangCode;
  }

  Future<void> _run() async {
    if (_birth == null || !_birth!.isComplete) { setState(() => _error = L10n.of(context).enterBirthDetails); return; }
    FocusScope.of(context).unfocus();
    setState(() { _loading = true; _error = null; });
    try {
      final res = await context.read<VedicExtrasApi>().manglik(birth: _birth!, lang: _lang);
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
        title: Text(t.manglikDosh, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        actions: [IconButton(tooltip: t.language, onPressed: _pickLanguage, icon: Icon(Icons.translate_rounded, color: c.gold))],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          Text(t.manglikIntro, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.4)),
          const SizedBox(height: 14),
          BirthDetailsForm(title: t.manglikDosh, showName: false, onChanged: (b) => _birth = b),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: c.red, minimumSize: const Size.fromHeight(50)),
              onPressed: _loading ? null : _run,
              icon: _loading
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                  : const Icon(Icons.search),
              label: Text(_loading ? '…' : t.checkManglik, style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          if (_error != null) ...[const SizedBox(height: 12), Text(_error!, style: TextStyle(color: c.red, fontSize: 13))],
          if (_result != null) ...[const SizedBox(height: 20), _resultCard(c, _result!)],
        ],
      ),
    );
  }

  Widget _resultCard(RgColors c, ManglikResult r) {
    final present = r.isManglik;
    final tint = present ? c.red : c.green;
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(18), border: Border.all(color: tint.withValues(alpha: 0.5))),
        child: Column(children: [
          Icon(present ? Icons.warning_amber_rounded : Icons.check_circle_outline, color: tint, size: 40),
          const SizedBox(height: 8),
          Text(present ? 'Manglik' : 'Non-Manglik', style: TextStyle(color: tint, fontSize: 22, fontWeight: FontWeight.w900)),
          if (r.score > 0) ...[
            const SizedBox(height: 4),
            Text('${r.score % 1 == 0 ? r.score.toInt() : r.score}%', style: TextStyle(color: c.muted, fontSize: 14, fontWeight: FontWeight.w700)),
          ],
          if (r.summary.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(r.summary, textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontSize: 13.5, height: 1.4)),
          ],
        ]),
      ),
      const SizedBox(height: 12),
      Row(children: [
        _flag(c, 'Mars', r.byMars),
        const SizedBox(width: 8),
        _flag(c, 'Saturn', r.bySaturn),
        const SizedBox(width: 8),
        _flag(c, 'Rahu-Ketu', r.byRahuKetu),
      ]),
      if (r.factors.isNotEmpty) ...[
        const SizedBox(height: 14),
        ...r.factors.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.circle, size: 7, color: c.gold),
                  const SizedBox(width: 10),
                  Expanded(child: Text(f, style: TextStyle(color: c.ink, fontSize: 12.5, height: 1.4))),
                ]),
              ),
            )),
      ],
    ]);
  }

  Widget _flag(RgColors c, String label, bool on) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: on ? c.red.withValues(alpha: 0.1) : c.ground2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: on ? c.red.withValues(alpha: 0.4) : c.line),
          ),
          child: Column(children: [
            Icon(on ? Icons.close : Icons.check, size: 16, color: on ? c.red : c.green),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: c.muted, fontSize: 11, fontWeight: FontWeight.w600)),
          ]),
        ),
      );

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

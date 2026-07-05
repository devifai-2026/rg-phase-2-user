import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/numerology_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';

/// Numerology — instant (no cron). Prefills the logged-in user's name (editable)
/// or asks for one, runs VedicAstro numerology, and shows a premium card per
/// category (destiny/personality/…). The content language defaults to the app
/// language; a picker lets the user re-run in another language, like horoscope.
class NumerologyScreen extends StatefulWidget {
  const NumerologyScreen({super.key});
  @override
  State<NumerologyScreen> createState() => _NumerologyScreenState();
}

class _NumerologyScreenState extends State<NumerologyScreen> {
  final _nameCtrl = TextEditingController();
  late String _lang;
  bool _loading = false;
  String? _error;
  NumerologyResult? _result;

  @override
  void initState() {
    super.initState();
    _lang = context.read<SettingsProvider>().effectiveLangCode;
    // Prefill the profile name when present (editable). Ask otherwise.
    final name = context.read<AuthProvider>().user?.name ?? '';
    _nameCtrl.text = name;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) { setState(() => _error = L10n.of(context).enterYourName); return; }
    FocusScope.of(context).unfocus();
    setState(() { _loading = true; _error = null; });
    try {
      final res = await context.read<NumerologyApi>().run(name: name, lang: _lang);
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
        backgroundColor: c.ground,
        elevation: 0,
        foregroundColor: c.ink,
        title: Text(t.numerology, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        actions: [
          IconButton(tooltip: t.language, onPressed: _pickLanguage, icon: Icon(Icons.translate_rounded, color: c.gold)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          Text(t.numerologyIntro, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.4)),
          const SizedBox(height: 16),
          // Name input.
          TextField(
            controller: _nameCtrl,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _run(),
            style: TextStyle(color: c.ink, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              labelText: t.yourName,
              hintText: t.enterYourName,
              prefixIcon: Icon(Icons.badge_outlined, color: c.muted),
              filled: true,
              fillColor: c.ground2,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: c.line)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: c.line)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: c.gold)),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: c.red, minimumSize: const Size.fromHeight(50)),
              onPressed: _loading ? null : _run,
              icon: _loading
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                  : const Icon(Icons.auto_awesome),
              label: Text(_loading ? '…' : t.runNumerology, style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: TextStyle(color: c.red, fontSize: 13)),
          ],
          if (_result != null) ...[
            const SizedBox(height: 22),
            ..._result!.items.map((it) => _card(c, it)),
          ],
        ],
      ),
    );
  }

  Widget _card(RgColors c, NumerologyItem it) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Container(
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: it.master ? c.gold.withValues(alpha: 0.6) : c.line),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Big number medallion.
                Container(
                  height: 56, width: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: it.master ? [c.gold, c.gold.withValues(alpha: 0.7)] : [c.red, c.redDeep]),
                  ),
                  child: Text(it.number, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Flexible(child: Text(it.title, style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800))),
                        if (it.master) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(6)),
                            child: Text('MASTER', style: TextStyle(color: c.gold, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
                          ),
                        ],
                      ]),
                      if (it.meaning.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(it.meaning, style: TextStyle(color: c.ink, fontSize: 13.5, height: 1.45)),
                      ],
                      if (it.description.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(it.description, style: TextStyle(color: c.muted, fontSize: 12, height: 1.4)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
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
              title: Text(SettingsProvider.languageNames[locale.languageCode] ?? locale.languageCode,
                  style: TextStyle(color: c.ink, fontWeight: FontWeight.w600)),
              trailing: _lang == locale.languageCode ? Icon(Icons.check_circle, color: c.red) : null,
              onTap: () => Navigator.of(ctx).pop(locale.languageCode),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (picked != null && picked != _lang) {
      setState(() => _lang = picked);
      if (_result != null || _nameCtrl.text.trim().isNotEmpty) _run(); // re-run in the new language
    }
  }
}

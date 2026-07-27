import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../api/ai_api.dart';
import '../../api/api_client.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/shared_product_card.dart';
import 'birth_gate.dart';

/// Brihat Kundli: the whole-chart reading behind the home tile.
///
/// Differs from the life-area readings in two ways that shape this screen:
///  - An exact birth time is MANDATORY, so the gate is opened with
///    requireTob: true. The server refuses to guess, because a wrong ascendant
///    makes every house wrong.
///  - The reading comes back as four fixed sections rather than prose, so they
///    render as cards the seeker can scan and return to.
///
/// Presented as a plain astrological reading: nothing here says AI.
class BrihatKundliScreen extends StatefulWidget {
  const BrihatKundliScreen({super.key});

  @override
  State<BrihatKundliScreen> createState() => _BrihatKundliScreenState();
}

class _BrihatKundliScreenState extends State<BrihatKundliScreen> {
  AiKundli? _result;
  bool _loading = true;
  String? _error;
  BirthGateResult? _birth;

  /// The language this reading was generated in. Changing it regenerates, which
  /// is why the control is a deliberate action rather than a passive picker.
  late String _lang;

  @override
  void initState() {
    super.initState();
    _lang = context.read<SettingsProvider>().effectiveLangCode;
    WidgetsBinding.instance.addPostFrameCallback((_) => _gateThenFetch());
  }

  Future<void> _gateThenFetch() async {
    final t = L10n.of(context);
    // requireTob: this reading is meaningless without an exact time.
    final r = await showBirthGate(context, title: t.brihatKundli, requireTob: true);
    if (!mounted) return;
    if (r == null) { Navigator.of(context).pop(); return; }
    _birth = r;
    _fetch();
  }

  Future<void> _fetch() async {
    final b = _birth;
    if (b == null || b.tob == null) return;
    setState(() { _loading = true; _error = null; });
    try {
      final r = await context.read<AiApi>().kundli(
        dob: b.dob, tob: b.tob!, lat: b.lat, lng: b.lng, place: b.place, lang: _lang,
      );
      if (!mounted) return;
      if (r.needsBirthDetails) { _gateThenFetch(); return; }
      setState(() { _result = r; _loading = false; });
    } on ApiException catch (e) {
      if (mounted) setState(() { _loading = false; _error = e.message; });
    } catch (_) {
      if (mounted) setState(() { _loading = false; _error = L10n.of(context).somethingWentWrong; });
    }
  }

  /// Regenerate the reading in another language. The chart is cached server-side,
  /// so this is one model call, not a fresh chart fetch.
  Future<void> _pickLanguage() async {
    final c = context.rg;
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: c.ground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 14),
          Text(L10n.of(context).aiPickLanguage,
              style: TextStyle(color: c.ink, fontSize: 15, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final loc in SettingsProvider.supportedLocales)
                  ListTile(
                    title: Text(SettingsProvider.languageNames[loc.languageCode] ?? loc.languageCode,
                        style: TextStyle(color: c.ink, fontWeight: FontWeight.w600)),
                    trailing: _lang == loc.languageCode ? Icon(Icons.check_circle, color: c.gold) : null,
                    onTap: () => Navigator.of(ctx).pop(loc.languageCode),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (picked != null && picked != _lang && mounted) {
      setState(() => _lang = picked);
      _fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        title: Text(t.brihatKundli),
        actions: [
          // Read the whole chart in another language, in place.
          IconButton(
            tooltip: t.changeLanguage,
            onPressed: _loading ? null : _pickLanguage,
            icon: Icon(Icons.translate, color: c.gold),
          ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? _loadingState(c, t)
            : _error != null
                ? _errorState(c, t)
                : _result == null
                    ? const SizedBox.shrink()
                    : _reading(c, t, _result!),
      ),
    );
  }

  Widget _loadingState(RgColors c, L10n t) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 34, width: 34, child: CircularProgressIndicator(color: c.gold, strokeWidth: 2.6)),
          const SizedBox(height: 18),
          Text(t.readingYourChart, style: TextStyle(color: c.muted, fontSize: 13.5)),
        ]),
      );

  Widget _errorState(RgColors c, L10n t) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.error_outline, color: c.muted, size: 40),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: c.muted)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _fetch, child: Text(t.retry)),
          ]),
        ),
      );

  /// Section metadata: icon and heading per key, kept beside the render so a new
  /// section from the server can never appear without a label.
  (IconData, String) _sectionMeta(String key, L10n t) => switch (key) {
        'life' => (Icons.auto_awesome, t.kundliLife),
        'career' => (Icons.work_outline, t.tCareer),
        'health' => (Icons.favorite_border, t.tHealth),
        'fears' => (Icons.shield_moon_outlined, t.kundliFears),
        _ => (Icons.circle_outlined, key),
      };

  Widget _reading(RgColors c, L10n t, AiKundli r) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          if (r.svg != null)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: c.ground2,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: c.line),
              ),
              child: SvgPicture.string(r.svg!, height: 280, fit: BoxFit.contain),
            ),

          if (r.headline.isNotEmpty) ...[
            Text(r.headline,
                textAlign: TextAlign.center,
                style: TextStyle(color: c.gold, fontSize: 15.5, fontWeight: FontWeight.w700, height: 1.4)),
            const SizedBox(height: 18),
          ],

          for (final s in r.sections) ...[
            _section(c, _sectionMeta(s.key, t), s.body),
            const SizedBox(height: 12),
          ],

          if (r.remedies.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(t.suggestedRemedies, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            for (final m in r.remedies) _remedy(c, t, m),
          ],

          if (r.products.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(t.recommendedProduct, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            for (final p in r.products)
              Padding(padding: const EdgeInsets.only(bottom: 8), child: SharedProductCard(product: p, mine: false)),
          ],
        ],
      );

  Widget _section(RgColors c, (IconData, String) meta, String body) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: c.ground2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.line),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(meta.$1, size: 16, color: c.gold),
            const SizedBox(width: 8),
            Text(meta.$2.toUpperCase(),
                style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.1)),
          ]),
          const SizedBox(height: 10),
          SelectableText(body, style: TextStyle(color: c.ink, fontSize: 14.5, height: 1.55)),
        ]),
      );

  Widget _remedy(RgColors c, L10n t, AiMantra m) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [c.gold.withValues(alpha: 0.20), c.gold.withValues(alpha: 0.06)],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.gold.withValues(alpha: 0.55), width: 1.2),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: c.gold.withValues(alpha: 0.22),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(children: [
              Icon(Icons.self_improvement, size: 15, color: c.gold),
              const SizedBox(width: 6),
              Text(t.aiRemedy,
                  style: TextStyle(color: c.gold, fontSize: 10.5, fontWeight: FontWeight.w900, letterSpacing: 1.1)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 11, 12, 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SelectableText(m.text,
                  style: TextStyle(color: c.ink, fontSize: 15.5, fontWeight: FontWeight.w700, height: 1.45)),
              if (m.detail.isNotEmpty) ...[
                const SizedBox(height: 8),
                Row(children: [
                  Icon(Icons.repeat_rounded, size: 13, color: c.gold),
                  const SizedBox(width: 5),
                  Expanded(child: Text(m.detail,
                      style: TextStyle(color: c.gold, fontSize: 12, fontWeight: FontWeight.w700))),
                ]),
              ],
              if (m.reason != null && m.reason!.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(m.reason!, style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.35)),
              ],
            ]),
          ),
        ]),
      );
}

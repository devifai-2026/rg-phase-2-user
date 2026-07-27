import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../api/ai_api.dart';
import '../../api/api_client.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import 'birth_gate.dart';
import '../../widgets/shared_product_card.dart';

/// A reading for one life area, behind the home icons (Career, Marriage, …).
///
/// Deliberately NOT framed as AI anywhere in this screen: the copy, the icons and
/// the loading text all read as an astrological reading, which is the product
/// decision for these surfaces (the AI Astrologer chat is the surface that may
/// identify itself).
///
/// Unbilled: it is a single generation, not a metered conversation, so there is no
/// clock, no wallet lock and no idle timer.
class TopicReadingScreen extends StatefulWidget {
  /// One of aiAstrologerService.TOPICS: career|marriage|finance|health|education|travel
  final String topic;
  final String title;
  final IconData icon;
  const TopicReadingScreen({super.key, required this.topic, required this.title, this.icon = Icons.auto_awesome});

  @override
  State<TopicReadingScreen> createState() => _TopicReadingScreenState();
}

class _TopicReadingScreenState extends State<TopicReadingScreen> {
  AiReading? _result;
  bool _loading = true;
  bool _needsBirth = false;
  String? _error;


  @override
  void initState() {
    super.initState();
    // Confirm birth details BEFORE calling the server. The old flow fetched
    // first and only asked when the server replied needsBirthDetails, which cost
    // a wasted round trip and, worse, silently used whatever was on file without
    // ever showing it. The gate confirms saved details in one tap and only shows
    // a form when there is nothing usable.
    WidgetsBinding.instance.addPostFrameCallback((_) => _gateThenFetch());
  }

  Future<void> _gateThenFetch() async {
    final r = await showBirthGate(context, title: widget.title);
    if (!mounted) return;
    if (r == null) { Navigator.of(context).pop(); return; } // backed out
    _fetch(gate: r);
  }

  Future<void> _fetch({BirthGateResult? gate}) async {
    setState(() { _loading = true; _error = null; });
    try {
      final lang = context.read<SettingsProvider>().effectiveLangCode;
      final r = await context.read<AiApi>().reading(
        topic: widget.topic,
        lang: lang,
        // The form gives DD/MM/YYYY and HH:mm, which is what the backend expects.
        dob: gate?.dob,
        tob: gate?.tob,
        timeKnown: gate?.timeKnown,
        lat: gate?.lat,
        lng: gate?.lng,
        place: gate?.place,
      );
      if (!mounted) return;
      setState(() {
        _loading = false;
        _needsBirth = r.needsBirthDetails;
        _result = r.needsBirthDetails ? null : r;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() { _loading = false; _error = e.message; });
    } catch (_) {
      if (mounted) setState(() { _loading = false; _error = L10n.of(context).somethingWentWrong; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: _loading
            ? _loadingState(c)
            : _error != null
                ? _errorState(c)
                : _needsBirth
                    ? _askBirthAgain(c)
                    : _reading(c, _result!),
      ),
    );
  }

  Widget _loadingState(RgColors c) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 34, width: 34, child: CircularProgressIndicator(color: c.gold, strokeWidth: 2.6)),
          const SizedBox(height: 18),
          // Reads as an astrologer studying the chart, not as a model generating.
          Text(L10n.of(context).readingYourChart,
              style: TextStyle(color: c.muted, fontSize: 13.5)),
        ]),
      );

  Widget _errorState(RgColors c) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.error_outline, color: c.muted, size: 40),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: c.muted)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => _fetch(), child: Text(L10n.of(context).retry)),
          ]),
        ),
      );

  /// The server still wants birth details (e.g. we have a DOB but no
  /// coordinates). Re-open the gate rather than duplicating a form here.
  Widget _askBirthAgain(RgColors c) {
    final t = L10n.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(widget.icon, color: c.gold, size: 34),
          const SizedBox(height: 14),
          Text(t.birthDetailsNeededFor(widget.title),
              textAlign: TextAlign.center,
              style: TextStyle(color: c.ink, fontSize: 15, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(t.birthDetailsNeededBody,
              textAlign: TextAlign.center,
              style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.4)),
          const SizedBox(height: 18),
          ElevatedButton(onPressed: _gateThenFetch, child: Text(t.getMyReading)),
        ]),
      ),
    );
  }

  Widget _reading(RgColors c, AiReading r) {
    final t = L10n.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        // The chart itself, when the provider returned one — it grounds the
        // reading visually and makes it feel like a real consultation.
        if (r.svg != null)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: c.ground2,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: c.line),
            ),
            child: SvgPicture.string(r.svg!, height: 260, fit: BoxFit.contain),
          ),

        // An unknown birth time materially limits what can be read, so say so
        // rather than quietly giving a weaker reading.
        if (!r.timeKnown)
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: c.gold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: c.gold.withValues(alpha: 0.4)),
            ),
            child: Row(children: [
              Icon(Icons.schedule, size: 15, color: c.gold),
              const SizedBox(width: 8),
              Expanded(child: Text(t.addBirthTimeForSharper,
                  style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.3))),
            ]),
          ),

        if (r.keyTopics.isNotEmpty) ...[
          Wrap(
            spacing: 7, runSpacing: 7,
            children: [
              for (final k in r.keyTopics)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: c.aiSurface2,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: c.line),
                  ),
                  child: Text(k, style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],

        SelectableText(r.reading, style: TextStyle(color: c.ink, fontSize: 14.5, height: 1.55)),

        if (r.mantras.isNotEmpty) ...[
          const SizedBox(height: 22),
          Text(t.suggestedRemedies, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          for (final m in r.mantras) _mantra(c, m),
        ],

        if (r.products.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(t.recommendedProduct, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          for (final p in r.products)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SharedProductCard(product: p, mine: false),
            ),
        ],
      ],
    );
  }

  Widget _mantra(RgColors c, AiMantra m) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: c.aiSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.violet.withValues(alpha: 0.35)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.self_improvement, size: 15, color: c.violet),
            const SizedBox(width: 6),
            Expanded(
              child: SelectableText(m.text,
                  style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w600, height: 1.35)),
            ),
          ]),
          if (m.detail.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(m.detail, style: TextStyle(color: c.gold, fontSize: 11.5, fontWeight: FontWeight.w600)),
          ],
          if (m.reason != null && m.reason!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(m.reason!, style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.3)),
          ],
        ]),
      );
}

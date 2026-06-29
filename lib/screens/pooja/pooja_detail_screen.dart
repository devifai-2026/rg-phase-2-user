import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../api/pooja_api.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'pooja_booking_screen.dart';

/// Pooja detail by id — image, description, price, capacity, duration, and a
/// sticky "Book now" button that opens the booking form.
class PoojaDetailScreen extends StatefulWidget {
  final String poojaId;
  const PoojaDetailScreen({super.key, required this.poojaId});
  @override
  State<PoojaDetailScreen> createState() => _PoojaDetailScreenState();
}

class _PoojaDetailScreenState extends State<PoojaDetailScreen> {
  Pooja? _pooja;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final p = await context.read<PoojaApi>().type(widget.poojaId);
      if (mounted) setState(() { _pooja = p; _loading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = 'load_failed'; _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: c.ground, elevation: 0, title: Text(L10n.of(context).poojaDetails, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: c.red))
          : _error != null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.cloud_off, color: c.muted, size: 42),
                  const SizedBox(height: 12),
                  Text(L10n.of(context).couldNotLoadThisPooja, style: TextStyle(color: c.ink)),
                  const SizedBox(height: 12),
                  OutlinedButton(onPressed: _load, child: Text(L10n.of(context).retry)),
                ]))
              : _content(c),
      bottomNavigationBar: (_pooja == null || _loading)
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Row(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    Text(L10n.of(context).price, style: TextStyle(color: c.muted, fontSize: 11)),
                    Text(_pooja!.priceLabel, style: TextStyle(color: c.red, fontWeight: FontWeight.w800, fontSize: 20)),
                  ]),
                  const SizedBox(width: 16),
                  Expanded(child: ElevatedButton.icon(
                    icon: const Icon(Icons.event_available),
                    label: Text(L10n.of(context).bookNow),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                    onPressed: () => Navigator.of(context).push(slideRoute(PoojaBookingScreen(pooja: _pooja!))),
                  )),
                ]),
              ),
            ),
    );
  }

  Widget _content(RgColors c) {
    final p = _pooja!;
    final img = p.detailImage ?? ''; // landscape preferred for the detail header
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Detail header uses the landscape image (cropped 16:9 in admin) — a 16:9
        // box with cover fills edge-to-edge with no letterbox and no clipping.
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: c.card,
            child: img.isEmpty
                ? Icon(Icons.temple_hindu_outlined, color: c.gold, size: 60)
                : Image.network(img, fit: BoxFit.cover, width: double.infinity,
                    errorBuilder: (_, __, ___) => Icon(Icons.temple_hindu_outlined, color: c.gold, size: 60)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (p.categoryName != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(20)),
                  child: Text(p.categoryName!, style: TextStyle(color: c.red, fontSize: 11.5, fontWeight: FontWeight.w700)),
                ),
              Text(p.name, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 21)),
              const SizedBox(height: 16),

              // Info grid — always fills the space so short-description poojas
              // don't look empty. Each tile is an at-a-glance fact.
              Row(children: [
                _infoTile(c, Icons.payments_outlined, 'Price', p.priceLabel, highlight: true),
                const SizedBox(width: 10),
                if (p.durationLabel.isNotEmpty)
                  _infoTile(c, Icons.schedule, L10n.of(context).duration, p.durationLabel),
                if (p.durationLabel.isNotEmpty) const SizedBox(width: 10),
                _infoTile(c, Icons.group_outlined, L10n.of(context).forLabel, p.maxPersons > 0 ? L10n.of(context).upToPMaxpersons(p.maxPersons) : L10n.of(context).s1Person),
              ]),

              // Social proof: booked count + rating, when present.
              if (p.bookedLabel.isNotEmpty || p.rating > 0) ...[
                const SizedBox(height: 10),
                Row(children: [
                  if (p.rating > 0) ...[
                    Icon(Icons.star_rounded, size: 16, color: c.gold),
                    const SizedBox(width: 3),
                    Text('${p.rating.toStringAsFixed(1)}${p.reviewCount > 0 ? ' (${p.reviewCount})' : ''}', style: TextStyle(color: c.ink, fontSize: 12.5, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 14),
                  ],
                  if (p.bookedLabel.isNotEmpty) ...[
                    Icon(Icons.event_available_outlined, size: 15, color: c.muted),
                    const SizedBox(width: 4),
                    Text(p.bookedLabel, style: TextStyle(color: c.muted, fontSize: 12.5, fontWeight: FontWeight.w600)),
                  ],
                ]),
              ],

              // Availability window — only when the admin set one.
              if (p.availabilityLabel.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12), border: Border.all(color: c.gold.withValues(alpha: 0.3))),
                  child: Row(children: [
                    Icon(Icons.event_available, size: 16, color: c.gold),
                    const SizedBox(width: 8),
                    Text(p.availabilityLabel, style: TextStyle(color: c.gold, fontSize: 12.5, fontWeight: FontWeight.w700)),
                  ]),
                ),
              ],

              const SizedBox(height: 20),
              Text(L10n.of(context).aboutThisPooja, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
              const SizedBox(height: 6),
              Text(
                (p.description ?? '').isNotEmpty
                    ? p.description!
                    : L10n.of(context).aSacredPNamePerformedBy(p.name),
                style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.5),
              ),

              const SizedBox(height: 22),
              // Pandit callout — the key promise, given prominence (not a list item).
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [c.redSoft, c.ground2], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: c.red.withValues(alpha: 0.25)),
                ),
                child: Row(children: [
                  Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(color: c.red.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.phone_in_talk_rounded, color: c.red, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(L10n.of(context).ourPanditWillCallYou, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13.5)),
                    const SizedBox(height: 2),
                    Text(L10n.of(context).beforeThePoojaToConfirmThe,
                        style: TextStyle(color: c.muted, fontSize: 12, height: 1.3)),
                  ])),
                ]),
              ),

              const SizedBox(height: 18),
              // How it works — three concise, designed steps (not a checklist).
              Text(L10n.of(context).howItWorks, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
              const SizedBox(height: 12),
              _step(c, '1', L10n.of(context).bookShareDetails, L10n.of(context).confirmYourBookingWithTheNames),
              _step(c, '2', L10n.of(context).panditCoordinates, L10n.of(context).aVerifiedPanditCallsToFix),
              _step(c, '3', L10n.of(context).poojaPerformed, L10n.of(context).sankalpIsTakenInYourFamily, last: true),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoTile(RgColors c, IconData icon, String label, String value, {bool highlight = false}) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: highlight ? c.redSoft : c.ground2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: highlight ? c.red.withValues(alpha: 0.4) : c.line),
          ),
          child: Column(children: [
            Icon(icon, size: 18, color: highlight ? c.red : c.muted),
            const SizedBox(height: 6),
            Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: highlight ? c.red : c.ink, fontWeight: FontWeight.w800, fontSize: 13.5)),
            const SizedBox(height: 1),
            Text(label, style: TextStyle(color: c.muted, fontSize: 10.5)),
          ]),
        ),
      );

  // A numbered step row with a connecting line — reads as a designed flow,
  // not a grocery checklist.
  Widget _step(RgColors c, String n, String title, String body, {bool last = false}) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              Container(
                height: 26, width: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: c.redSoft, shape: BoxShape.circle, border: Border.all(color: c.red.withValues(alpha: 0.4))),
                child: Text(n, style: TextStyle(color: c.red, fontWeight: FontWeight.w800, fontSize: 12.5)),
              ),
              if (!last) Expanded(child: Container(width: 2, margin: const EdgeInsets.symmetric(vertical: 4), color: c.line)),
            ]),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: last ? 0 : 16, top: 2),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
                  const SizedBox(height: 2),
                  Text(body, style: TextStyle(color: c.muted, fontSize: 12, height: 1.35)),
                ]),
              ),
            ),
          ],
        ),
      );
}

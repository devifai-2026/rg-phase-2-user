import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// Astrologer filters (static UI): expertise, languages, availability, price.
/// Returns the chosen filters via Navigator.pop; the list applies them later.
class AstrologerFilters {
  final Set<String> expertise;
  final Set<String> languages;
  final bool onlineOnly;
  final double maxPrice;
  const AstrologerFilters({this.expertise = const {}, this.languages = const {}, this.onlineOnly = false, this.maxPrice = 100});
}

Future<AstrologerFilters?> showFiltersSheet(BuildContext context, AstrologerFilters current) {
  return showModalBottomSheet<AstrologerFilters>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _FiltersSheet(current: current),
  );
}

class _FiltersSheet extends StatefulWidget {
  final AstrologerFilters current;
  const _FiltersSheet({required this.current});
  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  static const _expertise = ['Vedic', 'Tarot', 'Numerology', 'Vastu', 'Palmistry', 'KP', 'Love', 'Lal Kitab'];
  static const _languages = ['Hindi', 'English', 'Bengali', 'Tamil', 'Marathi', 'Punjabi', 'Telugu'];

  late final Set<String> _exp = {...widget.current.expertise};
  late final Set<String> _lang = {...widget.current.languages};
  late bool _online = widget.current.onlineOnly;
  late double _maxPrice = widget.current.maxPrice;

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      expand: false,
      builder: (_, scroll) => Container(
        decoration: BoxDecoration(
          color: c.ground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          border: Border.all(color: c.line),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2))),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
              child: Row(children: [
                Text(L10n.of(context).filters, style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() { _exp.clear(); _lang.clear(); _online = false; _maxPrice = 100; }),
                  child: Text(L10n.of(context).reset, style: TextStyle(color: c.red, fontWeight: FontWeight.w700)),
                ),
              ]),
            ),
            Expanded(
              child: ListView(
                controller: scroll,
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 20),
                children: [
                  // Availability.
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
                    child: Row(children: [
                      Icon(Icons.bolt, color: c.gold, size: 18),
                      const SizedBox(width: 10),
                      Expanded(child: Text(L10n.of(context).onlineNowOnly, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w600))),
                      Switch(value: _online, activeThumbColor: c.red, onChanged: (v) => setState(() => _online = v)),
                    ]),
                  ),
                  const SizedBox(height: 20),

                  _label(c, L10n.of(context).expertise),
                  _chips(c, _expertise, _exp),
                  const SizedBox(height: 20),

                  _label(c, L10n.of(context).languages),
                  _chips(c, _languages, _lang),
                  const SizedBox(height: 20),

                  _label(c, L10n.of(context).maxPriceMaxpriceRoundMin(_maxPrice.round())),
                  Slider(
                    value: _maxPrice, min: 10, max: 100, divisions: 18,
                    activeColor: c.red, label: '₹${_maxPrice.round()}',
                    onChanged: (v) => setState(() => _maxPrice = v),
                  ),
                ],
              ),
            ),
            // Apply.
            Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 16 + MediaQuery.of(context).padding.bottom),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(AstrologerFilters(
                    expertise: _exp, languages: _lang, onlineOnly: _online, maxPrice: _maxPrice,
                  )),
                  child: Text(L10n.of(context).applyFilters),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(RgColors c, String t) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(t, style: TextStyle(color: c.ink, fontSize: 14.5, fontWeight: FontWeight.w800)),
      );

  Widget _chips(RgColors c, List<String> all, Set<String> sel) => Wrap(
        spacing: 8, runSpacing: 8,
        children: all.map((o) {
          final on = sel.contains(o);
          return GestureDetector(
            onTap: () => setState(() => on ? sel.remove(o) : sel.add(o)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: on ? c.redSoft : c.ground2,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: on ? c.red : c.line),
              ),
              child: Text(o, style: TextStyle(color: on ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          );
        }).toList(),
      );
}

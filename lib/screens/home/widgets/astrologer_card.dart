import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/rg_colors.dart';
import '../../../widgets/cached_image.dart';

/// Compact astrologer chip for home rails — circular avatar with a status ring
/// (the ring IS the status indicator: green = online, red = busy, grey =
/// offline), full name (up to 2 lines), language chips, rating + ₹/min.
class AstrologerCard extends StatelessWidget {
  final String name;
  final int ratePerMin;
  final String status; // 'online' | 'busy' | 'offline'
  final bool ai;
  final List<String> languages; // shown as small chips under the name
  final double? rating; // 0..5 (null/0 → hidden)
  final String? imageUrl; // null → empty image placeholder
  const AstrologerCard({
    super.key,
    required this.name,
    required this.ratePerMin,
    this.status = 'offline',
    this.ai = false,
    this.languages = const [],
    this.rating,
    this.imageUrl,
  });

  /// Height the home rails must give this card so nothing overflows and every
  /// card still lines up. Single source of truth — the rails used to hardcode
  /// 158, which a 2-line Bengali/Devanagari name overran by 5px.
  ///
  /// Breakdown of the column this card builds, top to bottom:
  ///   avatar 65 (r=30 → 60, + 2.5 padding + 2 ring on both sides)
  ///   + 7  gap
  ///   + 28 name — 2 lines at fontSize 12, height 1.15
  ///   + 17 rating row (3 gap + 14 line)
  ///   + 24 language chips (4 gap + 20 chip)
  ///   + 18 ₹/min (4 gap + 14 line)
  ///   = 159, plus 4 slack so a descender or a 1px rounding difference in a
  ///     tall script can't reintroduce the overflow.
  ///
  /// Only the TEXT scales with the user's font setting — the avatar and the gaps
  /// are fixed — so the two parts are scaled separately rather than multiplying
  /// the whole thing.
  static double railHeight(BuildContext context) =>
      100 + MediaQuery.textScalerOf(context).scale(63);

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final green = c.green;

    // The status RING is the only status indicator now (no text pill):
    // Live = red (broadcasting), Online = green, Busy = red, Offline = grey line.
    // AI overrides with copper.
    final ringColor = ai
        ? c.gold
        : switch (status) {
            'live' => c.red,
            'online' => green,
            'busy' => c.red,
            _ => c.line,
          };

    // Languages on a SINGLE row (the card is only ~100px wide). With overflow we
    // show 1 chip + a "+N" chip so both fit on one line; with ≤2 languages we
    // show up to 2. This avoids the "+N wraps to a second line" layout break.
    final allLangs = languages.map((l) => l.trim()).where((l) => l.isNotEmpty).toSet().toList();
    final hasOverflow = allLangs.length > 2;
    final langs = allLangs.take(hasOverflow ? 1 : 2).toList();
    final extraLangs = allLangs.length - langs.length; // >0 only when overflowing
    final showRating = !ai && (rating ?? 0) > 0;

    return SizedBox(
      // Wider so the full name fits (no premature ellipsis / right-side gap).
      width: 100,
      // The rails give this card a FIXED height (see [railHeight]) so all cards
      // line up. That height is computed from the content below, but a computed
      // constant is still a constant: a font this code has never seen could
      // report a taller line and reintroduce the 5px overflow. So the name is
      // ALSO wrapped in Flexible (below) — if the box is ever a pixel short, the
      // name drops to one line instead of the card overflowing. Belt and braces:
      // the height is normally exact, and the layout degrades safely if it isn't.
      // NOT wrapped in Center/MainAxisSize.min: the Column must receive the
      // rail's bounded height for the Flexible name to have anything to flex
      // against. With min sizing the Column is unbounded and Flexible is inert,
      // which is exactly how the original overflowed instead of degrading.
      child: Column(
        children: [
          // Avatar with the status ring (no overlaid pill).
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ringColor, width: 2),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: c.card,
              backgroundImage: cachedImageProvider(imageUrl),
              child: cachedImageProvider(imageUrl) == null ? Icon(Icons.person, color: c.muted, size: 28) : null,
            ),
          ),
          const SizedBox(height: 7),
          // Full name — wrap to up to 2 lines (uses the card's full width) before
          // ellipsizing, so "Pandit Saanvi" etc. is never cut to "Pandit Sa…".
          // Flexible so the name is what gives way if the rail is ever a pixel
          // short, rather than the card overflowing its box.
          Flexible(
            child: SizedBox(
            width: double.infinity,
            child: Text(name, maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: c.ink, fontWeight: FontWeight.w600, fontSize: 12, height: 1.15)),
            ),
          ),
          // Rating ★ + value.
          if (showRating) ...[
            const SizedBox(height: 3),
            Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.star_rounded, size: 12, color: c.gold),
              const SizedBox(width: 2),
              Text(rating!.toStringAsFixed(1),
                  style: TextStyle(color: c.ink, fontSize: 10.5, fontWeight: FontWeight.w700)),
            ]),
          ],
          // Language chips on ONE line (no wrap): up to 2, or 1 + "+N" overflow.
          if (!ai && langs.isNotEmpty) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: _LangChip(label: langs.first, c: c)),
                for (final l in langs.skip(1)) ...[
                  const SizedBox(width: 4),
                  Flexible(child: _LangChip(label: l, c: c)),
                ],
                if (extraLangs > 0) ...[
                  const SizedBox(width: 4),
                  _LangChip(label: '+$extraLangs', c: c),
                ],
              ],
            ),
          ],
          const SizedBox(height: 4),
          Text(ai ? L10n.of(context).free : L10n.of(context).rateperminMin(ratePerMin),
              style: TextStyle(color: c.gold, fontSize: 10.5, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Tiny language pill used under the name in [AstrologerCard].
class _LangChip extends StatelessWidget {
  final String label;
  final RgColors c;
  const _LangChip({required this.label, required this.c});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
      decoration: BoxDecoration(
        color: c.ground2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.line),
      ),
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: TextStyle(color: c.muted, fontSize: 8.5, fontWeight: FontWeight.w600)),
    );
  }
}

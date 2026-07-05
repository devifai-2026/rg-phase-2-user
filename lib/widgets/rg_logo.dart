import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/rg_colors.dart';

/// The Rudraganga ("RG group") brand mark, drawn with a CustomPainter so it
/// needs no image asset: a crimson ring with gold sun-rays and the "RG"
/// monogram at the centre. Drop a real logo into assets/images/ and swap this
/// out later if desired.
class RgLogo extends StatelessWidget {
  final double size;
  final bool showWordmark;
  /// Tenant brand name to show under the mark. White-label: pass the tenant's
  /// appName so the fallback splash/login never shows a hardcoded brand. When
  /// null/empty the wordmark is omitted (mark only).
  final String? brandName;
  const RgLogo({super.key, this.size = 120, this.showWordmark = false, this.brandName});

  // Monogram from the tenant brand (e.g. "Astro Talk" → "AT"), 1–2 letters.
  // Falls back to a neutral star when no brand — NEVER the hardcoded "RG".
  static String _initials(String? name) {
    final parts = (name ?? '').trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '✦';
    return (parts[0][0] + (parts.length > 1 ? parts[1][0] : '')).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(painter: _RgMarkPainter(red: c.redDeep, gold: c.gold, ink: c.ink, monogram: _initials(brandName))),
        ),
        if (showWordmark && (brandName ?? '').trim().isNotEmpty) ...[
          SizedBox(height: size * 0.16),
          // Tenant brand wordmark — split so the tail is accent-coloured, like the
          // original. White-label: uses the passed brandName, never a hardcoded one.
          Builder(builder: (_) {
            final name = brandName!.trim();
            final cut = name.length > 4 ? (name.length / 2).ceil() : name.length;
            return Text.rich(
              TextSpan(children: [
                TextSpan(text: name.substring(0, cut), style: TextStyle(color: c.ink)),
                if (cut < name.length) TextSpan(text: name.substring(cut), style: TextStyle(color: c.red)),
              ]),
              style: TextStyle(
                fontSize: size * 0.22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            );
          }),
        ],
      ],
    );
  }
}

class _RgMarkPainter extends CustomPainter {
  final Color red;
  final Color gold;
  final Color ink;
  final String monogram;
  _RgMarkPainter({required this.red, required this.gold, required this.ink, this.monogram = '✦'});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;

    // Gold sun rays around the ring.
    final ray = Paint()
      ..color = gold
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.018;
    const rays = 16;
    for (var i = 0; i < rays; i++) {
      final a = (i / rays) * 2 * math.pi;
      final p1 = center + Offset(math.cos(a), math.sin(a)) * (r * 0.92);
      final p2 = center + Offset(math.cos(a), math.sin(a)) * (r * 1.0);
      canvas.drawLine(p1, p2, ray);
    }

    // Crimson disc.
    final disc = Paint()..color = red;
    canvas.drawCircle(center, r * 0.8, disc);

    // Inner ground ring (thin).
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02
      ..color = gold.withValues(alpha: 0.9);
    canvas.drawCircle(center, r * 0.8, ring);

    // Tenant monogram (initials of the brand) — never a hardcoded "RG".
    final tp = TextPainter(
      text: TextSpan(
        text: monogram,
        style: TextStyle(
          color: const Color(0xFFFBF6EF),
          fontSize: r * 0.62,
          fontWeight: FontWeight.w900,
          letterSpacing: -1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant _RgMarkPainter old) =>
      old.red != red || old.gold != gold || old.ink != ink || old.monogram != monogram;
}

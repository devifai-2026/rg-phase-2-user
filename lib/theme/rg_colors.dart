import 'package:flutter/material.dart';

/// Rudraganga brand tokens, exposed as a ThemeExtension so any widget can read
/// `Theme.of(context).extension<RgColors>()!` (or the `context.rg` helper).
///
/// The DARK set is the spec the brand provided verbatim. The LIGHT set is a
/// matching cream-ground derivation that keeps the same crimson/gold identity.
///
/// These compiled sets are the FALLBACK. At launch the app fetches the admin
/// Theme Studio tokens (App Configuration → Theme) and overlays any that are
/// set via [merge]; unset tokens keep the compiled value.
@immutable
class RgColors extends ThemeExtension<RgColors> {
  final Color ground; // page background
  final Color ground2; // slightly lifted bands/sections
  final Color card; // glass panel over the ground
  final Color red; // primary accent (brightened logo red)
  final Color redDeep; // hover / depth — exact logo red
  final Color redSoft; // soft fills, chips
  final Color ink; // headings & body
  final Color muted; // secondary text
  final Color gold; // devotional accent (stars, the sun)
  final Color line; // hairline borders
  // Semantic accents (previously hardcoded across screens).
  final Color violet; // AI astrologer accent
  final Color indigo; // AI gradient partner
  final Color aiSurface; // AI card surface
  final Color aiSurface2; // AI card surface (deeper)
  final Color mint; // "always available" accent
  final Color green; // online / positive
  final Color blue; // video / info

  const RgColors({
    required this.ground,
    required this.ground2,
    required this.card,
    required this.red,
    required this.redDeep,
    required this.redSoft,
    required this.ink,
    required this.muted,
    required this.gold,
    required this.line,
    required this.violet,
    required this.indigo,
    required this.aiSurface,
    required this.aiSurface2,
    required this.mint,
    required this.green,
    required this.blue,
  });

  /// Dark — brand tokens. Secondary accent is a muted brass/copper (not bright
  /// gold) — earthy + devotional, premium against the near-black ground.
  static const dark = RgColors(
    ground: Color(0xFF0B0B0C), // --cream
    ground2: Color(0xFF121012), // --cream-2
    card: Color(0x0BFFFFFF), // --card  rgba(255,255,255,.045)
    red: Color(0xFFE0584A), // --red
    redDeep: Color(0xFFC0392B), // --red-d (exact logo red)
    redSoft: Color(0x29E0584A), // --red-soft rgba(224,88,74,.16)
    ink: Color(0xFFFBF6EF), // --ink (warm white)
    muted: Color(0x9EF4EFE6), // --muted rgba(244,239,230,.62)
    gold: Color(0xFFC98A5E), // accent — warm copper/brass
    line: Color(0x1AFFFFFF), // --line rgba(255,255,255,.10)
    violet: Color(0xFF6D4B9E),
    indigo: Color(0xFF3B5BA9),
    aiSurface: Color(0xFF1B1730),
    aiSurface2: Color(0xFF151226),
    mint: Color(0xFF8FD0C0),
    green: Color(0xFF2E9E6B),
    blue: Color(0xFF2D6FB0),
  );

  /// Light — cream ground, ink text on white, crimson + copper accents.
  static const light = RgColors(
    ground: Color(0xFFFBF6EF), // warm cream
    ground2: Color(0xFFF3ECE0), // lifted band
    card: Color(0xFFFFFFFF), // solid white panel
    red: Color(0xFFC0392B), // exact logo red reads best on light
    redDeep: Color(0xFFA42E22), // deeper hover
    redSoft: Color(0x1FC0392B), // rgba(192,57,43,.12)
    ink: Color(0xFF16140F), // near-black warm ink
    muted: Color(0x99231F18), // rgba(35,31,24,.60)
    gold: Color(0xFFA86A3D), // deeper copper for contrast on cream
    line: Color(0x14000000), // rgba(0,0,0,.08)
    violet: Color(0xFF7A57AE),
    indigo: Color(0xFF4A6BC0),
    aiSurface: Color(0xFFF1ECFB),
    aiSurface2: Color(0xFFE7E0F6),
    mint: Color(0xFF2E9E6B),
    green: Color(0xFF1C9963),
    blue: Color(0xFF2B6CB0),
  );

  @override
  RgColors copyWith({
    Color? ground,
    Color? ground2,
    Color? card,
    Color? red,
    Color? redDeep,
    Color? redSoft,
    Color? ink,
    Color? muted,
    Color? gold,
    Color? line,
    Color? violet,
    Color? indigo,
    Color? aiSurface,
    Color? aiSurface2,
    Color? mint,
    Color? green,
    Color? blue,
  }) {
    return RgColors(
      ground: ground ?? this.ground,
      ground2: ground2 ?? this.ground2,
      card: card ?? this.card,
      red: red ?? this.red,
      redDeep: redDeep ?? this.redDeep,
      redSoft: redSoft ?? this.redSoft,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      gold: gold ?? this.gold,
      line: line ?? this.line,
      violet: violet ?? this.violet,
      indigo: indigo ?? this.indigo,
      aiSurface: aiSurface ?? this.aiSurface,
      aiSurface2: aiSurface2 ?? this.aiSurface2,
      mint: mint ?? this.mint,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  /// Overlay a map of admin token hex strings ('#AARRGGBB' or '0xAARRGGBB' or
  /// '#RRGGBB'); unset/invalid tokens keep the compiled value. Used to build the
  /// live theme from the admin Theme Studio at launch.
  RgColors merge(Map<String, dynamic>? m) {
    if (m == null || m.isEmpty) return this;
    Color? p(String key) => _parseHex(m[key]);
    return copyWith(
      ground: p('ground'), ground2: p('ground2'), card: p('card'),
      red: p('red'), redDeep: p('redDeep'), redSoft: p('redSoft'),
      ink: p('ink'), muted: p('muted'), gold: p('gold'), line: p('line'),
      violet: p('violet'), indigo: p('indigo'), aiSurface: p('aiSurface'),
      aiSurface2: p('aiSurface2'), mint: p('mint'), green: p('green'), blue: p('blue'),
    );
  }

  @override
  RgColors lerp(ThemeExtension<RgColors>? other, double t) {
    if (other is! RgColors) return this;
    return RgColors(
      ground: Color.lerp(ground, other.ground, t)!,
      ground2: Color.lerp(ground2, other.ground2, t)!,
      card: Color.lerp(card, other.card, t)!,
      red: Color.lerp(red, other.red, t)!,
      redDeep: Color.lerp(redDeep, other.redDeep, t)!,
      redSoft: Color.lerp(redSoft, other.redSoft, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      line: Color.lerp(line, other.line, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      indigo: Color.lerp(indigo, other.indigo, t)!,
      aiSurface: Color.lerp(aiSurface, other.aiSurface, t)!,
      aiSurface2: Color.lerp(aiSurface2, other.aiSurface2, t)!,
      mint: Color.lerp(mint, other.mint, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
    );
  }
}

/// Parse '#AARRGGBB' / '0xAARRGGBB' / '#RRGGBB' → Color. Returns null on bad input
/// (so callers fall back to the compiled token).
Color? _parseHex(dynamic v) {
  if (v == null) return null;
  var s = v.toString().trim().replaceAll('#', '').replaceAll('0x', '').replaceAll('0X', '');
  if (s.length == 6) s = 'FF$s'; // assume opaque if no alpha
  if (s.length != 8) return null;
  final n = int.tryParse(s, radix: 16);
  return n == null ? null : Color(n);
}

/// `context.rg.red` etc.
extension RgColorsX on BuildContext {
  RgColors get rg => Theme.of(this).extension<RgColors>()!;
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/rg_colors.dart';

/// The D1 birth chart, on a ground it can actually be read against.
///
/// VedicAstro draws the chart with near-black strokes and text and no background
/// of its own — it assumes it is being placed on white paper. Dropping that
/// straight onto the app's dark surface made the chart effectively invisible.
///
/// So the card keeps a light ground in BOTH themes rather than following the
/// surface colour. This is deliberate: the chart is a document, like a scanned
/// horoscope, and inverting the provider's colours would mean rewriting its SVG.
/// The border and radius still come from the theme so it sits in the page.
Widget chartCard(RgColors c, String svg, double height) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // Warm off-white, not pure #FFF: less of a glare against a dark page.
        color: const Color(0xFFFBF6EF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.line),
      ),
      child: SvgPicture.string(svg, height: height, fit: BoxFit.contain),
    );

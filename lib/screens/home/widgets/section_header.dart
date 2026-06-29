import 'package:flutter/material.dart';
import '../../../theme/rg_colors.dart';

/// "Title ............ See all >" row used above every home section.
/// [subtitle] renders in small muted text beside the title (e.g. a location).
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? subtitleIcon;
  final VoidCallback? onSeeAll;
  final String seeAllLabel;
  const SectionHeader(this.title, {super.key, this.subtitle, this.subtitleIcon, this.onSeeAll, this.seeAllLabel = 'See all'});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final sub = subtitle?.trim() ?? '';
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 8, 8),
      child: Row(
        children: [
          // Small copper tick before the title.
          Container(width: 3, height: 16, decoration: BoxDecoration(color: c.gold, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 9),
          // Title + optional location chip take ALL the leading space, so the
          // "See all" button is always flush to the right edge across sections.
          Expanded(
            child: Row(
              children: [
                // Title takes priority: it only ellipsizes once the subtitle has
                // already shrunk to nothing (flexible subtitle yields first).
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false,
                      style: TextStyle(color: c.ink, fontSize: 15.5, fontWeight: FontWeight.w800)),
                ),
                if (sub.isNotEmpty)
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(width: 8),
                      if (subtitleIcon != null) ...[
                        Icon(subtitleIcon, size: 12, color: c.muted),
                        const SizedBox(width: 2),
                      ],
                      Flexible(
                        child: Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false,
                            style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
                      ),
                    ]),
                  ),
              ],
            ),
          ),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8)),
              child: Row(children: [
                Text(seeAllLabel, style: TextStyle(color: c.red, fontSize: 13, fontWeight: FontWeight.w600)),
                Icon(Icons.chevron_right, size: 18, color: c.red),
              ]),
            ),
        ],
      ),
    );
  }
}

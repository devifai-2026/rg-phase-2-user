import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// Clean placeholder for sections whose screens aren't built yet.
class ComingSoonScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  const ComingSoonScreen({super.key, required this.title, this.icon = Icons.auto_awesome});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 88, width: 88,
              decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(24)),
              child: Icon(icon, size: 42, color: c.red),
            ),
            const SizedBox(height: 20),
            Text(title, style: TextStyle(color: c.ink, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(L10n.of(context).comingSoon, style: TextStyle(color: c.muted, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

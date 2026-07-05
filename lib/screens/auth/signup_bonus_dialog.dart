import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// One-time celebration shown to a brand-new user when a signup wallet bonus was
/// actually credited (amount > 0). Lightweight in-house confetti (no extra
/// package): colored shards fall while a gift card scales in.
///
/// Call [SignupBonusDialog.show] only when the verify response reported a
/// credited bonus, so it never appears for a ₹0 / disabled bonus.
class SignupBonusDialog extends StatefulWidget {
  final int amount;
  const SignupBonusDialog({super.key, required this.amount});

  static Future<void> show(BuildContext context, int amount) {
    if (amount <= 0) return Future.value();
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => SignupBonusDialog(amount: amount),
    );
  }

  @override
  State<SignupBonusDialog> createState() => _SignupBonusDialogState();
}

class _SignupBonusDialogState extends State<SignupBonusDialog> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600))..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(28),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Confetti behind the card.
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _ctrl,
                builder: (_, __) => CustomPaint(painter: _ConfettiPainter(_ctrl.value, [c.gold, c.red, c.green, c.violet])),
              ),
            ),
          ),
          // Bonus card.
          Container(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: c.gold.withValues(alpha: 0.5)),
              boxShadow: [BoxShadow(color: c.gold.withValues(alpha: 0.25), blurRadius: 30, offset: const Offset(0, 10))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: CurvedAnimation(parent: _ctrl, curve: const Interval(0, 0.5, curve: Curves.elasticOut)),
                  child: Container(
                    height: 76, width: 76,
                    decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [c.gold, c.gold.withValues(alpha: 0.7)])),
                    child: const Icon(Icons.card_giftcard_rounded, color: Color(0xFF1A1408), size: 40),
                  ),
                ),
                const SizedBox(height: 18),
                Text(t.welcomeBonusTitle, textAlign: TextAlign.center,
                    style: TextStyle(color: c.ink, fontSize: 20, fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                Text('₹${widget.amount}', style: TextStyle(color: c.gold, fontSize: 40, fontWeight: FontWeight.w900, height: 1.1)),
                const SizedBox(height: 6),
                Text(t.welcomeBonusBody, textAlign: TextAlign.center,
                    style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.4)),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: c.red, minimumSize: const Size.fromHeight(48)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(t.welcomeBonusCta, style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  final double progress; // 0..1
  final List<Color> colors;
  _ConfettiPainter(this.progress, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final rnd = math.Random(7); // fixed seed → stable shard layout across frames
    const count = 44;
    for (var i = 0; i < count; i++) {
      final startX = rnd.nextDouble() * size.width;
      final drift = (rnd.nextDouble() - 0.5) * 60;
      final delay = rnd.nextDouble() * 0.3;
      final p = ((progress - delay) / (1 - delay)).clamp(0.0, 1.0);
      final y = -20 + p * (size.height + 40);
      final x = startX + drift * p;
      final paint = Paint()..color = colors[i % colors.length].withValues(alpha: (1 - p).clamp(0.0, 1.0));
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p * 6 + i);
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: 6, height: 9), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) => old.progress != progress;
}

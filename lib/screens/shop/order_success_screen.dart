import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// Shown after a successful wallet checkout.
class OrderSuccessScreen extends StatelessWidget {
  final String orderId;
  final int total;
  const OrderSuccessScreen({super.key, required this.orderId, required this.total});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 96, width: 96,
                decoration: BoxDecoration(color: c.green.withValues(alpha: 0.14), shape: BoxShape.circle),
                child: Icon(Icons.check_rounded, color: c.green, size: 56),
              ),
              const SizedBox(height: 24),
              Text(L10n.of(context).orderPlaced, style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 24)),
              const SizedBox(height: 8),
              Text(L10n.of(context).totalPaidFromYourWalletYour(total),
                  textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 14, height: 1.5)),
              if (orderId.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(L10n.of(context).orderOrderidLength6OrderidSubstring(orderId.length > 6 ? orderId.substring(orderId.length - 6).toUpperCase() : orderId),
                    style: TextStyle(color: c.gold, fontSize: 13, fontWeight: FontWeight.w700)),
              ],
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                  style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(52)),
                  child: Text(L10n.of(context).continueShopping, style: const TextStyle(fontWeight: FontWeight.w800)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

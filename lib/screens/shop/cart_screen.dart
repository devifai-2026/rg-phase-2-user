import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/cart_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../wallet/wallet_screen.dart';
import 'checkout_screen.dart';

/// Cart — line items with qty steppers + remove, a savings summary, and a
/// sticky checkout bar. Server is the source of truth (CartProvider).
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // Re-hydrate on open (prices/stock may have changed).
    WidgetsBinding.instance.addPostFrameCallback((_) => context.read<CartProvider>().refresh());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final cartP = context.watch<CartProvider>();
    final cart = cartP.cart;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground, elevation: 0,
        title: Text(L10n.of(context).cart, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
        actions: [
          if (cart.items.isNotEmpty)
            TextButton(onPressed: () => context.read<CartProvider>().clear(), child: Text(L10n.of(context).clear, style: TextStyle(color: c.red))),
        ],
      ),
      body: cart.items.isEmpty
          ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.shopping_cart_outlined, color: c.muted, size: 54),
              const SizedBox(height: 14),
              Text(L10n.of(context).yourCartIsEmpty, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 16)),
              const SizedBox(height: 6),
              Text(L10n.of(context).browseProductsAndAddThemHere, style: TextStyle(color: c.muted, fontSize: 13)),
            ]))
          : ListView(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
              children: [
                ...cart.items.map((it) => _CartLine(
                      item: it,
                      busy: cartP.busy,
                      onInc: it.qty < it.stock ? () => context.read<CartProvider>().setQty(it.productId, it.qty + 1) : null,
                      onDec: () => context.read<CartProvider>().setQty(it.productId, it.qty - 1),
                      onRemove: () => context.read<CartProvider>().remove(it.productId),
                    )),
                const SizedBox(height: 8),
                _Summary(subtotal: cart.subtotal, savings: cart.savings),
              ],
            ),
      bottomNavigationBar: cart.items.isEmpty ? null : _CheckoutBar(total: cart.subtotal),
    );
  }
}

class _CartLine extends StatelessWidget {
  final dynamic item;
  final bool busy;
  final VoidCallback? onInc;
  final VoidCallback onDec, onRemove;
  const _CartLine({required this.item, required this.busy, required this.onInc, required this.onDec, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(height: 64, width: 64, child: CachedImage(url: item.image, fit: BoxFit.cover)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13)),
          const SizedBox(height: 4),
          Row(children: [
            Text('₹${item.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
            if (item.mrp > item.price) ...[
              const SizedBox(width: 6),
              Text('₹${item.mrp}', style: TextStyle(color: c.muted, fontSize: 11, decoration: TextDecoration.lineThrough)),
            ],
          ]),
          const SizedBox(height: 8),
          Row(children: [
            _Stepper(qty: item.qty, onInc: busy ? null : onInc, onDec: busy ? null : onDec),
            const Spacer(),
            InkWell(onTap: busy ? null : onRemove, child: Padding(padding: const EdgeInsets.all(4), child: Icon(Icons.delete_outline, size: 20, color: c.muted))),
          ]),
        ])),
      ]),
    );
  }
}

class _Stepper extends StatelessWidget {
  final int qty;
  final VoidCallback? onInc, onDec;
  const _Stepper({required this.qty, required this.onInc, required this.onDec});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    Widget b(IconData i, VoidCallback? t) => InkWell(onTap: t, borderRadius: BorderRadius.circular(6),
        child: Padding(padding: const EdgeInsets.all(6), child: Icon(i, size: 16, color: t == null ? c.muted : c.ink)));
    return Container(
      decoration: BoxDecoration(border: Border.all(color: c.line), borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        b(Icons.remove, onDec),
        SizedBox(width: 24, child: Text('$qty', textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13))),
        b(Icons.add, onInc),
      ]),
    );
  }
}

class _Summary extends StatelessWidget {
  final int subtotal, savings;
  const _Summary({required this.subtotal, required this.savings});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    Widget row(String l, String v, {Color? vc, bool bold = false}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(l, style: TextStyle(color: c.muted, fontSize: 13, fontWeight: bold ? FontWeight.w700 : FontWeight.w500)),
            Text(v, style: TextStyle(color: vc ?? c.ink, fontSize: bold ? 16 : 13.5, fontWeight: bold ? FontWeight.w900 : FontWeight.w700)),
          ]),
        );
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Column(children: [
        row(L10n.of(context).subtotal, '₹$subtotal'),
        if (savings > 0) row(L10n.of(context).youSave, '− ₹$savings', vc: c.green),
        Divider(color: c.line, height: 18),
        row(L10n.of(context).total, '₹$subtotal', bold: true),
      ]),
    );
  }
}

class _CheckoutBar extends StatelessWidget {
  final int total;
  const _CheckoutBar({required this.total});

  Future<void> _recharge(BuildContext context) async {
    final walletP = context.read<WalletProvider>();
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WalletScreen()));
    await walletP.refresh(); // reflect the new balance immediately
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final balance = context.watch<WalletProvider>().balance;
    final short = balance < total;
    return Container(
      decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Shortfall hint when the wallet can't cover the cart.
            if (short)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  Icon(Icons.info_outline, size: 15, color: c.red),
                  const SizedBox(width: 6),
                  Expanded(child: Text(L10n.of(context).walletBalanceAddTotalBalanceTo(balance, total - balance),
                      style: TextStyle(color: c.red, fontSize: 12, fontWeight: FontWeight.w600))),
                ]),
              ),
            Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Text('₹$total', style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 20)),
                Text(L10n.of(context).walletBalance(balance), style: TextStyle(color: short ? c.red : c.muted, fontSize: 11)),
              ]),
              const SizedBox(width: 16),
              // Short → "Recharge ₹X" CTA; otherwise → Checkout.
              Expanded(child: ElevatedButton.icon(
                onPressed: short
                    ? () => _recharge(context)
                    : () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CheckoutScreen())),
                icon: Icon(short ? Icons.account_balance_wallet_outlined : Icons.shopping_bag_outlined, size: 18),
                label: Text(short ? L10n.of(context).rechargeTotalBalance(total - balance) : L10n.of(context).checkout, style: const TextStyle(fontWeight: FontWeight.w800)),
                style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(50)),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

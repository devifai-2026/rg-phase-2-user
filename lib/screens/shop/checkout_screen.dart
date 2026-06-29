import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/offers_api.dart';
import '../../api/shop_api.dart';
import '../../api/store_charges_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/cart_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../services/analytics.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../wallet/wallet_screen.dart';
import 'order_success_screen.dart';
import 'widgets/address_form_sheet.dart';

/// One line being checked out (Buy Now passes exactly one; cart mode many).
class BuyNowItem {
  final String productId;
  final String name;
  final String? image;
  final int price;
  final int mrp;
  final int qty;
  final int stock;
  const BuyNowItem({
    required this.productId,
    required this.name,
    this.image,
    required this.price,
    this.mrp = 0,
    this.qty = 1,
    this.stock = 99,
  });
}

/// API-bound checkout. Sources its lines from the [buyNow] item when present
/// (cart left untouched), otherwise from the live server cart. Addresses,
/// coupons, and store charges are all fetched; the order is placed via wallet.
class CheckoutScreen extends StatefulWidget {
  final BuyNowItem? buyNow;
  const CheckoutScreen({super.key, this.buyNow});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool get _isBuyNow => widget.buyNow != null;

  bool _loading = true;
  String? _loadError;
  bool _placing = false;

  List<Address> _addresses = const [];
  String? _selectedAddressId;
  StoreCharges _charges = StoreCharges.empty;
  List<Coupon> _coupons = const [];

  // Buy-now keeps its own qty; cart mode reads qty from CartProvider.
  int _buyNowQty = 1;

  // Applied coupon (validated server-side).
  final _couponCtrl = TextEditingController();
  CouponResult? _applied;
  bool _validatingCoupon = false;

  @override
  void initState() {
    super.initState();
    _buyNowQty = widget.buyNow?.qty ?? 1;
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _couponCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final shop = context.read<ShopApi>();
      final results = await Future.wait([
        shop.addresses(),
        context.read<StoreChargesApi>().get(),
        context.read<OffersApi>().coupons(),
        if (!_isBuyNow) context.read<CartProvider>().refresh(),
      ]);
      if (!mounted) return;
      final addresses = results[0] as List<Address>;
      setState(() {
        _addresses = addresses;
        _charges = results[1] as StoreCharges;
        _coupons = results[2] as List<Coupon>;
        _selectedAddressId = _pickDefault(addresses);
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = _msg(e);
      });
    }
  }

  String? _pickDefault(List<Address> list) {
    if (list.isEmpty) return null;
    final def = list.where((a) => a.isDefault);
    return (def.isNotEmpty ? def.first : list.first).id;
  }

  // ── Derived order lines (uniform shape for both modes) ──
  List<_Line> _lines(CartProvider cartP) {
    if (_isBuyNow) {
      final b = widget.buyNow!;
      return [
        _Line(
          productId: b.productId,
          name: b.name,
          image: b.image,
          price: b.price,
          mrp: b.mrp > b.price ? b.mrp : b.price,
          qty: _buyNowQty,
          stock: b.stock,
        ),
      ];
    }
    return cartP.cart.items
        .map((i) => _Line(
              productId: i.productId,
              name: i.name,
              image: i.image,
              price: i.price,
              mrp: i.mrp > i.price ? i.mrp : i.price,
              qty: i.qty,
              stock: i.stock,
            ))
        .toList();
  }

  int _subtotal(List<_Line> lines) => lines.fold(0, (s, l) => s + l.price * l.qty);
  int _mrpTotal(List<_Line> lines) => lines.fold(0, (s, l) => s + l.mrp * l.qty);

  List<Map<String, dynamic>> _itemsPayload(List<_Line> lines) =>
      lines.map((l) => {'productId': l.productId, 'qty': l.qty}).toList();

  // ── Qty change ──
  Future<void> _changeQty(_Line line, int next) async {
    if (next < 1 || next > line.stock) return;
    if (_isBuyNow) {
      setState(() => _buyNowQty = next);
      await _revalidateCoupon();
    } else {
      await context.read<CartProvider>().setQty(line.productId, next);
      await _revalidateCoupon();
    }
  }

  // ── Coupons ──
  Future<void> _applyCoupon(String code) async {
    final trimmed = code.trim().toUpperCase();
    if (trimmed.isEmpty || _validatingCoupon) return;
    final cartP = context.read<CartProvider>();
    final lines = _lines(cartP);
    setState(() => _validatingCoupon = true);
    try {
      final res = await context.read<OffersApi>().validate(trimmed, _itemsPayload(lines));
      if (!mounted) return;
      setState(() {
        _applied = res;
        _couponCtrl.text = trimmed;
        _validatingCoupon = false;
      });
      _toast(L10n.of(context).couponTrimmedAppliedResDiscountOff(trimmed, res.discount));
    } catch (e) {
      if (!mounted) return;
      setState(() => _validatingCoupon = false);
      _toast(_msg(e));
    }
  }

  /// Re-check the applied coupon after qty changes (discount may shift / lapse).
  Future<void> _revalidateCoupon() async {
    final applied = _applied;
    if (applied == null) return;
    final cartP = context.read<CartProvider>();
    try {
      final res = await context.read<OffersApi>().validate(applied.code, _itemsPayload(_lines(cartP)));
      if (mounted) setState(() => _applied = res);
    } catch (_) {
      if (mounted) setState(() => _applied = null); // no longer eligible
    }
  }

  void _removeCoupon() {
    setState(() {
      _applied = null;
      _couponCtrl.clear();
    });
  }

  void _openAllCoupons() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CouponSheet(
        coupons: _coupons,
        appliedCode: _applied?.code,
        onApply: (code) {
          Navigator.of(context).pop();
          _applyCoupon(code);
        },
      ),
    );
  }

  // ── Address ──
  Future<void> _addAddress() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddressFormSheet(),
    );
    if (added == true) await _load();
  }

  // ── Place order ──
  Future<void> _placeOrder(List<_Line> lines, int total) async {
    if (_placing) return;
    if (_selectedAddressId == null) {
      _toast(L10n.of(context).pleaseAddADeliveryAddress);
      return;
    }
    final walletP = context.read<WalletProvider>();
    final cartP = context.read<CartProvider>();
    final shop = context.read<ShopApi>();
    final navigator = Navigator.of(context);

    if (walletP.balance < total) {
      await navigator.push(MaterialPageRoute(builder: (_) => const WalletScreen()));
      await walletP.refresh();
      return;
    }

    setState(() => _placing = true);
    try {
      final orderId = await shop.checkoutWallet(
        addressId: _selectedAddressId,
        items: _isBuyNow ? _itemsPayload(lines) : null,
        couponCode: _applied?.code,
      );
      Analytics.instance.purchase(orderId, total); // GA conversion event
      // Refresh wallet + cart so badges/balances reflect the purchase.
      await walletP.refresh();
      if (!_isBuyNow) await cartP.refresh();
      if (!mounted) return;
      navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => OrderSuccessScreen(orderId: orderId, total: total)),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _placing = false);
      _toast(_msg(e));
    }
  }

  String _msg(Object e) => e is ApiException ? e.message : e.toString().replaceAll('Exception: ', '');
  void _toast(String m) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(m), behavior: SnackBarBehavior.floating));

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final cartP = context.watch<CartProvider>();
    final lines = _lines(cartP);
    final qtyBusy = !_isBuyNow && cartP.busy;

    final subtotal = _subtotal(lines);
    final mrpTotal = _mrpTotal(lines);
    final productDiscount = (mrpTotal - subtotal).clamp(0, mrpTotal);
    final couponDiscount = _applied?.discount ?? 0;
    final chargeLines = _charges.computeFor(subtotal);
    final chargesTotal = chargeLines.fold(0, (s, l) => s + l.amount);
    final total = (subtotal - couponDiscount + chargesTotal).clamp(1, 1 << 31);

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(L10n.of(context).checkout, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _loadError != null
                ? _ErrorState(message: _loadError!, onRetry: _load)
                : lines.isEmpty
                    ? _EmptyState(color: c)
                    : Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                              children: [
                                _label(c, Icons.location_on_outlined, L10n.of(context).deliveryAddress),
                                const SizedBox(height: 8),
                                ..._addresses.map((a) => _addressCard(c, a)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton.icon(
                                    onPressed: _addAddress,
                                    icon: const Icon(Icons.add, size: 18),
                                    label: Text(L10n.of(context).addNewAddress),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                _label(c, Icons.shopping_bag_outlined, L10n.of(context).orderSummary),
                                const SizedBox(height: 8),
                                ...lines.map((l) => _itemCard(c, l, qtyBusy)),
                                const SizedBox(height: 16),

                                _label(c, Icons.local_offer_outlined, L10n.of(context).couponsOffers),
                                const SizedBox(height: 8),
                                _couponInput(c),
                                const SizedBox(height: 10),
                                _couponList(c, subtotal),
                                const SizedBox(height: 18),

                                _label(c, Icons.receipt_long_outlined, L10n.of(context).billDetails),
                                const SizedBox(height: 8),
                                _bill(c,
                                    mrpTotal: mrpTotal,
                                    productDiscount: productDiscount,
                                    subtotal: subtotal,
                                    couponDiscount: couponDiscount,
                                    chargeLines: chargeLines,
                                    total: total,
                                    qtyCount: lines.fold(0, (s, l) => s + l.qty)),
                              ],
                            ),
                          ),
                          _payBar(c, total),
                        ],
                      ),
      ),
    );
  }

  // ── Pieces ──────────────────────────────────────────────────────────────

  Widget _label(RgColors c, IconData icon, String text) => Row(children: [
        Icon(icon, size: 17, color: c.gold),
        const SizedBox(width: 7),
        Text(text, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14.5)),
      ]);

  Widget _addressCard(RgColors c, Address a) {
    final selected = a.id == _selectedAddressId;
    return InkWell(
      onTap: () => setState(() => _selectedAddressId = a.id),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? c.redSoft : c.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selected ? c.red : c.line, width: selected ? 1.5 : 1),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: selected ? c.red : c.muted, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(
                  child: Text(a.name?.trim().isNotEmpty == true ? a.name! : L10n.of(context).address,
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.5),
                  decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.line)),
                  child: Text(a.label.toUpperCase(), style: TextStyle(color: c.muted, fontSize: 9.5, fontWeight: FontWeight.w600)),
                ),
              ]),
              const SizedBox(height: 4),
              Text(a.oneLine, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.35)),
              if (a.phone?.trim().isNotEmpty == true) Text(a.phone!, style: TextStyle(color: c.muted, fontSize: 12)),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _itemCard(RgColors c, _Line l, bool qtyBusy) {
    final canInc = l.qty < l.stock;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(height: 58, width: 58, child: CachedImage(url: l.image, fit: BoxFit.cover)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(l.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13)),
            const SizedBox(height: 4),
            Row(children: [
              Text('₹${l.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
              if (l.mrp > l.price) ...[
                const SizedBox(width: 6),
                Text('₹${l.mrp}', style: TextStyle(color: c.muted, fontSize: 11, decoration: TextDecoration.lineThrough)),
              ],
            ]),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(border: Border.all(color: c.line), borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                InkWell(
                  onTap: (qtyBusy || l.qty <= 1) ? null : () => _changeQty(l, l.qty - 1),
                  child: Padding(padding: const EdgeInsets.all(6), child: Icon(Icons.remove, size: 15, color: l.qty <= 1 ? c.muted : c.ink)),
                ),
                SizedBox(width: 26, child: Text('${l.qty}', textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13))),
                InkWell(
                  onTap: (!canInc || qtyBusy) ? null : () => _changeQty(l, l.qty + 1),
                  child: Padding(padding: const EdgeInsets.all(6), child: Icon(Icons.add, size: 15, color: canInc ? c.red : c.muted)),
                ),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _couponInput(RgColors c) {
    if (_applied != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: c.green.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.green.withValues(alpha: 0.6)),
        ),
        child: Row(children: [
          Icon(Icons.verified_outlined, size: 18, color: c.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(L10n.of(context).appliedCodeAppliedAppliedDiscountOff(_applied!.code, _applied!.discount),
                style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13)),
          ),
          TextButton(onPressed: _removeCoupon, child: Text(L10n.of(context).remove, style: TextStyle(color: c.red))),
        ]),
      );
    }
    return SizedBox(
      height: 46,
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: TextField(
            controller: _couponCtrl,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(hintText: L10n.of(context).enterCouponCode, isDense: true),
            onSubmitted: _applyCoupon,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _validatingCoupon ? null : () => _applyCoupon(_couponCtrl.text),
          style: ElevatedButton.styleFrom(minimumSize: const Size(88, 46)),
          child: _validatingCoupon
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : Text(L10n.of(context).apply),
        ),
      ]),
    );
  }

  /// Up to 2 coupon pills inline; a "View all" pill opens the full sheet.
  Widget _couponList(RgColors c, int subtotal) {
    if (_coupons.isEmpty) return const SizedBox.shrink();
    final shown = _coupons.take(2).toList();
    final hasMore = _coupons.length > 2;
    return Wrap(spacing: 8, runSpacing: 8, children: [
      ...shown.map((cp) => _couponPill(c, cp)),
      if (hasMore)
        InkWell(
          onTap: _openAllCoupons,
          borderRadius: BorderRadius.circular(9),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: c.line),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(L10n.of(context).viewAllCouponsLength(_coupons.length), style: TextStyle(color: c.red, fontWeight: FontWeight.w800, fontSize: 12)),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 16, color: c.red),
            ]),
          ),
        ),
    ]);
  }

  Widget _couponPill(RgColors c, Coupon cp) => InkWell(
        onTap: () => _applyCoupon(cp.code),
        borderRadius: BorderRadius.circular(9),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.10), borderRadius: BorderRadius.circular(9), border: Border.all(color: c.gold.withValues(alpha: 0.6))),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.confirmation_num_outlined, size: 14, color: c.gold),
            const SizedBox(width: 6),
            Text(cp.code, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 12)),
            const SizedBox(width: 5),
            Text(cp.headline, style: TextStyle(color: c.gold, fontWeight: FontWeight.w700, fontSize: 11)),
          ]),
        ),
      );

  Widget _bill(RgColors c,
      {required int mrpTotal,
      required int productDiscount,
      required int subtotal,
      required int couponDiscount,
      required List<ChargeLine> chargeLines,
      required int total,
      required int qtyCount}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Column(children: [
        _billRow(c, L10n.of(context).itemTotalMrpQtycount(qtyCount), '₹$mrpTotal'),
        if (productDiscount > 0) _billRow(c, L10n.of(context).productDiscount, '− ₹$productDiscount', valueColor: c.green),
        _billRow(c, L10n.of(context).itemsSubtotal, '₹$subtotal'),
        if (couponDiscount > 0) _billRow(c, L10n.of(context).couponAppliedCode(_applied!.code), '− ₹$couponDiscount', valueColor: c.green),
        if (chargeLines.isEmpty)
          _billRow(c, L10n.of(context).delivery, L10n.of(context).free2, valueColor: c.green)
        else
          ...chargeLines.map((l) => _billRow(c, l.label, '₹${l.amount}')),
        Divider(color: c.line, height: 18),
        _billRow(c, L10n.of(context).toPay, '₹$total', bold: true),
      ]),
    );
  }

  Widget _billRow(RgColors c, String label, String value, {Color? valueColor, bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: TextStyle(color: bold ? c.ink : c.muted, fontSize: bold ? 15 : 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w500)),
          Text(value, style: TextStyle(color: valueColor ?? c.ink, fontSize: bold ? 17 : 13.5, fontWeight: bold ? FontWeight.w900 : FontWeight.w700)),
        ]),
      );

  Widget _payBar(RgColors c, int total) {
    final balance = context.watch<WalletProvider>().balance;
    final short = balance < total;
    return Container(
      decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (short)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(children: [
              Icon(Icons.info_outline, size: 15, color: c.red),
              const SizedBox(width: 6),
              Expanded(
                child: Text(L10n.of(context).walletBalanceAddTotalBalanceTo(balance, total - balance),
                    style: TextStyle(color: c.red, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ]),
          ),
        ElevatedButton(
          onPressed: _placing ? null : () => _placeOrder(_lines(context.read<CartProvider>()), total),
          style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(52)),
          child: _placing
              ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
              : Text(short ? L10n.of(context).rechargeTotalBalance(total - balance) : L10n.of(context).placeOrderTotal(total),
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        ),
      ]),
    );
  }
}

/// Uniform internal order line (bridges BuyNowItem and CartItem).
class _Line {
  final String productId;
  final String name;
  final String? image;
  final int price;
  final int mrp;
  final int qty;
  final int stock;
  const _Line({
    required this.productId,
    required this.name,
    this.image,
    required this.price,
    required this.mrp,
    required this.qty,
    required this.stock,
  });
}

class _CouponSheet extends StatelessWidget {
  final List<Coupon> coupons;
  final String? appliedCode;
  final void Function(String code) onApply;
  const _CouponSheet({required this.coupons, required this.appliedCode, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.35,
      maxChildSize: 0.92,
      expand: false,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(children: [
          const SizedBox(height: 10),
          Container(height: 4, width: 44, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(4))),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
            child: Row(children: [
              Icon(Icons.local_offer_outlined, color: c.gold, size: 20),
              const SizedBox(width: 8),
              Text(L10n.of(context).availableOffers, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 17)),
            ]),
          ),
          Expanded(
            child: ListView.separated(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              itemCount: coupons.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) {
                final cp = coupons[i];
                final isApplied = cp.code == appliedCode;
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: c.card,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: isApplied ? c.green : c.line, width: isApplied ? 1.5 : 1),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(6), border: Border.all(color: c.gold.withValues(alpha: 0.5))),
                            child: Text(cp.code, style: TextStyle(color: c.gold, fontWeight: FontWeight.w800, fontSize: 12.5)),
                          ),
                          const SizedBox(width: 8),
                          Text(cp.headline, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13)),
                        ]),
                        if (cp.description?.trim().isNotEmpty == true) ...[
                          const SizedBox(height: 6),
                          Text(cp.description!, style: TextStyle(color: c.muted, fontSize: 12, height: 1.3)),
                        ],
                        if (cp.minOrderValue > 0) ...[
                          const SizedBox(height: 4),
                          Text(L10n.of(context).minOrderCpMinordervalue(cp.minOrderValue), style: TextStyle(color: c.muted, fontSize: 11)),
                        ],
                      ]),
                    ),
                    const SizedBox(width: 10),
                    isApplied
                        ? Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(Icons.check_circle, color: c.green, size: 18),
                            const SizedBox(width: 4),
                            Text(L10n.of(context).applied, style: TextStyle(color: c.green, fontWeight: FontWeight.w700, fontSize: 12)),
                          ])
                        : TextButton(onPressed: () => onApply(cp.code), child: Text(L10n.of(context).apply, style: TextStyle(color: c.red, fontWeight: FontWeight.w800))),
                  ]),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final RgColors color;
  const _EmptyState({required this.color});
  @override
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.shopping_bag_outlined, color: color.muted, size: 54),
          const SizedBox(height: 14),
          Text(L10n.of(context).nothingToCheckout, style: TextStyle(color: color.ink, fontWeight: FontWeight.w700, fontSize: 16)),
        ]),
      );
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.error_outline, color: c.red, size: 48),
          const SizedBox(height: 14),
          Text(message, textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 14)),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(minimumSize: const Size(140, 46)),
            child: Text(L10n.of(context).retry),
          ),
        ]),
      ),
    );
  }
}

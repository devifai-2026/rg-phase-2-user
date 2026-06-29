import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/product_api.dart';
import '../../api/offers_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/cart_provider.dart';
import '../../services/analytics.dart';
import '../../services/deep_link.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'widgets/image_carousel.dart';
import 'widgets/cart_icon_button.dart';
import 'widgets/offer_widgets.dart';
import 'bundles_screen.dart';
import 'checkout_screen.dart';

/// Rich product detail — big swipeable image carousel, title, rating, price
/// block with discount, stock, description, quantity stepper, and a sticky
/// Add-to-Cart / Buy-Now bar.
class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final Product? preview; // show instantly from the list while full loads
  const ProductDetailScreen({super.key, required this.productId, this.preview});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? _product;
  bool _loading = true;
  int _qty = 1;
  List<Bundle> _bundles = []; // offers/combos for this product

  @override
  void initState() {
    super.initState();
    _product = widget.preview;
    _loading = widget.preview == null;
    _load();
    _loadBundles();
  }

  Future<void> _loadBundles() async {
    try {
      final list = await context.read<OffersApi>().bundlesForProduct(widget.productId);
      if (mounted) setState(() => _bundles = list);
    } catch (_) {/* offers optional */}
  }

  Future<void> _load() async {
    try {
      final p = await context.read<ProductApi>().get(widget.productId);
      if (mounted) setState(() { _product = p; _loading = false; });
      Analytics.instance.viewProduct(p.id, p.name, p.price); // GA view_item
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _share(Product p) {
    final url = DeepLink.productShareUrl(p.id);
    final priceLine = p.mrp > p.price ? L10n.of(context).pPriceWasPMrp(p.price, p.mrp) : '₹${p.price}';
    Share.share(L10n.of(context).pNamePricelineUrl(p.name, priceLine, url), subject: p.name);
  }

  Future<void> _addToCart() async {
    final p = _product;
    if (p == null) return;
    final cart = context.read<CartProvider>();
    final messenger = ScaffoldMessenger.of(context);
    try {
      await cart.add(p.id, qty: _qty);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).addedToCart), behavior: SnackBarBehavior.floating));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString().replaceAll('Exception: ', '')), behavior: SnackBarBehavior.floating));
    }
  }

  /// Buy Now → checkout ONLY this product (with the chosen qty); cart untouched.
  void _buyNow() {
    final p = _product;
    if (p == null) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CheckoutScreen(
      buyNow: BuyNowItem(productId: p.id, name: p.name, image: p.firstImage, price: p.price, mrp: p.mrp, qty: _qty, stock: p.stock),
    )));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final p = _product;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: c.ground, elevation: 0, actions: [
        if (p != null)
          IconButton(
            icon: Icon(Icons.share_outlined, color: c.ink, size: 22),
            onPressed: () => _share(p),
          ),
        const CartIconButton(),
        const SizedBox(width: 4),
      ]),
      body: (p == null)
          ? Center(child: _loading ? CircularProgressIndicator(color: c.red) : Text(L10n.of(context).productUnavailable, style: TextStyle(color: c.muted)))
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                // Big carousel.
                AspectRatio(
                  aspectRatio: 1,
                  child: Stack(fit: StackFit.expand, children: [
                    ImageCarousel(images: p.images, dotSize: 7),
                    if (p.discountPercent > 0)
                      Positioned(left: 14, top: 14, child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                        decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(10)),
                        child: Text(L10n.of(context).pDiscountpercentOff(p.discountPercent), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
                      )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (p.categoryName != null)
                        Text(p.categoryName!.toUpperCase(), style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.6)),
                      const SizedBox(height: 6),
                      Text(p.name, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 21, height: 1.25)),
                      const SizedBox(height: 10),
                      if (p.rating > 0)
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(8)),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(Icons.star_rounded, size: 14, color: c.gold),
                              const SizedBox(width: 3),
                              Text(p.rating.toStringAsFixed(1), style: TextStyle(color: c.gold, fontSize: 12, fontWeight: FontWeight.w800)),
                            ]),
                          ),
                          const SizedBox(width: 8),
                          Text(L10n.of(context).pReviewcountReviews(p.reviewCount), style: TextStyle(color: c.muted, fontSize: 12)),
                        ]),
                      const SizedBox(height: 14),
                      // Price block.
                      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('₹${p.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 26)),
                        if (p.mrp > p.price) ...[
                          const SizedBox(width: 10),
                          Text('₹${p.mrp}', style: TextStyle(color: c.muted, fontSize: 15, decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: 8),
                          Text(L10n.of(context).pDiscountpercentOff2(p.discountPercent), style: TextStyle(color: c.green, fontSize: 13, fontWeight: FontWeight.w700)),
                        ],
                      ]),
                      // Low-stock urgency badge only (no plain "in stock" label).
                      if (p.inStock && p.stock < 5) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: const Color(0xFFE8590C).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(8)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            const Icon(Icons.bolt, size: 14, color: Color(0xFFE8590C)),
                            const SizedBox(width: 4),
                            Text(L10n.of(context).fewItemsLeft, style: const TextStyle(color: Color(0xFFE8590C), fontSize: 12, fontWeight: FontWeight.w800)),
                          ]),
                        ),
                      ],
                      if ((p.description ?? '').trim().isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Text(L10n.of(context).description, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                        const SizedBox(height: 6),
                        Text(p.description!, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.5)),
                      ],
                      // ── Offers & bundles for this product ──
                      if (_bundles.isNotEmpty) ...[
                        const SizedBox(height: 22),
                        Row(children: [
                          Icon(Icons.widgets_outlined, size: 17, color: c.gold),
                          const SizedBox(width: 7),
                          Text(L10n.of(context).frequentlyBoughtTogether, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                          const Spacer(),
                          if (_bundles.length > 1)
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(slideRoute(const BundlesScreen())),
                              child: Row(children: [
                                Text(L10n.of(context).viewAll, style: TextStyle(color: c.red, fontSize: 12, fontWeight: FontWeight.w700)),
                                Icon(Icons.chevron_right, size: 17, color: c.red),
                              ]),
                            ),
                        ]),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 158,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _bundles.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (_, i) => BundleCard(bundle: _bundles[i], onTap: () => Navigator.of(context).push(slideRoute(const BundlesScreen()))),
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      // Quantity stepper.
                      if (p.inStock)
                        Row(children: [
                          Text(L10n.of(context).quantity, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
                          const Spacer(),
                          _QtyStepper(
                            qty: _qty, max: p.stock,
                            onChanged: (v) => setState(() => _qty = v),
                          ),
                        ]),
                      const SizedBox(height: 90), // room for sticky bar
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: (p == null || !p.inStock)
          ? null
          : _StickyBar(
              busy: context.watch<CartProvider>().busy,
              onAddToCart: _addToCart,
              onBuyNow: _buyNow,
            ),
    );
  }
}

class _QtyStepper extends StatelessWidget {
  final int qty, max;
  final ValueChanged<int> onChanged;
  const _QtyStepper({required this.qty, required this.max, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    Widget btn(IconData icon, VoidCallback? onTap) => InkWell(
          onTap: onTap, borderRadius: BorderRadius.circular(8),
          child: Padding(padding: const EdgeInsets.all(8), child: Icon(icon, size: 18, color: onTap == null ? c.muted : c.ink)),
        );
    return Container(
      decoration: BoxDecoration(border: Border.all(color: c.line), borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        btn(Icons.remove, qty > 1 ? () => onChanged(qty - 1) : null),
        SizedBox(width: 28, child: Text('$qty', textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15))),
        btn(Icons.add, qty < max ? () => onChanged(qty + 1) : null),
      ]),
    );
  }
}

class _StickyBar extends StatelessWidget {
  final bool busy;
  final VoidCallback onAddToCart, onBuyNow;
  const _StickyBar({required this.busy, required this.onAddToCart, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
      child: SafeArea(
        top: false,
        child: Row(children: [
          Expanded(child: OutlinedButton.icon(
            onPressed: busy ? null : onAddToCart,
            icon: const Icon(Icons.add_shopping_cart, size: 18),
            label: Text(L10n.of(context).addToCart),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          )),
          const SizedBox(width: 12),
          Expanded(child: ElevatedButton(
            onPressed: busy ? null : onBuyNow,
            style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(50)),
            child: busy
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                : Text(L10n.of(context).buyNow),
          )),
        ]),
      ),
    );
  }
}

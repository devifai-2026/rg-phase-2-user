import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../api/product_api.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/cart_provider.dart';
import '../../../theme/rg_colors.dart';
import '../checkout_screen.dart';
import 'image_carousel.dart';

/// Grid product card — auto-advancing image carousel, name, price + struck MRP,
/// discount badge, out-of-stock veil, and Add-to-Cart + Buy action buttons.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  /// Add this product to the shared cart (with a confirmation toast).
  Future<void> _addToCart(BuildContext context) async {
    final cart = context.read<CartProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final addedToCart = L10n.of(context).addedToCart;
    try {
      await cart.add(product.id, qty: 1);
      messenger.showSnackBar(SnackBar(content: Text(addedToCart), behavior: SnackBarBehavior.floating));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString().replaceAll('Exception: ', '')), behavior: SnackBarBehavior.floating));
    }
  }

  /// Buy Now → checkout ONLY this product (cart untouched, not shown).
  void _buyNow(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CheckoutScreen(
      buyNow: BuyNowItem(productId: product.id, name: product.name, image: product.firstImage, price: product.price, mrp: product.mrp, qty: 1, stock: product.stock),
    )));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final p = product;
    return Material(
      color: c.card,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image carousel (fixed height) with discount + low-stock badges.
            SizedBox(
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageCarousel(images: p.images, autoPlay: true),
                  if (p.discountPercent > 0)
                    Positioned(
                      left: 8, top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(8)),
                        child: Text(L10n.of(context).pDiscountpercentOff(p.discountPercent), style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  // Urgency badge (Blinkit-style) when running low.
                  if (p.inStock && p.stock < 5)
                    Positioned(
                      left: 8, bottom: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8590C), // amber-red urgency
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 4)],
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.bolt, size: 11, color: Colors.white),
                          const SizedBox(width: 2),
                          Text(L10n.of(context).fewLeft, style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w800)),
                        ]),
                      ),
                    ),
                ],
              ),
            ),
            // Details.
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 12.5, height: 1.2)),
                  const SizedBox(height: 5),
                  // Social proof: rating chip + "N sold".
                  if (p.rating > 0 || p.soldLabel != null)
                    Row(children: [
                      if (p.rating > 0) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                          decoration: BoxDecoration(color: c.green.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(6)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(p.rating.toStringAsFixed(1), style: TextStyle(color: c.green, fontSize: 10.5, fontWeight: FontWeight.w800)),
                            const SizedBox(width: 1),
                            Icon(Icons.star_rounded, size: 11, color: c.green),
                          ]),
                        ),
                        if (p.reviewCount > 0) ...[
                          const SizedBox(width: 4),
                          Text('(${p.reviewCount})', style: TextStyle(color: c.muted, fontSize: 9.5)),
                        ],
                      ],
                      if (p.soldLabel != null) ...[
                        if (p.rating > 0) Text('  ·  ', style: TextStyle(color: c.muted, fontSize: 9.5)),
                        Flexible(child: Text(p.soldLabel!, maxLines: 1, overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: c.muted, fontSize: 10.5, fontWeight: FontWeight.w600))),
                      ],
                    ]),
                  const SizedBox(height: 6),
                  // Price + struck MRP + concrete savings.
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text('₹${p.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 15)),
                    if (p.mrp > p.price) ...[
                      const SizedBox(width: 6),
                      Text('₹${p.mrp}', style: TextStyle(color: c.muted, fontSize: 11.5, decoration: TextDecoration.lineThrough)),
                    ],
                  ]),
                  if (p.saveAmount > 0) ...[
                    const SizedBox(height: 2),
                    Text(L10n.of(context).savePSaveamount(p.saveAmount), style: TextStyle(color: c.green, fontSize: 10.5, fontWeight: FontWeight.w700)),
                  ],
                  const SizedBox(height: 6),
                  // Trust line.
                  Row(children: [
                    Icon(Icons.local_shipping_outlined, size: 12, color: c.muted),
                    const SizedBox(width: 3),
                    Text(L10n.of(context).freeDelivery, style: TextStyle(color: c.muted, fontSize: 9.5, fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 9),
                  // Add to Cart + Buy actions (disabled when out of stock).
                  Row(children: [
                    Expanded(child: _CardBtn(
                      icon: Icons.add_shopping_cart, label: 'Cart',
                      filled: false, color: c.red,
                      onTap: p.inStock ? () => _addToCart(context) : null,
                    )),
                    const SizedBox(width: 6),
                    Expanded(child: _CardBtn(
                      label: L10n.of(context).buy, filled: true, color: c.red,
                      onTap: p.inStock ? () => _buyNow(context) : null,
                    )),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact card action button (outlined "Cart" / filled "Buy").
class _CardBtn extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool filled;
  final Color color;
  final VoidCallback? onTap;
  const _CardBtn({this.icon, required this.label, required this.filled, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final disabled = onTap == null;
    final bg = filled ? color : Colors.transparent;
    final fg = disabled ? c.muted : (filled ? Colors.white : color);
    return Material(
      color: disabled ? c.ground2 : bg,
      borderRadius: BorderRadius.circular(9),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: disabled ? c.line : color, width: 1),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
            if (icon != null) ...[Icon(icon, size: 13, color: fg), const SizedBox(width: 4)],
            Text(label, style: TextStyle(color: fg, fontSize: 11.5, fontWeight: FontWeight.w800)),
          ]),
        ),
      ),
    );
  }
}

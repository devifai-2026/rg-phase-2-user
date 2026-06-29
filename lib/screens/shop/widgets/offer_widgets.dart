import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../api/offers_api.dart';
import '../../../theme/rg_colors.dart';
import '../../../widgets/cached_image.dart';

/// Coupon chip for the quick-commerce offers strip.
class OfferCouponChip extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback? onTap;
  const OfferCouponChip({super.key, required this.coupon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 168,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(colors: [c.red, c.redDeep], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [BoxShadow(color: c.red.withValues(alpha: 0.28), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Row(children: [
          // Ticket icon disc.
          Container(
            height: 34, width: 34,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
            child: const Icon(Icons.local_offer, color: Colors.white, size: 17),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(coupon.headline, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
            const SizedBox(height: 1),
            Text(L10n.of(context).codeCouponCode(coupon.code), maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 10.5, fontWeight: FontWeight.w600)),
          ])),
        ]),
      ),
    );
  }
}

/// Bundle/combo card — stacked product thumbnails, "you save" pill, price.
class BundleCard extends StatelessWidget {
  final Bundle bundle;
  final VoidCallback? onTap;
  final double width;
  const BundleCard({super.key, required this.bundle, this.onTap, this.width = 230});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final imgs = bundle.products.where((p) => p.image != null).map((p) => p.image!).take(3).toList();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnails row + save ribbon.
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  for (var i = 0; i < imgs.length; i++) ...[
                    ClipRRect(borderRadius: BorderRadius.circular(10), child: SizedBox(height: 56, width: 56, child: CachedImage(url: imgs[i], fit: BoxFit.cover))),
                    if (i < imgs.length - 1)
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.add, size: 14, color: c.muted)),
                  ],
                ]),
              ),
              if (bundle.youSave > 0)
                Positioned(right: 8, top: 8, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(color: c.green, borderRadius: BorderRadius.circular(8)),
                  child: Text(L10n.of(context).saveBundleYousave(bundle.youSave), style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
                )),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(bundle.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13.5)),
                const SizedBox(height: 2),
                Text(L10n.of(context).bundleProductsLengthItemsCombo(bundle.products.length), style: TextStyle(color: c.muted, fontSize: 11)),
                const SizedBox(height: 8),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('₹${bundle.bundlePrice}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(width: 6),
                  Text('₹${bundle.originalTotal}', style: TextStyle(color: c.muted, fontSize: 11.5, decoration: TextDecoration.lineThrough)),
                  const Spacer(),
                  if (bundle.discountPercent > 0)
                    Text(L10n.of(context).bundleDiscountpercentOff(bundle.discountPercent), style: TextStyle(color: c.green, fontSize: 11.5, fontWeight: FontWeight.w800)),
                ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

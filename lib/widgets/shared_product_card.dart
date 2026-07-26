import 'package:flutter/material.dart';

import '../api/session_api.dart';
import '../l10n/app_localizations.dart';
import '../screens/shop/product_detail_screen.dart';
import '../theme/rg_colors.dart';
import 'cached_image.dart';

/// The card shown for a product an astrologer shared inside a chat.
///
/// Extracted so the LIVE chat room and the read-only chat HISTORY render it from
/// one implementation. They previously had independent `_Bubble` classes; only
/// the live one grew a product branch, so a shared product showed up as an empty
/// bubble in history (the message carries no text and no mediaUrl). Keeping one
/// widget makes that class of drift impossible.
class SharedProductCard extends StatelessWidget {
  final SharedProduct product;

  /// Right-aligned when the viewer sent it, left-aligned otherwise.
  final bool mine;

  const SharedProductCard({super.key, required this.product, required this.mine});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final p = product;
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProductDetailScreen(productId: p.productId),
        )),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.66),
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: c.gold.withValues(alpha: 0.5)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            if (p.image != null && p.image!.isNotEmpty)
              CachedImage(url: p.image, fit: BoxFit.cover, width: double.infinity, height: 130),
            Padding(
              padding: const EdgeInsets.all(11),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Row(children: [
                  Icon(Icons.storefront, size: 13, color: c.gold),
                  const SizedBox(width: 5),
                  Text(L10n.of(context).recommendedProduct,
                      style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w700)),
                ]),
                const SizedBox(height: 6),
                Text(p.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 6),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('₹${p.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                  Row(children: [
                    Text(L10n.of(context).view,
                        style: TextStyle(color: c.gold, fontWeight: FontWeight.w700, fontSize: 12.5)),
                    Icon(Icons.chevron_right, size: 16, color: c.gold),
                  ]),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

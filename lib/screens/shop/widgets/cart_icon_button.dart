import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';
import '../../../theme/rg_colors.dart';
import '../../../widgets/slide_route.dart';
import '../cart_screen.dart';

/// App-bar cart icon with a live item-count badge → opens the Cart screen.
class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final count = context.watch<CartProvider>().count;
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined, color: c.ink, size: 23),
          onPressed: () => Navigator.of(context).push(slideRoute(const CartScreen())),
        ),
        if (count > 0)
          Positioned(
            right: 4, top: 4,
            child: Container(
              height: 17,
              // Circle for 1 digit; a tidy pill (still pin-height) for 2+.
              constraints: const BoxConstraints(minWidth: 17),
              padding: EdgeInsets.symmetric(horizontal: count > 9 ? 4 : 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: c.red,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: c.ground, width: 1.5),
              ),
              child: Text(count > 99 ? '99+' : '$count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w800, height: 1)),
            ),
          ),
      ],
    );
  }
}

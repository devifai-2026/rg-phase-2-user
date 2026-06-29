import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/offers_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/cart_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'cart_screen.dart';
import 'widgets/offer_widgets.dart';

/// Full Bundles & combos listing (quick-commerce vibe).
class BundlesScreen extends StatefulWidget {
  const BundlesScreen({super.key});

  @override
  State<BundlesScreen> createState() => _BundlesScreenState();
}

class _BundlesScreenState extends State<BundlesScreen> {
  List<Bundle>? _bundles;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final list = await context.read<OffersApi>().bundles();
      if (mounted) setState(() => _bundles = list);
    } catch (_) {
      if (mounted) setState(() => _bundles = const []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final b = _bundles;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: c.ground, elevation: 0,
        title: Text(L10n.of(context).bundlesCombos, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19))),
      body: b == null
          ? Center(child: CircularProgressIndicator(color: c.red))
          : b.isEmpty
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.widgets_outlined, color: c.muted, size: 48),
                  const SizedBox(height: 12),
                  Text(L10n.of(context).noCombosRightNow, style: TextStyle(color: c.muted)),
                ]))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: b.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (_, i) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    BundleCard(bundle: b[i], width: double.infinity),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () => _addBundle(b[i]),
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: Text(L10n.of(context).addComboBIBundleprice(b[i].bundlePrice)),
                      style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(46)),
                    ),
                  ]),
                ),
    );
  }

  /// Add every product in the bundle to the cart, then open the cart.
  Future<void> _addBundle(Bundle bundle) async {
    final cart = context.read<CartProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    try {
      for (final p in bundle.products) {
        await cart.add(p.id, qty: 1);
      }
      if (!mounted) return;
      navigator.push(slideRoute(const CartScreen()));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString().replaceAll('Exception: ', '')), behavior: SnackBarBehavior.floating));
    }
  }
}

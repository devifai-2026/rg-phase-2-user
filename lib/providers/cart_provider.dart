import 'package:flutter/foundation.dart';
import '../api/cart_api.dart';

/// App-wide cart state. The server is the source of truth — every mutation
/// returns the full hydrated cart, which we store and broadcast so the badge,
/// cart screen, and product buttons stay in sync.
class CartProvider extends ChangeNotifier {
  final CartApi _api;
  CartProvider(this._api);

  CartView _cart = const CartView();
  bool _busy = false;

  CartView get cart => _cart;
  int get count => _cart.count;
  bool get busy => _busy;

  /// Quantity of a product currently in the cart (0 if none).
  int qtyOf(String productId) {
    for (final i in _cart.items) {
      if (i.productId == productId) return i.qty;
    }
    return 0;
  }

  void _set(CartView v) { _cart = v; notifyListeners(); }

  Future<void> refresh() async {
    try { _set(await _api.get()); } catch (_) {/* keep last known */}
  }

  Future<void> reset() async { _set(const CartView()); }

  Future<void> add(String productId, {int qty = 1}) async {
    _busy = true; notifyListeners();
    try { _set(await _api.add(productId, qty: qty)); }
    finally { _busy = false; notifyListeners(); }
  }

  Future<void> setQty(String productId, int qty) async {
    _busy = true; notifyListeners();
    try { _set(await _api.setQty(productId, qty)); }
    finally { _busy = false; notifyListeners(); }
  }

  Future<void> remove(String productId) async {
    _busy = true; notifyListeners();
    try { _set(await _api.remove(productId)); }
    finally { _busy = false; notifyListeners(); }
  }

  Future<void> clear() async {
    try { _set(await _api.clear()); } catch (_) {}
  }
}

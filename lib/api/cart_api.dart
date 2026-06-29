import 'api_client.dart';

/// One hydrated cart line (server resolves price/stock from the live product).
class CartItem {
  final String productId;
  final String name;
  final String? image;
  final int price;
  final int mrp;
  final int stock;
  final int qty;
  final int lineTotal;

  const CartItem({
    required this.productId, required this.name, this.image,
    required this.price, this.mrp = 0, this.stock = 0, required this.qty, required this.lineTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> j) => CartItem(
        productId: (j['product'] ?? '').toString(),
        name: (j['name'] ?? '').toString(),
        image: (j['image'] as String?)?.trim().isEmpty ?? true ? null : j['image'].toString(),
        price: (j['price'] as num?)?.toInt() ?? 0,
        mrp: (j['mrp'] as num?)?.toInt() ?? 0,
        stock: (j['stock'] as num?)?.toInt() ?? 0,
        qty: (j['qty'] as num?)?.toInt() ?? 1,
        lineTotal: (j['lineTotal'] as num?)?.toInt() ?? 0,
      );
}

/// A hydrated cart snapshot returned by every /cart call.
class CartView {
  final List<CartItem> items;
  final int subtotal;
  final int mrpTotal;
  final int count; // total quantity across lines

  const CartView({this.items = const [], this.subtotal = 0, this.mrpTotal = 0, this.count = 0});

  int get savings => (mrpTotal - subtotal).clamp(0, mrpTotal);

  factory CartView.fromJson(Map<String, dynamic> j) => CartView(
        items: (j['items'] as List?)?.map((e) => CartItem.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
        subtotal: (j['subtotal'] as num?)?.toInt() ?? 0,
        mrpTotal: (j['mrpTotal'] as num?)?.toInt() ?? 0,
        count: (j['count'] as num?)?.toInt() ?? 0,
      );
}

class CartApi {
  final ApiClient _api;
  CartApi(this._api);

  Future<CartView> get() async => CartView.fromJson(await _api.get('/cart') as Map<String, dynamic>);

  Future<CartView> add(String productId, {int qty = 1}) async =>
      CartView.fromJson(await _api.post('/cart/items', body: {'productId': productId, 'qty': qty}) as Map<String, dynamic>);

  Future<CartView> setQty(String productId, int qty) async =>
      CartView.fromJson(await _api.patch('/cart/items/$productId', body: {'qty': qty}) as Map<String, dynamic>);

  Future<CartView> remove(String productId) async =>
      CartView.fromJson(await _api.delete('/cart/items/$productId') as Map<String, dynamic>);

  Future<CartView> clear() async => CartView.fromJson(await _api.delete('/cart') as Map<String, dynamic>);
}

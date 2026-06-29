import 'api_client.dart';

/// A priced product bundle/combo.
class Bundle {
  final String id;
  final String name;
  final int originalTotal;
  final int bundlePrice;
  final int youSave;
  final List<BundleProduct> products;

  const Bundle({
    required this.id, required this.name, required this.originalTotal,
    required this.bundlePrice, required this.youSave, this.products = const [],
  });

  int get discountPercent => originalTotal > 0 ? ((youSave / originalTotal) * 100).round() : 0;

  factory Bundle.fromJson(Map<String, dynamic> j) => Bundle(
        id: (j['id'] ?? j['_id']).toString(),
        name: (j['name'] ?? 'Combo').toString(),
        originalTotal: (j['originalTotal'] as num?)?.toInt() ?? 0,
        bundlePrice: (j['bundlePrice'] as num?)?.toInt() ?? 0,
        youSave: (j['youSave'] as num?)?.toInt() ?? 0,
        products: (j['products'] as List?)?.map((e) => BundleProduct.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      );
}

class BundleProduct {
  final String id;
  final String name;
  final int price;
  final String? image;
  const BundleProduct({required this.id, required this.name, required this.price, this.image});

  factory BundleProduct.fromJson(Map<String, dynamic> j) => BundleProduct(
        id: (j['id'] ?? '').toString(),
        name: (j['name'] ?? '').toString(),
        price: (j['price'] as num?)?.toInt() ?? 0,
        image: (j['image'] as String?)?.trim().isEmpty ?? true ? null : j['image'].toString(),
      );
}

/// A public coupon (offer strip).
class Coupon {
  final String code;
  final String? description;
  final String type; // percentage | flat
  final num value;
  final int maxDiscount;
  final int minOrderValue;
  const Coupon({required this.code, this.description, required this.type, required this.value, this.maxDiscount = 0, this.minOrderValue = 0});

  /// Short headline, e.g. "20% OFF" / "₹100 OFF".
  String get headline => type == 'percentage' ? '${value.toInt()}% OFF' : '₹${value.toInt()} OFF';

  factory Coupon.fromJson(Map<String, dynamic> j) => Coupon(
        code: (j['code'] ?? '').toString(),
        description: j['description']?.toString(),
        type: (j['type'] ?? 'flat').toString(),
        value: (j['value'] as num?) ?? 0,
        maxDiscount: (j['maxDiscount'] as num?)?.toInt() ?? 0,
        minOrderValue: (j['minOrderValue'] as num?)?.toInt() ?? 0,
      );
}

/// Result of validating a coupon against cart items.
class CouponResult {
  final String code;
  final int discount;
  const CouponResult({required this.code, required this.discount});
}

class OffersApi {
  final ApiClient _api;
  OffersApi(this._api);

  Future<List<Bundle>> bundles({int limit = 50}) async {
    final data = await _api.get('/offers/bundles', query: {'limit': limit});
    final raw = (data is List) ? data : const [];
    return raw.map((e) => Bundle.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Bundle>> bundlesForProduct(String productId) async {
    final data = await _api.get('/offers/products/$productId/bundles');
    final raw = (data is List) ? data : const [];
    return raw.map((e) => Bundle.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Coupon>> coupons() async {
    final data = await _api.get('/offers/coupons');
    final raw = (data is List) ? data : const [];
    return raw.map((e) => Coupon.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Validate a coupon against the given cart items. Throws ApiException if invalid.
  Future<CouponResult> validate(String code, List<Map<String, dynamic>> items) async {
    final data = await _api.post('/offers/coupons/validate', body: {'code': code, 'items': items});
    final m = data as Map<String, dynamic>;
    return CouponResult(code: (m['code'] ?? code).toString(), discount: (m['discount'] as num?)?.toInt() ?? 0);
  }
}

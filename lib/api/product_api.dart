import 'api_client.dart';

/// A store product (GET /products). Carries multiple images for the carousel.
class Product {
  final String id;
  final String name;
  final String? categoryId;
  final String? categoryName;
  final List<String> images;
  final String? description;
  final int price; // selling price (₹, whole)
  final int mrp; // struck-through original (0 if none)
  final int stock;
  final double rating; // display rating (real if 10+ reviews, else admin seed)
  final int reviewCount; // display review count
  final int soldCount; // display sold count (real if 10+ sales, else admin seed)
  final List<String> highlights;

  const Product({
    required this.id, required this.name, this.categoryId, this.categoryName,
    this.images = const [], this.description, required this.price, this.mrp = 0,
    this.stock = 0, this.rating = 0, this.reviewCount = 0, this.soldCount = 0, this.highlights = const [],
  });

  bool get inStock => stock > 0;
  String? get firstImage => images.isNotEmpty ? images.first : null;
  int get discountPercent => (mrp > price && mrp > 0) ? (((mrp - price) / mrp) * 100).round() : 0;
  int get saveAmount => (mrp > price) ? (mrp - price) : 0;
  /// Compact social-proof label, e.g. "1.2k sold" / "340 sold".
  String? get soldLabel {
    if (soldCount <= 0) return null;
    if (soldCount >= 1000) return '${(soldCount / 1000).toStringAsFixed(soldCount % 1000 == 0 ? 0 : 1)}k sold';
    return '$soldCount sold';
  }

  factory Product.fromJson(Map<String, dynamic> j) => Product(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? '').toString(),
        categoryId: j['category']?.toString(),
        categoryName: j['categoryName']?.toString(),
        images: (j['images'] as List?)?.map((e) => e.toString()).where((s) => s.isNotEmpty).toList() ?? const [],
        description: j['description']?.toString(),
        price: (j['price'] as num?)?.toInt() ?? 0,
        mrp: (j['mrp'] as num?)?.toInt() ?? 0,
        stock: (j['stock'] as num?)?.toInt() ?? 0,
        // Prefer the server's display* virtuals (real-or-seed); fall back to raw.
        rating: (j['displayRating'] ?? j['rating'] as num?) is num ? ((j['displayRating'] ?? j['rating']) as num).toDouble() : 0,
        reviewCount: ((j['displayReviewCount'] ?? j['reviewCount']) as num?)?.toInt() ?? 0,
        soldCount: ((j['displaySold'] ?? j['soldCount']) as num?)?.toInt() ?? 0,
        highlights: (j['highlights'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      );
}

/// Public product browse API (list with filters + pagination, get by id).
class ProductApi {
  final ApiClient _api;
  ProductApi(this._api);

  /// List products. Filters: category (id), q (name), price range, inStock, sort.
  Future<List<Product>> list({
    String? category, String? q, int? minPrice, int? maxPrice, bool? inStock, String? sort,
    int page = 1, int limit = 20,
  }) async {
    final data = await _api.get('/products', query: {
      'page': page, 'limit': limit,
      if (category != null && category.isNotEmpty) 'category': category,
      if (q != null && q.isNotEmpty) 'q': q,
      if (minPrice != null) 'minPrice': minPrice,
      if (maxPrice != null) 'maxPrice': maxPrice,
      if (inStock == true) 'inStock': 'true',
      if (sort != null && sort.isNotEmpty) 'sort': sort,
    });
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? const [];
    return raw.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Product> get(String id) async {
    final data = await _api.get('/products/$id');
    return Product.fromJson(data as Map<String, dynamic>);
  }
}

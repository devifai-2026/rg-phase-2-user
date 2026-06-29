import 'api_client.dart';

/// A product category (GET /categories) — drives the home "Products" rail.
class Category {
  final String id;
  final String name;
  final String? image;
  final String? slug;

  const Category({required this.id, required this.name, this.image, this.slug});

  factory Category.fromJson(Map<String, dynamic> j) => Category(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? '').toString(),
        image: (j['image'] as String?)?.trim().isEmpty ?? true ? null : j['image'].toString(),
        slug: j['slug']?.toString(),
      );
}

/// Public product-category browse API.
class CategoryApi {
  final ApiClient _api;
  CategoryApi(this._api);

  /// Active product categories (admin-managed; with images).
  Future<List<Category>> list() async {
    final data = await _api.get('/categories');
    final raw = (data is List) ? data : (data is Map ? (data['items'] as List?) : null) ?? const [];
    return raw.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
  }
}

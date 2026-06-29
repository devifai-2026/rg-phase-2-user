import 'api_client.dart';

/// One CMS/legal document from the backend (Terms, Privacy…).
class LegalContent {
  final String key;
  final String title;
  final String body; // HTML
  final String? updatedAt;
  const LegalContent({required this.key, required this.title, required this.body, this.updatedAt});

  bool get hasBody => body.trim().isNotEmpty;

  factory LegalContent.fromJson(Map<String, dynamic> j) => LegalContent(
        key: (j['key'] ?? '').toString(),
        title: (j['title'] ?? '').toString(),
        body: (j['body'] ?? '').toString(),
        updatedAt: j['updatedAt']?.toString(),
      );
}

/// Public site-content reads (GET /content/:key). Used for Terms & Privacy.
class ContentApi {
  final ApiClient _api;
  ContentApi(this._api);

  /// Fetch a published doc by key, or null if missing/unpublished/unreachable
  /// (callers fall back to the built-in copy).
  Future<LegalContent?> fetch(String key) async {
    try {
      final data = await _api.get('/content/$key');
      final doc = LegalContent.fromJson(data as Map<String, dynamic>);
      return doc.hasBody ? doc : null;
    } catch (_) {
      return null;
    }
  }
}

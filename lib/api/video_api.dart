import 'api_client.dart';

/// An admin-managed YouTube video or lesson (GET /content/videos).
class VideoItem {
  final String id;
  final String title;
  final String youtubeId;
  final String youtubeUrl;
  final String? thumbnail;

  const VideoItem({
    required this.id, required this.title, required this.youtubeId,
    required this.youtubeUrl, this.thumbnail,
  });

  factory VideoItem.fromJson(Map<String, dynamic> j) => VideoItem(
        id: (j['_id'] ?? j['id'] ?? '').toString(),
        title: (j['title'] ?? '').toString(),
        youtubeId: (j['youtubeId'] ?? '').toString(),
        youtubeUrl: (j['youtubeUrl'] ?? '').toString(),
        thumbnail: (j['thumbnail']?.toString().isEmpty ?? true) ? null : j['thumbnail'].toString(),
      );
}

/// One page of results.
class VideoPage {
  final List<VideoItem> items;
  final int total;
  const VideoPage(this.items, this.total);
}

/// Public videos/lessons API — paginated + searchable ("See all" screen).
class VideoApi {
  final ApiClient _api;
  VideoApi(this._api);

  /// List videos/lessons. [kind] = 'video' | 'lesson'; [q] filters by title.
  Future<VideoPage> list({ required String kind, String? q, int page = 1, int limit = 20 }) async {
    final data = await _api.get('/content/videos', query: {
      'kind': kind, 'page': page, 'limit': limit,
      if (q != null && q.isNotEmpty) 'q': q,
    });
    final map = data as Map<String, dynamic>;
    final raw = (map['items'] as List?) ?? const [];
    return VideoPage(
      raw.map((e) => VideoItem.fromJson(e as Map<String, dynamic>)).toList(),
      (map['total'] as num?)?.toInt() ?? 0,
    );
  }
}

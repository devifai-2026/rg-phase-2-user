import 'api_client.dart';

/// One notification as returned by GET /notifications (mirrors the backend
/// Notification model: _id, type, title, body, data, isRead, createdAt).
class AppNotification {
  final String id;
  final String type;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  bool isRead;
  final DateTime? createdAt;

  AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    this.data = const {},
    this.isRead = false,
    this.createdAt,
  });

  /// Optional broadcast id (push tap attribution) tucked into `data`.
  String? get broadcastId => data['broadcastId']?.toString();

  factory AppNotification.fromJson(Map<String, dynamic> j) => AppNotification(
        id: (j['_id'] ?? j['id']).toString(),
        type: (j['type'] ?? 'system').toString(),
        title: (j['title'] ?? '').toString(),
        body: (j['body'] ?? '').toString(),
        data: (j['data'] is Map) ? Map<String, dynamic>.from(j['data']) : const {},
        isRead: j['isRead'] == true,
        createdAt: j['createdAt'] != null ? DateTime.tryParse(j['createdAt'].toString()) : null,
      );
}

class NotificationPage {
  final List<AppNotification> items;
  final int total;
  final int unread;
  final int page;
  const NotificationPage({required this.items, required this.total, required this.unread, required this.page});
}

/// Wraps the /notifications endpoints (list, mark read, delete, clear).
class NotificationApi {
  final ApiClient _api;
  NotificationApi(this._api);

  Future<NotificationPage> list({int page = 1, int limit = 30, bool unreadOnly = false}) async {
    final data = await _api.get('/notifications', query: {
      'page': page,
      'limit': limit,
      if (unreadOnly) 'unread': 'true',
    });
    final map = data as Map<String, dynamic>;
    final raw = (map['items'] as List?) ?? [];
    return NotificationPage(
      items: raw.map((e) => AppNotification.fromJson(e as Map<String, dynamic>)).toList(),
      total: (map['total'] as num?)?.toInt() ?? raw.length,
      unread: (map['unread'] as num?)?.toInt() ?? 0,
      page: (map['page'] as num?)?.toInt() ?? page,
    );
  }

  Future<void> markRead(String id) => _api.patch('/notifications/$id/read');
  Future<void> markAllRead() => _api.patch('/notifications/read-all');
  Future<void> delete(String id) => _api.delete('/notifications/$id');
  Future<void> clearAll() => _api.delete('/notifications');

  /// Record a tap on a broadcast notification (analytics click attribution).
  Future<void> recordClick(String broadcastId) =>
      _api.post('/notifications/click', body: {'broadcastId': broadcastId});
}

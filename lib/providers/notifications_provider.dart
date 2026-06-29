import 'package:flutter/foundation.dart';

import '../api/notification_api.dart';
import '../services/deep_link.dart';

/// Owns the user's notification inbox: list, unread count, and the
/// mark-read / delete / clear actions. Screens watch `items` + `unread`.
class NotificationsProvider extends ChangeNotifier {
  final NotificationApi _api;
  NotificationsProvider(this._api);

  List<AppNotification> _items = [];
  int _unread = 0;
  bool _loading = false;
  bool _loaded = false;
  String? _error;

  List<AppNotification> get items => _items;
  int get unread => _unread;
  bool get loading => _loading;
  bool get loaded => _loaded;
  String? get error => _error;

  /// Fetch the latest notifications. Call on app start (after login) and when
  /// the notifications screen opens / pull-to-refresh.
  Future<void> load() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final page = await _api.list(limit: 50);
      _items = page.items;
      _unread = page.unread;
      _loaded = true;
    } catch (e) {
      _error = 'Could not load notifications';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Lightweight refresh of just the unread count (e.g. on socket event).
  Future<void> refreshUnread() async {
    try {
      final page = await _api.list(limit: 1);
      _unread = page.unread;
      notifyListeners();
    } catch (_) {/* keep last known */}
  }

  Future<void> markRead(AppNotification n) async {
    if (n.isRead) return;
    n.isRead = true; // optimistic
    if (_unread > 0) _unread--;
    notifyListeners();
    try {
      await _api.markRead(n.id);
      if (n.broadcastId != null) _api.recordClick(n.broadcastId!).catchError((_) {});
    } catch (_) {/* keep optimistic state */}
  }

  /// Tapping a notification row: mark read, attribute the (de-duped) click, and
  /// deep-link to the relevant screen.
  void tap(AppNotification n) {
    markRead(n); // also records the click; backend de-dupes vs the push tap
    DeepLink.fromNotification(type: n.type, data: n.data);
  }

  Future<void> markAllRead() async {
    if (_unread == 0) return;
    for (final n in _items) {
      n.isRead = true;
    }
    _unread = 0;
    notifyListeners();
    try {
      await _api.markAllRead();
    } catch (_) {/* keep optimistic state */}
  }

  Future<void> delete(AppNotification n) async {
    final wasUnread = !n.isRead;
    _items.remove(n); // optimistic
    if (wasUnread && _unread > 0) _unread--;
    notifyListeners();
    try {
      await _api.delete(n.id);
    } catch (_) {
      // Re-insert on failure so the user isn't silently lied to.
      _items.add(n);
      if (wasUnread) _unread++;
      notifyListeners();
    }
  }

  Future<void> clearAll() async {
    final backup = List<AppNotification>.from(_items);
    final backupUnread = _unread;
    _items = [];
    _unread = 0;
    notifyListeners();
    try {
      await _api.clearAll();
    } catch (_) {
      _items = backup;
      _unread = backupUnread;
      notifyListeners();
    }
  }

  /// Clear local state on logout.
  void reset() {
    _items = [];
    _unread = 0;
    _loaded = false;
    notifyListeners();
  }
}

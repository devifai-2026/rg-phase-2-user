import 'api_client.dart';

/// Drives the post-session feedback dialog: which blocks to show.
///   canReviewAstrologer — false once this user has already reviewed this
///     astrologer (one review per astrologer, across all sessions).
///   canRateCallQuality  — true for an audio/video session not yet quality-rated.
class ReviewableState {
  final bool canReviewAstrologer;
  final bool canRateCallQuality;
  final String serviceType; // chat | call | video

  const ReviewableState({
    required this.canReviewAstrologer,
    required this.canRateCallQuality,
    required this.serviceType,
  });

  factory ReviewableState.fromJson(Map<String, dynamic> j) => ReviewableState(
        canReviewAstrologer: j['canReviewAstrologer'] == true,
        canRateCallQuality: j['canRateCallQuality'] == true,
        serviceType: (j['serviceType'] ?? '').toString(),
      );

  /// Nothing left to ask → skip the dialog entirely.
  bool get nothingToAsk => !canReviewAstrologer && !canRateCallQuality;
}

/// A consultation session (chat/call/video) as the user sees it. Mirrors the
/// backend Session record. Money is whole rupees ("coins").
class SessionInfo {
  final String sessionId;
  final String type; // chat | call | video
  final String status; // requested|ringing|ongoing|completed|missed|rejected|cancelled|failed
  final int ratePerMin;
  final int durationSec;
  final int billedMinutes;
  final int totalAmount; // coins deducted
  final String? endReason;
  final DateTime? startedAt;
  final DateTime? endedAt;

  /// Server's "now" at response time — pairs with [startedAt] so the client can
  /// correct for device clock skew and show the server-exact elapsed timer.
  final DateTime? serverNow;

  /// True only for completed chat sessions whose message history is still within
  /// the 7-day retention window (i.e. the transcript can still be viewed).
  final bool canViewChat;

  const SessionInfo({
    required this.sessionId,
    required this.type,
    required this.status,
    this.ratePerMin = 0,
    this.durationSec = 0,
    this.billedMinutes = 0,
    this.totalAmount = 0,
    this.endReason,
    this.startedAt,
    this.endedAt,
    this.serverNow,
    this.canViewChat = false,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> j) => SessionInfo(
        sessionId: (j['sessionId'] ?? '').toString(),
        type: (j['type'] ?? 'chat').toString(),
        status: (j['status'] ?? '').toString(),
        ratePerMin: (j['ratePerMin'] as num?)?.toInt() ?? 0,
        durationSec: (j['durationSec'] as num?)?.toInt() ?? 0,
        billedMinutes: (j['billedMinutes'] as num?)?.toInt() ?? 0,
        totalAmount: (j['totalAmount'] as num?)?.toInt() ?? 0,
        endReason: j['endReason']?.toString(),
        startedAt: j['startedAt'] != null ? DateTime.tryParse(j['startedAt'].toString())?.toLocal() : null,
        endedAt: j['endedAt'] != null ? DateTime.tryParse(j['endedAt'].toString())?.toLocal() : null,
        serverNow: j['serverNow'] != null ? DateTime.tryParse(j['serverNow'].toString())?.toLocal() : null,
        canViewChat: j['canViewChat'] == true,
      );
}

/// A chat message in a session (user or system; text or image).
/// A product the astrologer shared into the chat. Tapping the card opens the
/// product detail page (via [productId]).
class SharedProduct {
  final String productId;
  final String name;
  final int price;
  final String? image;
  const SharedProduct({required this.productId, required this.name, required this.price, this.image});

  factory SharedProduct.fromJson(Map<String, dynamic> j) => SharedProduct(
        productId: (j['productId'] ?? j['_id'] ?? '').toString(),
        name: (j['name'] ?? 'Product').toString(),
        price: (j['price'] as num?)?.toInt() ?? 0,
        image: (j['image'] as String?)?.isNotEmpty == true ? j['image'] as String : null,
      );
}

class ChatMsg {
  final String id;
  final String sessionId;
  final String kind; // user | system
  final String? sender; // null for system messages
  final String? message;
  final String? mediaUrl;
  final String? mediaType;
  final SharedProduct? product; // astrologer-shared product card
  final String status; // sent | delivered | read
  final DateTime timestamp;

  const ChatMsg({
    required this.id,
    required this.sessionId,
    this.kind = 'user',
    this.sender,
    this.message,
    this.mediaUrl,
    this.mediaType,
    this.product,
    this.status = 'sent',
    required this.timestamp,
  });

  bool get isSystem => kind == 'system';
  bool get hasImage => mediaUrl != null && mediaUrl!.isNotEmpty;
  bool get hasProduct => product != null;

  factory ChatMsg.fromJson(Map<String, dynamic> j) => ChatMsg(
        id: (j['id'] ?? j['_id'] ?? '').toString(),
        sessionId: (j['sessionId'] ?? '').toString(),
        kind: (j['kind'] ?? 'user').toString(),
        sender: j['sender']?.toString(),
        message: j['message']?.toString(),
        mediaUrl: j['mediaUrl']?.toString(),
        mediaType: j['mediaType']?.toString(),
        product: (j['product'] is Map && (j['product']['productId'] ?? j['product']['_id']) != null)
            ? SharedProduct.fromJson(Map<String, dynamic>.from(j['product']))
            : null,
        status: (j['status'] ?? 'sent').toString(),
        timestamp: DateTime.tryParse((j['timestamp'] ?? '').toString())?.toLocal() ?? DateTime.now(),
      );
}

/// Agora join credentials for a media (call/video) session.
class RtcToken {
  final String appId;
  final String token;
  final String channelName;
  final int uid;
  const RtcToken({required this.appId, required this.token, required this.channelName, required this.uid});
  factory RtcToken.fromJson(Map<String, dynamic> j) => RtcToken(
        appId: (j['appId'] ?? '').toString(),
        token: (j['token'] ?? '').toString(),
        channelName: (j['channelName'] ?? '').toString(),
        uid: (j['uid'] as num?)?.toInt() ?? 0,
      );
}

/// REST surface for the consultation flow. Most realtime signalling goes over
/// the socket; these are the request/cancel/end/history/review calls + the
/// HTTP fallbacks.
class SessionApi {
  final ApiClient _api;
  SessionApi(this._api);

  /// Start a session of [type] (chat|call|video) with an astrologer (by their
  /// USER id). Returns the created session (status 'ringing').
  Future<SessionInfo> requestSession(String astrologerUserId, String type) async {
    final data = await _api.post('/sessions/start', body: {'astrologerId': astrologerUserId, 'type': type});
    final s = (data as Map)['session'] ?? data;
    return SessionInfo.fromJson(Map<String, dynamic>.from(s as Map));
  }

  /// The user's currently-LIVE session (status accepted|ongoing) to RESUME after
  /// an app kill, or null if none. Carries the session + a fresh media token.
  /// Returns the raw maps so the provider can rehydrate from server truth.
  Future<({SessionInfo session, RtcToken? token})?> active() async {
    final data = await _api.get('/sessions/me/active');
    if (data == null || data is! Map || data['session'] == null) return null;
    final session = SessionInfo.fromJson(Map<String, dynamic>.from(data['session'] as Map));
    final token = data['token'] is Map ? RtcToken.fromJson(Map<String, dynamic>.from(data['token'] as Map)) : null;
    return (session: session, token: token);
  }

  /// Cancel a still-ringing request the user owns.
  Future<void> cancel(String sessionId) => _api.post('/sessions/$sessionId/cancel');

  /// End an ongoing session.
  Future<void> end(String sessionId) => _api.post('/sessions/$sessionId/end');

  /// Fetch a session by id (used to resume / re-sync timer from startedAt).
  Future<SessionInfo> detail(String sessionId) async {
    final data = await _api.get('/sessions/$sessionId');
    return SessionInfo.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// Agora token for a media session.
  Future<RtcToken> token(String sessionId) async {
    final data = await _api.get('/sessions/$sessionId/token');
    return RtcToken.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// Prior messages for a session (history; empty once 7-day TTL expires).
  Future<List<ChatMsg>> messages(String sessionId, {int page = 1, int limit = 50}) async {
    final data = await _api.get('/sessions/$sessionId/messages', query: {'page': page, 'limit': limit});
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? [];
    return raw.map((e) => ChatMsg.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  /// Like [messages] but also surfaces whether the 7-day history has lapsed.
  /// `expired: true` means the transcript is no longer available (items empty).
  Future<({List<ChatMsg> items, bool expired})> messagesWithMeta(String sessionId, {int page = 1, int limit = 50}) async {
    final data = await _api.get('/sessions/$sessionId/messages', query: {'page': page, 'limit': limit});
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? [];
    final items = raw.map((e) => ChatMsg.fromJson(Map<String, dynamic>.from(e as Map))).toList();
    final expired = data is Map && data['expired'] == true;
    return (items: items, expired: expired);
  }

  /// Session history (newest first). Each item carries duration + coins.
  /// Pass [type] (chat|call|video) to filter to a single service.
  Future<List<SessionInfo>> history({int page = 1, int limit = 20, String? type}) async {
    final data = await _api.get('/sessions', query: {
      'page': page,
      'limit': limit,
      if (type != null) 'type': type,
    });
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? [];
    return raw.map((e) => SessionInfo.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  /// What the post-session dialog should ask: whether the astrologer can still
  /// be reviewed (one review per astrologer, ever) and whether to rate call
  /// quality (audio/video only, once per session).
  Future<ReviewableState> reviewable(String sessionId) async {
    final data = await _api.get('/sessions/$sessionId/reviewable');
    return ReviewableState.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// Post-session feedback. `rating` (1-5) reviews the astrologer (only sent the
  /// first time you review them); `callQuality` (1-5) rates this audio/video
  /// call. At least one must be provided.
  Future<void> review(String sessionId, {int? rating, String? comment, int? callQuality}) async {
    await _api.post('/sessions/$sessionId/review', body: {
      if (rating != null) 'rating': rating,
      if (comment != null && comment.trim().isNotEmpty) 'comment': comment.trim(),
      if (callQuality != null) 'callQuality': callQuality,
    });
  }

  /// The astrologer-approved AI recap for a chat session (Feature 1), shown in
  /// chat history. Returns null when no recap has been published for it (the
  /// common case — most chats won't have one).
  Future<UserRecap?> recap(String sessionId) async {
    final data = await _api.get('/ai/sessions/$sessionId/recap');
    if (data == null || data is! Map) return null;
    return UserRecap.fromJson(Map<String, dynamic>.from(data));
  }
}

/// An astrologer-approved recap + product suggestions, as the user sees it.
class UserRecap {
  final String summary;
  final String sentiment;
  final List<String> keyTopics;
  final List<RecapSuggestion> suggestions;

  /// Scheduled reminders the astrologer confirmed (daily mantra practices and
  /// one-off events). May be empty — a recap with only reminders still shows.
  final List<UserReminder> reminders;

  const UserRecap({
    required this.summary,
    required this.sentiment,
    required this.keyTopics,
    required this.suggestions,
    required this.reminders,
  });

  bool get isEmpty => summary.trim().isEmpty && suggestions.isEmpty && reminders.isEmpty;

  factory UserRecap.fromJson(Map<String, dynamic> j) => UserRecap(
        summary: (j['summary'] ?? '').toString(),
        sentiment: (j['sentiment'] ?? '').toString(),
        keyTopics: (j['keyTopics'] as List?)?.map((e) => e.toString()).toList() ?? const [],
        suggestions: (j['suggestions'] as List?)
                ?.map((e) => RecapSuggestion.fromJson(Map<String, dynamic>.from(e as Map)))
                .toList() ??
            const [],
        reminders: (j['reminders'] as List?)
                ?.map((e) => UserReminder.fromJson(Map<String, dynamic>.from(e as Map)))
                .toList() ??
            const [],
      );
}

/// One astrologer-confirmed reminder within a [UserRecap]. A `mantra` is a daily
/// practice fired 5 min before [timeOfDay] for 14 days; an `event` is a one-off
/// on [date]. Read-only — purely informational on the recap card.
class UserReminder {
  final String type; // mantra | event
  final String title;
  final String? reason;
  final String? timeOfDay; // 'HH:MM' — mantra reminders
  final String? date; // 'YYYY-MM-DD' — event reminders

  const UserReminder({
    required this.type,
    required this.title,
    this.reason,
    this.timeOfDay,
    this.date,
  });

  bool get isMantra => type == 'mantra';
  bool get isEvent => type == 'event';

  factory UserReminder.fromJson(Map<String, dynamic> j) => UserReminder(
        type: (j['type'] ?? '').toString(),
        title: (j['title'] ?? '').toString(),
        reason: j['reason']?.toString(),
        timeOfDay: j['timeOfDay']?.toString(),
        date: j['date']?.toString(),
      );
}

/// One approved product suggestion within a [UserRecap].
class RecapSuggestion {
  final String productId;
  final String productName;
  final int price;
  final int mrp;
  final String? image;
  final String title;
  final String? reason;

  const RecapSuggestion({
    required this.productId,
    required this.productName,
    required this.price,
    this.mrp = 0,
    this.image,
    required this.title,
    this.reason,
  });

  factory RecapSuggestion.fromJson(Map<String, dynamic> j) {
    final prod = j['product'];
    final pm = prod is Map ? Map<String, dynamic>.from(prod) : <String, dynamic>{};
    final images = (pm['images'] as List?)?.map((e) => e.toString()).toList() ?? const [];
    return RecapSuggestion(
      productId: (pm['_id'] ?? pm['id'] ?? (prod is String ? prod : '')).toString(),
      productName: (pm['name'] ?? '').toString(),
      price: (pm['price'] as num?)?.toInt() ?? 0,
      mrp: (pm['mrp'] as num?)?.toInt() ?? 0,
      image: images.isNotEmpty ? images.first : null,
      title: (j['title'] ?? 'Suggested item').toString(),
      reason: j['reason']?.toString(),
    );
  }
}

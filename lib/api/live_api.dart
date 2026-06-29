import 'api_client.dart';
import 'session_api.dart' show RtcToken;

/// A currently-live astrologer card (user app Live tab).
class LiveCard {
  final String id;
  final String channelName;
  final String title;
  final String topic;
  final int viewerCount;
  final String astrologerName;
  final String? astrologerAvatar;
  final double rating;
  final List<String> expertise;

  const LiveCard({
    required this.id,
    required this.channelName,
    required this.title,
    required this.topic,
    required this.viewerCount,
    required this.astrologerName,
    required this.astrologerAvatar,
    required this.rating,
    required this.expertise,
  });

  factory LiveCard.fromJson(Map<String, dynamic> j) {
    final a = (j['astrologer'] is Map) ? Map<String, dynamic>.from(j['astrologer']) : const {};
    return LiveCard(
      id: (j['id'] ?? j['_id'] ?? '').toString(),
      channelName: (j['channelName'] ?? '').toString(),
      title: (j['title'] ?? '').toString(),
      topic: (j['topic'] ?? '').toString(),
      viewerCount: (j['viewerCount'] as num?)?.toInt() ?? 0,
      astrologerName: (a['name'] ?? 'Astrologer').toString(),
      astrologerAvatar: a['avatar']?.toString(),
      rating: (a['rating'] as num?)?.toDouble() ?? 0,
      expertise: ((a['expertise'] as List?) ?? const []).map((e) => e.toString()).toList(),
    );
  }
}

/// Result of joining a broadcast as audience.
class JoinLiveResult {
  final String liveSessionId;
  final String astrologerUserId; // for sending gifts (receiver)
  final String title;
  final String topic;
  final int viewerCount;
  final DateTime? startedAt; // broadcast start → drives the live elapsed timer
  final RtcToken token;
  final Map<String, dynamic>? activePoll;

  const JoinLiveResult({
    required this.liveSessionId,
    required this.astrologerUserId,
    required this.title,
    required this.topic,
    required this.viewerCount,
    required this.startedAt,
    required this.token,
    required this.activePoll,
  });

  factory JoinLiveResult.fromJson(Map<String, dynamic> j) {
    final ls = Map<String, dynamic>.from(j['liveSession'] as Map);
    return JoinLiveResult(
      liveSessionId: (ls['id'] ?? ls['_id'] ?? '').toString(),
      astrologerUserId: (ls['astrologer'] ?? '').toString(),
      title: (ls['title'] ?? '').toString(),
      topic: (ls['topic'] ?? '').toString(),
      viewerCount: (ls['viewerCount'] as num?)?.toInt() ?? 0,
      startedAt: ls['startedAt'] != null ? DateTime.tryParse(ls['startedAt'].toString())?.toLocal() : null,
      token: RtcToken.fromJson(Map<String, dynamic>.from(j['token'] as Map)),
      activePoll: j['activePoll'] is Map ? Map<String, dynamic>.from(j['activePoll']) : null,
    );
  }
}

/// REST surface for the user's live experience: discover, join, leave, comment,
/// vote. Comments/gifts/polls/viewer-counts arrive over the socket while in-room.
class LiveApi {
  final ApiClient _c;
  LiveApi(this._c);

  Future<List<LiveCard>> list() async {
    final data = await _c.get('/live');
    final raw = (data as List?) ?? const [];
    return raw.map((e) => LiveCard.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<JoinLiveResult> join(String liveSessionId) async {
    final data = await _c.post('/live/$liveSessionId/join');
    return JoinLiveResult.fromJson(Map<String, dynamic>.from(data as Map));
  }

  Future<void> leave(String liveSessionId) => _c.post('/live/$liveSessionId/leave');

  Future<Map<String, dynamic>> comment(String liveSessionId, String text) async {
    final data = await _c.post('/live/$liveSessionId/comment', body: {'text': text});
    return Map<String, dynamic>.from(data as Map);
  }

  Future<Map<String, dynamic>> vote(String liveSessionId, String pollId, String optionId) async {
    final data = await _c.post('/live/$liveSessionId/poll/$pollId/vote', body: {'optionId': optionId});
    return Map<String, dynamic>.from(data as Map);
  }
}

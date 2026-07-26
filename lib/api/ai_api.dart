import 'api_client.dart';
import 'session_api.dart' show SharedProduct;

/// One selectable AI astrologer, from GET /ai/personas.
/// `systemPrompt` is intentionally absent: the server never sends it.
class AiPersona {
  final String id;
  final String name;
  final String? avatar;
  final String? description;
  final String? tagline;
  final List<String> expertise;
  final List<String> languages;

  /// Already resolved server-side (persona override or the tenant default), so
  /// the app never has to know about rate inheritance.
  final int chatRatePerMin;

  /// Optional life area this persona specialises in (career|marriage|...).
  final String topic;

  const AiPersona({
    required this.id,
    required this.name,
    this.avatar,
    this.description,
    this.tagline,
    this.expertise = const [],
    this.languages = const [],
    this.chatRatePerMin = 0,
    this.topic = '',
  });

  factory AiPersona.fromJson(Map<String, dynamic> j) => AiPersona(
        id: (j['id'] ?? j['_id'] ?? '').toString(),
        name: (j['name'] ?? 'AI Astrologer').toString(),
        avatar: (j['avatar'] as String?)?.isNotEmpty == true ? j['avatar'] as String : null,
        description: j['description'] as String?,
        tagline: j['tagline'] as String?,
        expertise: ((j['expertise'] as List?) ?? const []).map((e) => e.toString()).toList(),
        languages: ((j['languages'] as List?) ?? const []).map((e) => e.toString()).toList(),
        chatRatePerMin: (j['chatRatePerMin'] as num?)?.toInt() ?? 0,
        topic: (j['topic'] ?? '').toString(),
      );
}

/// A free remedy the astrologer suggested, tied to a placement in the chart.
class AiMantra {
  final String text;
  final String? count;
  final String? when;
  final String? reason;

  const AiMantra({required this.text, this.count, this.when, this.reason});

  factory AiMantra.fromJson(Map<String, dynamic> j) => AiMantra(
        text: (j['text'] ?? '').toString(),
        count: j['count'] as String?,
        when: j['when'] as String?,
        reason: j['reason'] as String?,
      );

  /// "108 times · Saturday mornings" for the card subtitle.
  String get detail => [count, when].where((s) => s != null && s.isNotEmpty).join(' · ');
}

/// An opened (not yet billing) AI chat.
class AiChatStart {
  final String aiSessionId;
  final int ratePerMin;
  final int maxMinutes;

  /// How many minutes the current wallet balance covers — lets the app warn
  /// BEFORE the seeker types and starts the meter.
  final int minutesAffordable;
  final String? personaName;
  final String? personaAvatar;

  const AiChatStart({
    required this.aiSessionId,
    required this.ratePerMin,
    required this.maxMinutes,
    required this.minutesAffordable,
    this.personaName,
    this.personaAvatar,
  });

  factory AiChatStart.fromJson(Map<String, dynamic> j) {
    final p = j['persona'] as Map?;
    return AiChatStart(
      aiSessionId: (j['aiSessionId'] ?? '').toString(),
      ratePerMin: (j['ratePerMin'] as num?)?.toInt() ?? 0,
      maxMinutes: (j['maxMinutes'] as num?)?.toInt() ?? 30,
      minutesAffordable: (j['minutesAffordable'] as num?)?.toInt() ?? 0,
      personaName: p?['name']?.toString(),
      personaAvatar: p?['avatar']?.toString(),
    );
  }

  bool get isFree => ratePerMin <= 0;
}

/// One reply from the AI astrologer.
class AiReply {
  final String reply;
  final List<AiMantra> mantras;
  final List<SharedProduct> products;
  final List<String> keyTopics;

  /// Minutes still covered by the reserved funds.
  final int minutesLeft;
  final int billedMinutes;

  /// The server ended the session with this reply (crisis, funds, or the cap).
  final bool ended;

  /// The model was unavailable and `reply` is an honest fallback, not a reading.
  /// The UI should not persist or celebrate a degraded reply.
  final bool degraded;

  const AiReply({
    required this.reply,
    this.mantras = const [],
    this.products = const [],
    this.keyTopics = const [],
    this.minutesLeft = 0,
    this.billedMinutes = 0,
    this.ended = false,
    this.degraded = false,
  });

  factory AiReply.fromJson(Map<String, dynamic> j) => AiReply(
        reply: (j['reply'] ?? '').toString(),
        mantras: ((j['mantras'] as List?) ?? const [])
            .map((e) => AiMantra.fromJson(Map<String, dynamic>.from(e as Map)))
            .where((m) => m.text.isNotEmpty)
            .toList(),
        products: ((j['products'] as List?) ?? const [])
            .whereType<Map>()
            .map((e) => SharedProduct.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        keyTopics: ((j['keyTopics'] as List?) ?? const []).map((e) => e.toString()).toList(),
        minutesLeft: (j['minutesLeft'] as num?)?.toInt() ?? 0,
        billedMinutes: (j['billedMinutes'] as num?)?.toInt() ?? 0,
        ended: j['ended'] == true,
        degraded: j['degraded'] == true,
      );
}

/// A one-shot life-area reading (the home Career/Marriage/... icons).
class AiReading {
  /// True when the seeker has no usable birth details — ask, do not render an
  /// empty reading.
  final bool needsBirthDetails;
  final String topic;
  final String reading;
  final List<AiMantra> mantras;
  final List<SharedProduct> products;
  final List<String> keyTopics;

  /// Rendered D1 chart, if the provider returned one.
  final String? svg;

  /// False when the birth time was unknown, so the UI can invite them to add it.
  final bool timeKnown;
  final bool degraded;

  const AiReading({
    required this.needsBirthDetails,
    this.topic = '',
    this.reading = '',
    this.mantras = const [],
    this.products = const [],
    this.keyTopics = const [],
    this.svg,
    this.timeKnown = true,
    this.degraded = false,
  });

  factory AiReading.fromJson(Map<String, dynamic> j) => AiReading(
        needsBirthDetails: j['needsBirthDetails'] == true,
        topic: (j['topic'] ?? '').toString(),
        reading: (j['reading'] ?? '').toString(),
        mantras: ((j['mantras'] as List?) ?? const [])
            .map((e) => AiMantra.fromJson(Map<String, dynamic>.from(e as Map)))
            .where((m) => m.text.isNotEmpty)
            .toList(),
        products: ((j['products'] as List?) ?? const [])
            .whereType<Map>()
            .map((e) => SharedProduct.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        keyTopics: ((j['keyTopics'] as List?) ?? const []).map((e) => e.toString()).toList(),
        svg: (j['svg'] as String?)?.isNotEmpty == true ? j['svg'] as String : null,
        timeKnown: j['timeKnown'] != false,
        degraded: j['degraded'] == true,
      );
}

/// AI astrologer endpoints: personas, the billed chat, and topic readings.
class AiApi {
  final ApiClient _api;
  AiApi(this._api);

  /// The selectable AI astrologers. `enabled: false` means the tenant has the
  /// feature switched off, and the tab should say so rather than show an empty list.
  Future<({bool enabled, List<AiPersona> items})> personas() async {
    final data = await _api.get('/ai/personas');
    final m = (data as Map?) ?? const {};
    final raw = (m['items'] as List?) ?? const [];
    return (
      enabled: m['enabled'] != false,
      items: raw.map((e) => AiPersona.fromJson(Map<String, dynamic>.from(e as Map))).toList(),
    );
  }

  /// Open a chat. FREE: the meter starts on the first message, so a mis-tap here
  /// costs nothing and the seeker still gets to pick a language.
  Future<AiChatStart> startChat({String? personaId, String? topic, String? lang}) async {
    final data = await _api.post('/ai/chat/sessions', body: {
      if (personaId != null && personaId.isNotEmpty) 'personaId': personaId,
      if (topic != null && topic.isNotEmpty) 'topic': topic,
      if (lang != null && lang.isNotEmpty) 'lang': lang,
    });
    return AiChatStart.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// Send a message. The FIRST call starts billing and locks funds.
  Future<AiReply> sendMessage(String aiSessionId, String message) async {
    final data = await _api.post('/ai/chat/sessions/$aiSessionId/messages', body: {'message': message});
    return AiReply.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// End the chat and release unspent reserved funds. Best-effort from the app:
  /// the server's idle timer is the real guarantee, so failures here are ignored.
  Future<void> endChat(String aiSessionId) async {
    try {
      await _api.post('/ai/chat/sessions/$aiSessionId/end', body: const {});
    } catch (_) {/* the idle sweep will close it */}
  }

  /// A one-shot reading for a life area. Not billed.
  /// Passing birth details also SAVES them, so the seeker is asked only once.
  Future<AiReading> reading({
    required String topic,
    String? dob,
    String? tob,
    bool? timeKnown,
    double? lat,
    double? lng,
    String? place,
    String? lang,
    String? question,
  }) async {
    final data = await _api.post('/ai/reading', body: {
      'topic': topic,
      if (dob != null) 'dob': dob,
      if (tob != null && tob.isNotEmpty) 'tob': tob,
      if (timeKnown != null) 'timeKnown': timeKnown,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (place != null && place.isNotEmpty) 'place': place,
      if (lang != null && lang.isNotEmpty) 'lang': lang,
      if (question != null && question.isNotEmpty) 'question': question,
    });
    return AiReading.fromJson(Map<String, dynamic>.from(data as Map));
  }
}

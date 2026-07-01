import 'api_client.dart';

/// Map a gift name to its emoji. The admin catalog items carry no image, so we
/// render the exact emoji for the gift instead of a generic gift icon. Shared by
/// every gift surface (send sheet, astrologer profile "gifts received", chat)
/// so the SAME gift always shows the SAME emoji. Falls back to 🎁 for unknown
/// names. When a gift DOES have an image URL, callers should prefer that.
String giftEmoji(String name) {
  final n = name.toLowerCase();
  if (n.contains('rose') || n.contains('flower')) return '🌹';
  if (n.contains('diya') || n.contains('lamp') || n.contains('candle')) return '🪔';
  if (n.contains('garland') || n.contains('mala')) return '💐';
  if (n.contains('lotus')) return '🪷';
  if (n.contains('coconut')) return '🥥';
  if (n.contains('sweet') || n.contains('laddu') || n.contains('mithai')) return '🍬';
  if (n.contains('heart') || n.contains('love')) return '❤️';
  if (n.contains('star')) return '⭐';
  if (n.contains('crown')) return '👑';
  if (n.contains('gold') || n.contains('coin')) return '🪙';
  return '🎁';
}

/// A purchasable gift from the admin catalog (GET /gifts).
class Gift {
  final String id;
  final String name;
  final String? image;
  final String? _emoji; // admin-set emoji (may be null → derive from name)
  final int tokenCost;
  final int rupeeCost; // resolved ₹ cost (tokenCost × giftTokenRupees)
  const Gift({required this.id, required this.name, this.image, String? emoji, required this.tokenCost, this.rupeeCost = 0}) : _emoji = emoji;

  /// The emoji to render for this gift: the admin-set one when present, else
  /// derived from the name. Always non-empty (🎁 fallback).
  String get emoji { final e = _emoji; return (e != null && e.isNotEmpty) ? e : giftEmoji(name); }

  factory Gift.fromJson(Map<String, dynamic> j) => Gift(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? 'Gift').toString(),
        image: j['image']?.toString(),
        emoji: j['emoji']?.toString(),
        tokenCost: (j['tokenCost'] as num?)?.toInt() ?? 0,
        rupeeCost: (j['rupeeCost'] as num?)?.toInt() ?? (j['tokenCost'] as num?)?.toInt() ?? 0,
      );
}

/// One aggregated "gifts received" entry for an astrologer.
class ReceivedGift {
  final String name;
  final String? image;
  final String? _emoji;
  final int count;
  const ReceivedGift({required this.name, this.image, String? emoji, required this.count}) : _emoji = emoji;

  /// Emoji to render: admin-set when present, else derived from the name.
  String get emoji { final e = _emoji; return (e != null && e.isNotEmpty) ? e : giftEmoji(name); }

  factory ReceivedGift.fromJson(Map<String, dynamic> j) => ReceivedGift(
        name: (j['name'] ?? '').toString(),
        image: j['image']?.toString(),
        emoji: j['emoji']?.toString(),
        count: (j['count'] as num?)?.toInt() ?? 0,
      );
}

/// Gift catalog + send + received-aggregate.
class GiftApi {
  final ApiClient _api;
  GiftApi(this._api);

  // The catalog rarely changes — cache it for the session after first load.
  List<Gift>? _catalog;

  /// Active gift catalog (cached). Pass [forceRefresh] to re-fetch.
  Future<List<Gift>> catalog({bool forceRefresh = false}) async {
    if (_catalog != null && !forceRefresh) return _catalog!;
    final data = await _api.get('/gifts');
    final raw = (data as List?) ?? const [];
    _catalog = raw.map((e) => Gift.fromJson(e as Map<String, dynamic>)).toList();
    return _catalog!;
  }

  /// Send one gift to an astrologer (receiver = the astrologer's USER id).
  /// Debits the sender's wallet server-side. Throws ApiException on failure
  /// (e.g. insufficient balance — surfaced via the message).
  Future<void> send({required String giftId, required String receiverUserId, String? sessionId, String? liveSessionId}) async {
    await _api.post('/gifts/send', body: {
      'giftId': giftId,
      'receiverId': receiverUserId,
      if (sessionId != null) 'sessionId': sessionId,
      if (liveSessionId != null) 'liveSessionId': liveSessionId,
    });
  }

  /// Gifts an astrologer has received, aggregated by type (profileId = profile id).
  Future<({int total, List<ReceivedGift> items})> received(String profileId) async {
    final data = await _api.get('/gifts/received/$profileId');
    final m = (data is Map) ? data : const {};
    final items = ((m['items'] as List?) ?? const [])
        .map((e) => ReceivedGift.fromJson(e as Map<String, dynamic>))
        .toList();
    return (total: (m['total'] as num?)?.toInt() ?? 0, items: items);
  }
}

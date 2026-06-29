import 'api_client.dart';

/// A purchasable gift from the admin catalog (GET /gifts).
class Gift {
  final String id;
  final String name;
  final String? image;
  final int tokenCost;
  final int rupeeCost; // resolved ₹ cost (tokenCost × giftTokenRupees)
  const Gift({required this.id, required this.name, this.image, required this.tokenCost, this.rupeeCost = 0});
  factory Gift.fromJson(Map<String, dynamic> j) => Gift(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? 'Gift').toString(),
        image: j['image']?.toString(),
        tokenCost: (j['tokenCost'] as num?)?.toInt() ?? 0,
        rupeeCost: (j['rupeeCost'] as num?)?.toInt() ?? (j['tokenCost'] as num?)?.toInt() ?? 0,
      );
}

/// One aggregated "gifts received" entry for an astrologer.
class ReceivedGift {
  final String name;
  final String? image;
  final int count;
  const ReceivedGift({required this.name, this.image, required this.count});
  factory ReceivedGift.fromJson(Map<String, dynamic> j) => ReceivedGift(
        name: (j['name'] ?? '').toString(),
        image: j['image']?.toString(),
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

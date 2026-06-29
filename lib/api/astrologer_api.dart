import 'api_client.dart';

/// A public astrologer (GET /astrologers). Maps the fields the cards/profile need.
class Astrologer {
  final String id; // profile id
  final String? userId;
  final String name;
  final String? avatar;
  final List<String> expertise;
  final List<String> languages;
  final int experienceYears;
  final double rating;
  final int reviewCount;
  final bool isOnline;
  final bool isFeatured;
  final String currentCallStatus; // 'available' | 'busy' | 'offline'
  final bool live; // true while broadcasting a live session
  final String? liveSessionId; // the broadcast to join (when live)
  final int callRate; // ₹/min (0 if disabled)
  final int chatRate;
  final int videoRate;
  final String? bio; // admin/astrologer-authored bio (the real "About" text)
  final String? coverPhoto; // wide cover/banner image

  const Astrologer({
    required this.id, this.userId, required this.name, this.avatar,
    this.expertise = const [], this.languages = const [], this.experienceYears = 0,
    this.rating = 0, this.reviewCount = 0, this.isOnline = false, this.isFeatured = false,
    this.currentCallStatus = 'offline',
    this.live = false, this.liveSessionId,
    this.callRate = 0, this.chatRate = 0, this.videoRate = 0,
    this.bio, this.coverPhoto,
  });

  /// Card status string: 'live' while broadcasting, else busy/online/offline.
  String get cardStatus => live ? 'live' : (currentCallStatus == 'busy' ? 'busy' : (isOnline ? 'online' : 'offline'));

  /// Live-patch the status fields (used by the realtime socket update).
  Astrologer copyWith({bool? isOnline, String? currentCallStatus, bool? live, String? liveSessionId}) => Astrologer(
        id: id, userId: userId, name: name, avatar: avatar,
        expertise: expertise, languages: languages, experienceYears: experienceYears,
        rating: rating, reviewCount: reviewCount,
        isOnline: isOnline ?? this.isOnline, isFeatured: isFeatured,
        currentCallStatus: currentCallStatus ?? this.currentCallStatus,
        live: live ?? this.live, liveSessionId: liveSessionId ?? this.liveSessionId,
        callRate: callRate, chatRate: chatRate, videoRate: videoRate,
        bio: bio, coverPhoto: coverPhoto,
      );

  /// Lowest enabled per-minute rate, for the "from ₹N/min" card label.
  int get minRate {
    final rates = [callRate, chatRate, videoRate].where((r) => r > 0).toList();
    return rates.isEmpty ? 0 : rates.reduce((a, b) => a < b ? a : b);
  }

  factory Astrologer.fromJson(Map<String, dynamic> j) {
    final user = j['user'];
    final rates = (j['rates'] as Map?) ?? {};
    int rate(String k) {
      final r = rates[k];
      return (r is Map && r['enabled'] == true) ? ((r['ratePerMin'] as num?)?.toInt() ?? 0) : 0;
    }
    return Astrologer(
      id: (j['_id'] ?? j['id']).toString(),
      userId: user is Map ? user['_id']?.toString() : user?.toString(),
      name: (j['displayName'] ?? (user is Map ? user['name'] : null) ?? 'Astrologer').toString(),
      avatar: j['avatar']?.toString(),
      expertise: (j['expertise'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      languages: (j['languages'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      experienceYears: (j['experienceYears'] as num?)?.toInt() ?? 0,
      rating: (j['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (j['reviewCount'] as num?)?.toInt() ?? 0,
      isOnline: j['isOnline'] == true,
      isFeatured: j['isFeatured'] == true,
      currentCallStatus: (j['currentCallStatus'] ?? (j['isOnline'] == true ? 'available' : 'offline')).toString(),
      live: j['live'] == true,
      liveSessionId: j['liveSessionId']?.toString(),
      callRate: rate('call'), chatRate: rate('chat'), videoRate: rate('video'),
      bio: (j['bio'] as String?)?.trim().isNotEmpty == true ? (j['bio'] as String).trim() : null,
      coverPhoto: (j['coverPhoto'] as String?)?.trim().isNotEmpty == true ? (j['coverPhoto'] as String).trim() : null,
    );
  }
}

/// Public astrologer browse API (list with filters + pagination).
class AstrologerApi {
  final ApiClient _api;
  AstrologerApi(this._api);

  // ── In-memory profile cache ──
  // The full public profile (GET /astrologers/:id) changes rarely, so cache it
  // on this singleton (survives navigation; cleared on app restart). A short
  // 1-minute TTL keeps the detail screen instant on repeat visits while staying
  // fresh — the backend itself caches this read for 120s.
  static const _profileTtl = Duration(minutes: 1);
  final Map<String, Astrologer> _profileCache = {};
  final Map<String, DateTime> _profileCachedAt = {};

  /// List astrologers. Filters: q (name), expertise (category), language,
  /// online, featured, maxPrice (lowest enabled rate ≤ this), city ("nearby"),
  /// random (server-side $sample for the home rail; unpaginated, varies/call).
  Future<List<Astrologer>> list({
    String? q, String? expertise, String? language, bool? online, bool? featured,
    int? maxPrice, String? city, bool? random,
    int page = 1, int limit = 20,
  }) async {
    final data = await _api.get('/astrologers', query: {
      'page': page, 'limit': limit,
      if (q != null && q.isNotEmpty) 'q': q,
      if (expertise != null && expertise.isNotEmpty) 'expertise': expertise,
      if (language != null && language.isNotEmpty) 'language': language,
      if (online == true) 'online': 'true',
      if (featured == true) 'featured': 'true',
      if (maxPrice != null) 'maxPrice': maxPrice,
      if (city != null && city.isNotEmpty) 'city': city,
      if (random == true) 'random': 'true',
    });
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? [];
    return raw.map((e) => Astrologer.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Full public profile for one astrologer (GET /astrologers/:id). Served from
  /// the 1-minute in-memory cache when fresh; pass [forceRefresh] to bypass it.
  Future<Astrologer> getPublic(String id, {bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final at = _profileCachedAt[id];
      final hit = _profileCache[id];
      if (hit != null && at != null && DateTime.now().difference(at) < _profileTtl) {
        return hit;
      }
    }
    final data = await _api.get('/astrologers/$id');
    final astro = Astrologer.fromJson(data as Map<String, dynamic>);
    _profileCache[id] = astro;
    _profileCachedAt[id] = DateTime.now();
    return astro;
  }

  /// Drop a cached profile (e.g. after a live status change) so the next read
  /// re-fetches. No-op if not cached.
  void invalidateProfile(String id) {
    _profileCache.remove(id);
    _profileCachedAt.remove(id);
  }

  /// An astrologer's public storefront (theme + approved products/poojas).
  /// GET /astrologers/:id/storefront.
  Future<Storefront> storefront(String profileId) async {
    final data = await _api.get('/astrologers/$profileId/storefront');
    return Storefront.fromJson(Map<String, dynamic>.from(data as Map));
  }

  /// Reviews for an astrologer (GET /astrologers/:id/reviews), newest first.
  Future<List<AstroReview>> reviews(String profileId, {int page = 1, int limit = 20}) async {
    final data = await _api.get('/astrologers/$profileId/reviews', query: {'page': page, 'limit': limit});
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? const [];
    return raw.map((e) => AstroReview.fromJson(e as Map<String, dynamic>)).toList();
  }
}

/// One review on an astrologer's profile.
class AstroReview {
  final String name;
  final int rating; // 1..5
  final String comment;
  const AstroReview({required this.name, required this.rating, required this.comment});
  factory AstroReview.fromJson(Map<String, dynamic> j) {
    final user = j['user'];
    return AstroReview(
      name: (user is Map ? user['name'] : null)?.toString() ?? 'Seeker',
      rating: (j['rating'] as num?)?.toInt() ?? 5,
      comment: (j['comment'] ?? '').toString(),
    );
  }
}

/// One item (product or pooja) on a public storefront.
class StoreItem {
  final String id;
  final String name;
  final String? image;
  final int price;
  final int mrp; // 0 for poojas
  final String subtitle; // duration note (pooja) or '' (product)
  final bool isPooja;
  const StoreItem({required this.id, required this.name, this.image, required this.price, this.mrp = 0, this.subtitle = '', required this.isPooja});

  factory StoreItem.product(Map<String, dynamic> j) => StoreItem(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? '').toString(),
        image: (j['images'] is List && (j['images'] as List).isNotEmpty) ? (j['images'] as List).first.toString() : null,
        price: (j['price'] as num?)?.toInt() ?? 0,
        mrp: (j['mrp'] as num?)?.toInt() ?? 0,
        isPooja: false,
      );
  factory StoreItem.pooja(Map<String, dynamic> j) => StoreItem(
        id: (j['_id'] ?? j['id']).toString(),
        name: (j['name'] ?? '').toString(),
        image: (j['imagePortrait'] ?? j['image'])?.toString(),
        price: (j['basePrice'] as num?)?.toInt() ?? 0,
        subtitle: (j['durationNote'] ?? '').toString(),
        isPooja: true,
      );
}

/// A public astrologer storefront: theme + basic profile + live items.
class Storefront {
  final String theme;
  final Map<String, dynamic>? layoutSpec; // AI-designed layout (overrides `theme` when set)
  final String name;
  final String? avatar;
  final String? coverPhoto;
  final String bio;
  final int followers;
  final double rating;
  final int reviewCount;
  final List<StoreItem> products;
  final List<StoreItem> poojas;
  const Storefront({
    required this.theme, this.layoutSpec, required this.name, this.avatar, this.coverPhoto, this.bio = '',
    this.followers = 0, this.rating = 0, this.reviewCount = 0,
    this.products = const [], this.poojas = const [],
  });

  factory Storefront.fromJson(Map<String, dynamic> j) {
    final p = (j['profile'] is Map) ? Map<String, dynamic>.from(j['profile']) : const {};
    List<StoreItem> prods = ((j['products'] as List?) ?? const [])
        .map((e) => StoreItem.product(Map<String, dynamic>.from(e as Map))).toList();
    List<StoreItem> poojas = ((j['poojas'] as List?) ?? const [])
        .map((e) => StoreItem.pooja(Map<String, dynamic>.from(e as Map))).toList();
    return Storefront(
      theme: (j['theme'] ?? 'rudraksh').toString(),
      layoutSpec: j['layoutSpec'] is Map ? Map<String, dynamic>.from(j['layoutSpec']) : null,
      name: (p['name'] ?? 'Astrologer').toString(),
      avatar: p['avatar']?.toString(),
      coverPhoto: p['coverPhoto']?.toString(),
      bio: (p['bio'] ?? '').toString(),
      followers: (p['followers'] as num?)?.toInt() ?? 0,
      rating: (p['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (p['reviewCount'] as num?)?.toInt() ?? 0,
      products: prods,
      poojas: poojas,
    );
  }
}

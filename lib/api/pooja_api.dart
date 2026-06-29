import 'api_client.dart';

/// A bookable pooja from the admin catalog (GET /poojas/types[/:id]).
class Pooja {
  final String id;
  final String name;
  final String? description;
  final String? image; // legacy single image (fallback)
  final String? imagePortrait; // 3:4 — used in list cards
  final String? imageLandscape; // 16:9 — used on detail header
  final int basePrice; // whole rupees
  final int maxPersons; // 0 = not specified
  final int duration; // value; unit in [durationUnit]
  final String durationUnit; // 'min' | 'hr'
  final String? categoryId;
  final String? categoryName;
  // Optional admin-set availability window (null when not scheduled).
  final DateTime? availableFrom;
  final DateTime? availableTo;
  // Display social proof (real once it crosses the threshold, else admin seed).
  final int booked;
  final double rating;
  final int reviewCount;

  const Pooja({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.imagePortrait,
    this.imageLandscape,
    this.basePrice = 0,
    this.maxPersons = 0,
    this.duration = 0,
    this.durationUnit = 'min',
    this.categoryId,
    this.categoryName,
    this.availableFrom,
    this.availableTo,
    this.booked = 0,
    this.rating = 0,
    this.reviewCount = 0,
  });

  /// "1.2k booked" / "320 booked" / '' when none.
  String get bookedLabel {
    if (booked <= 0) return '';
    final n = booked >= 1000 ? '${(booked / 1000).toStringAsFixed(1)}k' : '$booked';
    return '$n booked';
  }

  /// Human duration, e.g. "90 min" / "2 hr"; falls back to legacy durationNote.
  String get durationLabel {
    if (duration > 0) return '$duration ${durationUnit == 'hr' ? 'hr' : 'min'}';
    return '';
  }

  /// Display price — "Free" when there's no charge, else "₹N".
  String get priceLabel => basePrice <= 0 ? 'Free' : '₹$basePrice';
  bool get isFree => basePrice <= 0;

  String? _firstNonEmpty(List<String?> xs) {
    for (final x in xs) { if (x != null && x.isNotEmpty) return x; }
    return null;
  }
  /// List cards prefer portrait; fall back to landscape, then legacy.
  String? get listImage => _firstNonEmpty([imagePortrait, imageLandscape, image]);
  /// Detail header prefers landscape; fall back to portrait, then legacy.
  String? get detailImage => _firstNonEmpty([imageLandscape, imagePortrait, image]);

  static const _months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  static String _d(DateTime d) => '${d.day} ${_months[d.month]}';

  /// Short availability label, only when the admin set a window. Examples:
  ///   "Available 1 Jul – 18 Jul"  /  "From 1 Jul"  /  "Until 18 Jul"  /  ''
  String get availabilityLabel {
    if (availableFrom != null && availableTo != null) return 'Available ${_d(availableFrom!)} – ${_d(availableTo!)}';
    if (availableFrom != null) return 'From ${_d(availableFrom!)}';
    if (availableTo != null) return 'Until ${_d(availableTo!)}';
    return '';
  }

  factory Pooja.fromJson(Map<String, dynamic> j) {
    final cat = j['category'];
    return Pooja(
      id: (j['_id'] ?? j['id']).toString(),
      name: (j['name'] ?? '').toString(),
      description: j['description']?.toString(),
      image: j['image']?.toString(),
      imagePortrait: j['imagePortrait']?.toString(),
      imageLandscape: j['imageLandscape']?.toString(),
      basePrice: (j['basePrice'] as num?)?.toInt() ?? 0,
      maxPersons: (j['maxPersons'] as num?)?.toInt() ?? 0,
      duration: (j['duration'] as num?)?.toInt() ?? 0,
      durationUnit: (j['durationUnit'] ?? 'min').toString(),
      categoryId: cat is Map ? (cat['_id']?.toString()) : cat?.toString(),
      categoryName: cat is Map ? (cat['name']?.toString()) : null,
      availableFrom: j['availableFrom'] != null ? DateTime.tryParse(j['availableFrom'].toString())?.toLocal() : null,
      availableTo: j['availableTo'] != null ? DateTime.tryParse(j['availableTo'].toString())?.toLocal() : null,
      booked: (j['displayBooked'] as num?)?.toInt() ?? (j['bookedCount'] as num?)?.toInt() ?? 0,
      rating: (j['displayRating'] as num?)?.toDouble() ?? (j['manualRating'] as num?)?.toDouble() ?? 0,
      reviewCount: (j['displayReviewCount'] as num?)?.toInt() ?? (j['manualReviewCount'] as num?)?.toInt() ?? 0,
    );
  }
}

/// A pooja category (GET /poojas/categories) — drives the filter chips.
class PoojaCategory {
  final String id;
  final String name;
  const PoojaCategory({required this.id, required this.name});
  factory PoojaCategory.fromJson(Map<String, dynamic> j) =>
      PoojaCategory(id: (j['_id'] ?? j['id']).toString(), name: (j['name'] ?? '').toString());
}

/// Result of creating a booking: the booking + a PayU payment request to launch.
class BookingResult {
  final Map<String, dynamic> booking;
  final Map<String, dynamic>? payment;
  const BookingResult({required this.booking, this.payment});
}

/// Pooja catalog + booking endpoints.
class PoojaApi {
  final ApiClient _api;
  PoojaApi(this._api);

  Future<List<PoojaCategory>> categories() async {
    final data = await _api.get('/poojas/categories');
    return (data as List).map((e) => PoojaCategory.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Every available pooja (dedicated "All" feed; no category/search/price filter).
  Future<List<Pooja>> all() async {
    final data = await _api.get('/poojas/all');
    return (data as List).map((e) => Pooja.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// List poojas with optional server-side filters.
  ///   q          name search
  ///   categoryId restrict to one category
  ///   maxPersons poojas allowing AT LEAST this many people
  ///   maxPrice   budget ceiling
  Future<List<Pooja>> types({String? q, String? categoryId, int? maxPersons, int? maxPrice}) async {
    final query = <String, dynamic>{
      if (q != null && q.isNotEmpty) 'q': q,
      if (categoryId != null && categoryId.isNotEmpty) 'category': categoryId,
      if (maxPersons != null && maxPersons > 0) 'maxPersons': maxPersons,
      if (maxPrice != null) 'maxPrice': maxPrice,
    };
    final data = await _api.get('/poojas/types', query: query);
    return (data as List).map((e) => Pooja.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Pooja> type(String id) async {
    final data = await _api.get('/poojas/types/$id');
    return Pooja.fromJson(data as Map<String, dynamic>);
  }

  /// Create a booking. Server resolves price + validates familyMembers against
  /// the pooja's maxPersons. Returns the booking + PayU payment payload.
  Future<BookingResult> book({
    required String poojaTypeId,
    required String contactName,
    required String contactPhone,
    List<String> familyMembers = const [],
    DateTime? preferredDate,
    String? specialInstructions,
  }) async {
    final data = await _api.post('/poojas/bookings', body: {
      'poojaTypeId': poojaTypeId,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'familyMembers': familyMembers,
      if (preferredDate != null) 'preferredDate': preferredDate.toIso8601String(),
      if (specialInstructions != null && specialInstructions.isNotEmpty) 'specialInstructions': specialInstructions,
    });
    final map = data as Map<String, dynamic>;
    return BookingResult(
      booking: (map['booking'] as Map<String, dynamic>?) ?? {},
      payment: map['payment'] as Map<String, dynamic>?,
    );
  }
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';

/// A recharge pack (GET /wallet/recharge-templates).
class RechargePack {
  final String id;
  final int amount; // ₹ the user pays
  final int tokens; // value credited (tokens >= amount = bonus)
  final String? name;
  final String? badge;
  final List<String> benefits;
  const RechargePack({required this.id, required this.amount, required this.tokens, this.name, this.badge, this.benefits = const []});

  int get bonus => tokens - amount;

  factory RechargePack.fromJson(Map<String, dynamic> j) => RechargePack(
        id: (j['_id'] ?? j['id']).toString(),
        amount: (j['amount'] as num?)?.toInt() ?? 0,
        tokens: (j['tokens'] as num?)?.toInt() ?? 0,
        name: j['name']?.toString(),
        badge: j['badge']?.toString(),
        benefits: (j['benefits'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'id': id, 'amount': amount, 'tokens': tokens, 'name': name, 'badge': badge, 'benefits': benefits,
      };
}

class WalletTxn {
  final String id;
  final String type; // credit | debit
  final String source;
  final int amount;
  final String? description;
  final DateTime? createdAt;
  /// Consultation rows only: billed minutes and the per-minute rate, so the
  /// list can show "2 min · ₹50/min" under the title.
  final int? minutes;
  final int? ratePerMin;
  const WalletTxn({
    required this.id,
    required this.type,
    required this.source,
    required this.amount,
    this.description,
    this.createdAt,
    this.minutes,
    this.ratePerMin,
  });
  bool get isCredit => type == 'credit';

  /// "2 min · ₹50/min" — null when this isn't a per-minute consultation row.
  String? get rateDetail {
    if (minutes == null || ratePerMin == null || minutes! < 1 || ratePerMin! < 1) return null;
    return '$minutes min · ₹$ratePerMin/min';
  }

  factory WalletTxn.fromJson(Map<String, dynamic> j) {
    final meta = (j['meta'] is Map) ? Map<String, dynamic>.from(j['meta'] as Map) : const {};
    return WalletTxn(
      id: (j['_id'] ?? j['id']).toString(),
      type: (j['type'] ?? '').toString(),
      source: (j['source'] ?? '').toString(),
      amount: (j['amount'] as num?)?.toInt() ?? 0,
      description: j['description']?.toString(),
      createdAt: j['createdAt'] != null ? DateTime.tryParse(j['createdAt'].toString())?.toLocal() : null,
      minutes: (meta['minutes'] as num?)?.toInt(),
      ratePerMin: (meta['ratePerMin'] as num?)?.toInt(),
    );
  }
}

/// Wallet: balance, recharge packs, transactions, and starting a PayU recharge.
class WalletApi {
  final ApiClient _api;
  WalletApi(this._api);

  /// Host the API client is currently reaching (primary or sslip fallback) — used
  /// to build the PayU WebView URL so it loads even when the primary host's DNS
  /// is down and REST has already fallen back.
  String get activeHost => _api.activeHost;

  /// Current wallet balance (whole rupees).
  Future<int> balance() async {
    final data = await _api.get('/wallet/balance');
    return ((data as Map)['balance'] as num?)?.toInt() ?? 0;
  }

  static const _packsCacheKey = 'rg_recharge_packs_v1';

  /// Cached recharge packs from the last successful fetch (instant, may be stale
  /// or empty on first run). Use with [packs] for cache-then-revalidate.
  Future<List<RechargePack>> cachedPacks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final s = prefs.getString(_packsCacheKey);
      if (s == null || s.isEmpty) return [];
      return (jsonDecode(s) as List).map((e) => RechargePack.fromJson(Map<String, dynamic>.from(e))).toList();
    } catch (_) { return []; }
  }

  /// Fetch the live recharge packs (admin-managed) and persist them to cache.
  Future<List<RechargePack>> packs() async {
    final data = await _api.get('/wallet/recharge-templates');
    final list = (data as List).map((e) => RechargePack.fromJson(e as Map<String, dynamic>)).toList();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_packsCacheKey, jsonEncode(list.map((p) => p.toJson()).toList()));
    } catch (_) {/* best-effort cache */}
    return list;
  }

  Future<List<WalletTxn>> transactions({int page = 1, int limit = 50, String? source, int? days}) async {
    final data = await _api.get('/wallet/transactions', query: {
      'page': page, 'limit': limit,
      if (source != null && source.isNotEmpty) 'source': source,
      if (days != null && days > 0) 'days': days,
    });
    final raw = (data is Map ? (data['items'] as List?) : (data as List?)) ?? [];
    return raw.map((e) => WalletTxn.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Tax invoice for one of my recharge transactions.
  ///
  /// Returns the hosted PDF URL, or null when the document is still being
  /// rendered (the backend queues the render, so a just-completed recharge can
  /// be `pdfStatus: 'pending'` for a moment). The backend backfills an invoice
  /// for older recharges on first request, so this works retroactively.
  Future<String?> rechargeInvoiceUrl(String txnId) async {
    final data = await _api.get('/wallet/transactions/$txnId/invoice');
    final inv = (data is Map ? data['invoice'] : null) as Map?;
    final url = inv?['pdfUrl']?.toString();
    return (url == null || url.isEmpty) ? null : url;
  }

  /// Start a recharge → returns the txnid used to open the PayU checkout page.
  Future<String> initiateRecharge(int amountRupees) async {
    final data = await _api.post('/wallet/recharge/initiate', body: {'amountRupees': amountRupees});
    return ((data as Map)['txnid'] ?? '').toString();
  }
}

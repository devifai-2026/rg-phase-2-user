import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Thin wrapper around Google Analytics for Firebase. One instance app-wide.
///
/// Events flow to the Firebase/GA4 dashboard (project: astro-phase-2). Screen
/// views are tracked automatically via [observer]; call the typed helpers at
/// key user actions. All calls are best-effort — analytics never throws into
/// the app.
class Analytics {
  Analytics._();
  static final Analytics instance = Analytics._();

  final FirebaseAnalytics _fa = FirebaseAnalytics.instance;

  /// Attach to MaterialApp.navigatorObservers for automatic `screen_view`.
  FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: _fa);

  /// Tag the signed-in user (and clear on logout with userId: null).
  Future<void> setUser(String? userId) async {
    try {
      await _fa.setUserId(id: userId);
    } catch (e) { _warn('setUser', e); }
  }

  /// A custom property segment-able in GA (e.g. role: user/astrologer).
  Future<void> setProp(String name, String? value) async {
    try {
      await _fa.setUserProperty(name: name, value: value);
    } catch (e) { _warn('setProp', e); }
  }

  /// Generic event. `params` values must be String or num (GA constraint).
  Future<void> log(String name, [Map<String, Object?>? params]) async {
    try {
      final clean = <String, Object>{};
      params?.forEach((k, v) { if (v != null) clean[k] = v is num ? v : v.toString(); });
      await _fa.logEvent(name: name, parameters: clean.isEmpty ? null : clean);
    } catch (e) { _warn(name, e); }
  }

  // ── Typed helpers for the core funnel (GA recommended event names) ──
  Future<void> login(String method) => _fa.logLogin(loginMethod: method);
  Future<void> signUp(String method) => _fa.logSignUp(signUpMethod: method);

  Future<void> viewProduct(String id, String name, num price) =>
      log('view_item', {'item_id': id, 'item_name': name, 'price': price});

  Future<void> addToCart(String id, String name, num price, int qty) =>
      log('add_to_cart', {'item_id': id, 'item_name': name, 'price': price, 'quantity': qty});

  Future<void> beginCheckout(num value, int items) =>
      log('begin_checkout', {'value': value, 'currency': 'INR', 'items': items});

  Future<void> purchase(String orderId, num value) =>
      log('purchase', {'transaction_id': orderId, 'value': value, 'currency': 'INR'});

  Future<void> viewAstrologer(String id, String name) =>
      log('view_astrologer', {'astrologer_id': id, 'astrologer_name': name});

  Future<void> startConsult(String astrologerId, String type) =>
      log('start_consult', {'astrologer_id': astrologerId, 'consult_type': type});

  Future<void> walletRecharge(num amount) =>
      log('wallet_recharge', {'value': amount, 'currency': 'INR'});

  Future<void> bookPooja(String poojaId, String name, num price) =>
      log('book_pooja', {'pooja_id': poojaId, 'pooja_name': name, 'price': price});

  Future<void> share(String contentType, String id) =>
      log('share', {'content_type': contentType, 'item_id': id});

  void _warn(String where, Object e) {
    if (kDebugMode) debugPrint('[analytics] $where failed: $e');
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';

/// Fetches the admin-driven app configuration (theme tokens, splash, promo +
/// pooja banners, videos, lessons, section toggles) from `GET /app-config`.
///
/// The raw payload is cached to SharedPreferences so the app can build the theme
/// and splash from the LAST known config before the first frame — even offline.
/// Everything here is a soft override: the app's compiled tokens/screens are the
/// fallback whenever a field is missing or the fetch fails.
class AppConfigService extends ChangeNotifier {
  static const _cacheKey = 'rg_app_config_v1';
  final ApiClient _api;
  AppConfigService(this._api);

  Map<String, dynamic> _cfg = {};
  Map<String, dynamic> get raw => _cfg;

  /// The tenant's brand name (from admin/branding). Shown as the app title and
  /// wherever the brand name appears in UI. Falls back to a neutral default so a
  /// build with no config never shows another tenant's name.
  String get appName {
    final n = _cfg['appName'];
    return (n is String && n.trim().isNotEmpty) ? n.trim() : 'Astro App';
  }

  /// Tenant brand logo URL (uploaded by the PO). Null when unset — callers then
  /// fall back to the initials monogram.
  String? get logoUrl {
    final u = _cfg['logoUrl'];
    return (u is String && u.trim().isNotEmpty) ? u.trim() : null;
  }

  /// Tenant tagline (server already localizes it to the requester's language).
  /// Empty when unset — callers can fall back to the static localized tagline.
  String get tagline {
    final t = _cfg['tagline'];
    return (t is String) ? t.trim() : '';
  }

  /// True once we have a real config (from cache or a successful fetch) — used by
  /// the splash to decide loader vs. content vs. fallback.
  bool get hasConfig => _cfg.isNotEmpty && _cfg['appName'] != null;

  // ── Section toggles (default everything visible) ──
  bool _section(String k) => (_cfg['sections']?[k] ?? true) == true;
  bool get showBanners => _section('banners');
  bool get showVideos => _section('videos');
  bool get showLessons => _section('lessons');
  bool get showPooja => _section('pooja');
  bool get showNearby => _section('nearby');
  bool get showFeatured => _section('featured');

  // ── Theme tokens (per-mode hex maps; empty → app uses compiled tokens) ──
  Map<String, dynamic>? get _theme => _cfg['theme'] is Map ? Map<String, dynamic>.from(_cfg['theme']) : null;
  bool get themeEnabled => (_theme?['enabled'] ?? false) == true;
  Map<String, dynamic>? themeTokens(bool dark) {
    if (!themeEnabled) return null;
    final m = _theme?[dark ? 'dark' : 'light'];
    return m is Map ? Map<String, dynamic>.from(m) : null;
  }

  // ── Splash ──
  Map<String, dynamic> get splash => _cfg['splash'] is Map ? Map<String, dynamic>.from(_cfg['splash']) : {};
  String? splashImage(bool dark) {
    final s = splash;
    final variant = dark ? s['imageDark'] : s['imageLight'];
    final img = (variant is String && variant.isNotEmpty) ? variant : s['image'];
    return (img is String && img.isNotEmpty) ? img : null;
  }

  // ── Content lists ──
  List<Map<String, dynamic>> _list(String k) =>
      (_cfg[k] is List) ? (_cfg[k] as List).map((e) => Map<String, dynamic>.from(e)).toList() : [];
  List<Map<String, dynamic>> get banners => _list('banners');
  List<Map<String, dynamic>> get poojaBanners => _list('poojaBanners');
  List<Map<String, dynamic>> get videos => _list('videos');
  List<Map<String, dynamic>> get lessons => _list('lessons');

  /// Load the cached config synchronously-ish (await once) before first frame.
  Future<void> loadCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final s = prefs.getString(_cacheKey);
      if (s != null && s.isNotEmpty) {
        _cfg = Map<String, dynamic>.from(jsonDecode(s));
        notifyListeners();
      }
    } catch (_) {/* ignore corrupt cache */}
  }

  /// Refresh from the server and persist. Safe to call after launch; failures
  /// keep the cached/compiled values.
  Future<void> refresh() async {
    try {
      final data = await _api.get('/app-config');
      if (data is Map) {
        _cfg = Map<String, dynamic>.from(data);
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_cacheKey, jsonEncode(_cfg));
      }
    } catch (_) {/* keep cache; this is best-effort */}
  }
}

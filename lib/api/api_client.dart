import 'dart:async';
import 'package:dio/dio.dart';

import 'api_config.dart';
import 'token_store.dart';

/// Thrown for any non-success response. `message` is backend-friendly,
/// `errors` holds field-level validation messages (422).
class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final List<String> errors;
  ApiException(this.message, {this.statusCode, this.errors = const []});
  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// One Dio instance for the whole app. Adds the Bearer token, unwraps the
/// `{ success, data }` envelope, and transparently refreshes the access token
/// on a 401 (then retries the original request once).
class ApiClient {
  final Dio dio;
  final TokenStore tokens;

  /// Called when refresh fails (session truly dead) so the app can log out.
  void Function()? onSessionExpired;

  /// The user's current UI language (e.g. 'hi'). Sent as the `x-lang` header on
  /// every request so the backend localizes dynamic content (astrologer bios,
  /// product/pooja names, AI text) to this language — independent of whatever is
  /// saved on the user profile. SettingsProvider keeps this in sync with the
  /// chosen locale. Defaults to 'en'.
  String langCode = 'en';

  ApiClient(this.tokens)
      : dio = Dio(BaseOptions(
          baseUrl: ApiConfig.apiBase,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 20),
          // We handle non-2xx ourselves so we can read the error envelope.
          validateStatus: (s) => s != null && s < 500,
          headers: {
            'Content-Type': 'application/json',
            // Multi-tenant routing: identifies this build's tenant to the
            // backend. Only sent when the build was stamped with a TENANT slug
            // (single-tenant/dev builds omit it → backend uses default tenant).
            if (ApiConfig.tenant.isNotEmpty) 'X-Tenant': ApiConfig.tenant,
          },
        )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final t = tokens.accessToken;
        if (t != null && t.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $t';
        }
        // Tell the backend which language to return dynamic content in.
        options.headers['x-lang'] = langCode;
        handler.next(options);
      },
    ));
  }

  // Once the primary host has failed to connect (DNS/connection error) and the
  // fallback worked, stick to the fallback for the rest of the session so we
  // don't pay the primary's timeout on every subsequent call.
  bool _useFallback = false;

  // ── Public verbs (return the unwrapped `data`) ──
  // The runner receives a `url` (either the relative path against the primary
  // baseUrl, or an ABSOLUTE fallback URL). Dio treats an absolute URL as
  // overriding the configured baseUrl, which is how we retry on the fallback host.
  Future<dynamic> get(String path, {Map<String, dynamic>? query}) =>
      _send((url) => dio.get(url, queryParameters: query), path, 'GET');

  Future<dynamic> post(String path, {Object? body}) =>
      _send((url) => dio.post(url, data: body), path, 'POST');

  Future<dynamic> put(String path, {Object? body}) =>
      _send((url) => dio.put(url, data: body), path, 'PUT');

  Future<dynamic> patch(String path, {Object? body}) =>
      _send((url) => dio.patch(url, data: body), path, 'PATCH');

  Future<dynamic> delete(String path, {Object? body}) =>
      _send((url) => dio.delete(url, data: body), path, 'DELETE');

  /// The request URL for a path: the ABSOLUTE fallback URL when on the fallback
  /// host, else the relative path (resolved against the primary baseUrl).
  String _url(String path, bool fallback) =>
      fallback ? '${ApiConfig.fallbackApiBase}$path' : path;

  // ── Core: run request, refresh-and-retry on 401, unwrap envelope ──
  // `run(base)` performs the HTTP call with an optional baseUrl override, so we
  // can transparently retry against the fallback host on a connection failure.
  Future<dynamic> _send(Future<Response> Function(String url) run, String path, String method) async {
    Response res;
    try {
      res = await run(_url(path, _useFallback));
    } on DioException catch (e) {
      final isConn = e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout;
      // Primary host unreachable (usually the primary domain's DNS is briefly
      // unresolvable on this network) → retry ONCE against the deterministic
      // sslip.io fallback, then stick to it for the rest of the session.
      if (isConn && ApiConfig.hasFallback && !_useFallback) {
        try {
          res = await run(_url(path, true));
          _useFallback = true; // fallback worked — keep using it this session
        } on DioException {
          throw ApiException('No connection', statusCode: null);
        }
      } else if (isConn) {
        throw ApiException('No connection', statusCode: null);
      } else {
        throw ApiException(e.message ?? 'Request failed');
      }
    }

    // Access token expired → try a single refresh, then replay ONCE.
    // 401 = expired/invalid token (refresh fixes it). 403 may be an expired
    // token on some endpoints too, so we attempt the same refresh+retry — but
    // strictly once: if the replay still returns 403 it's a real permission/
    // block error (refresh can't help), and we surface it via _unwrap below.
    final authStatus = res.statusCode == 401 || res.statusCode == 403;
    if (authStatus && tokens.hasSession && !path.contains('/auth/refresh')) {
      final refreshed = await _refresh();
      if (refreshed) {
        try {
          res = await run(_url(path, _useFallback)); // single replay with the fresh token
        } on DioException catch (e) {
          throw ApiException(e.message ?? 'Request failed');
        }
      } else if (res.statusCode == 401) {
        // Couldn't refresh and the token is invalid → session is dead.
        onSessionExpired?.call();
        throw ApiException('Session expired', statusCode: 401);
      }
      // 403 with no refresh available falls through to _unwrap as a real error.
    }

    return _unwrap(res);
  }

  dynamic _unwrap(Response res) {
    final data = res.data;
    final ok = res.statusCode != null && res.statusCode! >= 200 && res.statusCode! < 300;
    if (data is Map && data['success'] == true) return data['data'];
    // Error envelope.
    final msg = (data is Map ? data['message'] : null)?.toString() ?? 'Request failed';
    final errs = (data is Map && data['errors'] is List)
        ? (data['errors'] as List).map((e) => e.toString()).toList()
        : <String>[];
    throw ApiException(ok ? 'Unexpected response' : msg, statusCode: res.statusCode, errors: errs);
  }

  // Single-flight refresh: concurrent 401s share one refresh call.
  Future<bool>? _refreshing;
  Future<bool> _refresh() {
    return _refreshing ??= _doRefresh().whenComplete(() => _refreshing = null);
  }

  Future<bool> _doRefresh() async {
    final rt = tokens.refreshToken;
    if (rt == null || rt.isEmpty) return false;
    try {
      final res = await dio.post(_url('/auth/refresh', _useFallback), data: {'refreshToken': rt});
      if (res.data is Map && res.data['success'] == true) {
        final d = res.data['data'] as Map;
        await tokens.save(
          access: d['accessToken'] as String,
          refresh: (d['refreshToken'] ?? rt) as String,
        );
        return true;
      }
    } catch (_) {/* fall through */}
    return false;
  }
}

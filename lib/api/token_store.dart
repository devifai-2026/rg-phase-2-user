import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persists the access + refresh token pair in the platform secure storage
/// (Keychain / Keystore). Kept tiny and synchronous-feeling via an in-memory
/// cache so the Dio interceptor can read the access token without awaiting.
class TokenStore {
  static const _kAccess = 'rg_access';
  static const _kRefresh = 'rg_refresh';

  final FlutterSecureStorage _storage;
  TokenStore([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  String? _access;
  String? _refresh;

  String? get accessToken => _access;
  String? get refreshToken => _refresh;
  bool get hasSession => (_refresh != null && _refresh!.isNotEmpty);

  /// Load tokens from disk into the in-memory cache (call once at startup).
  Future<void> load() async {
    _access = await _storage.read(key: _kAccess);
    _refresh = await _storage.read(key: _kRefresh);
  }

  Future<void> save({required String access, required String refresh}) async {
    _access = access;
    _refresh = refresh;
    await _storage.write(key: _kAccess, value: access);
    await _storage.write(key: _kRefresh, value: refresh);
  }

  Future<void> updateAccess(String access) async {
    _access = access;
    await _storage.write(key: _kAccess, value: access);
  }

  Future<void> clear() async {
    _access = null;
    _refresh = null;
    await _storage.delete(key: _kAccess);
    await _storage.delete(key: _kRefresh);
  }
}

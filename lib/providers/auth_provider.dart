import 'package:flutter/foundation.dart';

import '../api/api_client.dart';
import '../api/auth_api.dart';
import '../api/token_store.dart';
import '../models/app_user.dart';

enum AuthStatus { unknown, loggedOut, loggedIn }

/// Owns the auth lifecycle: bootstrap (restore session), OTP request/verify,
/// profile update, and logout. Screens watch `status` + `user`.
class AuthProvider extends ChangeNotifier {
  final ApiClient _api;
  final AuthApi _auth;
  final TokenStore _tokens;

  /// Called with the user's stored language whenever we load/refresh the user,
  /// so SettingsProvider can apply it app-wide (DB is the source of truth once
  /// logged in).
  void Function(String languageCode)? onUserLanguage;

  /// Fired when a session becomes active (verify/bootstrap) and when it ends —
  /// used to connect/disconnect the realtime socket.
  void Function()? onLoggedIn;
  void Function()? onLoggedOut;

  AuthProvider(this._api, this._auth, this._tokens) {
    _api.onSessionExpired = () {
      _user = null;
      _status = AuthStatus.loggedOut;
      _tokens.clear();
      onLoggedOut?.call();
      notifyListeners();
    };
  }

  AuthStatus _status = AuthStatus.unknown;
  AppUser? _user;
  bool _busy = false;
  bool _wasNewUser = false;
  int _signupBonus = 0; // bonus credited on the just-completed signup (0 = none)

  AuthStatus get status => _status;
  AppUser? get user => _user;
  bool get busy => _busy;
  bool get wasNewUser => _wasNewUser;
  /// Signup bonus credited on this signup (0 if none) — the app shows the
  /// welcome-bonus celebration only when this is > 0. Cleared after it's shown.
  int get signupBonus => _signupBonus;
  void clearSignupBonus() => _signupBonus = 0;

  void _applyUser(AppUser u) {
    _user = u;
    if (u.language.isNotEmpty) onUserLanguage?.call(u.language);
  }

  /// Cold start: if we have a refresh token, try to load the profile.
  Future<void> bootstrap() async {
    await _tokens.load();
    if (!_tokens.hasSession) {
      _status = AuthStatus.loggedOut;
      notifyListeners();
      return;
    }
    try {
      _applyUser(await _auth.me());
      _status = AuthStatus.loggedIn;
      onLoggedIn?.call();
    } catch (_) {
      await _tokens.clear();
      _status = AuthStatus.loggedOut;
    }
    notifyListeners();
  }

  Future<void> requestOtp(String phone10) async {
    _setBusy(true);
    try {
      await _auth.requestOtp(phone10);
    } finally {
      _setBusy(false);
    }
  }

  /// Returns the verified user on success (throws ApiException otherwise).
  Future<AppUser> verifyOtp(String phone10, String code) async {
    _setBusy(true);
    try {
      final res = await _auth.verifyOtp(phone10, code);
      _wasNewUser = res.isNewUser;
      _signupBonus = res.signupBonus;
      _applyUser(res.user);
      _status = AuthStatus.loggedIn;
      onLoggedIn?.call(); // auto-connect socket
      notifyListeners();
      return res.user;
    } finally {
      _setBusy(false);
    }
  }

  /// Patch profile fields via PUT /auth/me; updates the in-memory user.
  Future<AppUser> updateProfile(Map<String, dynamic> body) async {
    final updated = await _auth.updateProfile(body);
    _applyUser(updated);
    notifyListeners();
    return updated;
  }

  Future<void> logout() async {
    await _auth.logout();
    _user = null;
    _status = AuthStatus.loggedOut;
    onLoggedOut?.call();
    notifyListeners();
  }

  void _setBusy(bool v) {
    _busy = v;
    notifyListeners();
  }
}

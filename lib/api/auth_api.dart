import '../models/app_user.dart';
import 'api_client.dart';
import 'token_store.dart';

/// Result of a successful OTP verification.
class AuthResult {
  final AppUser user;
  final bool isNewUser;
  /// Signup bonus actually credited on this verification (0 if none) — drives
  /// the one-time welcome celebration modal. Only > 0 when a bonus was credited.
  final int signupBonus;
  AuthResult(this.user, this.isNewUser, {this.signupBonus = 0});
}

/// Wraps the /auth/* endpoints (see FLUTTER_API.md §2–4).
class AuthApi {
  final ApiClient _api;
  final TokenStore _tokens;
  AuthApi(this._api, this._tokens);

  /// Send an OTP to a raw 10-digit number (backend normalises to 91+10).
  Future<void> requestOtp(String phone10) async {
    await _api.post('/auth/request-otp', body: {'phone': phone10});
  }

  /// Verify the code; on success persists the token pair and returns the user.
  Future<AuthResult> verifyOtp(String phone10, String code) async {
    final data = await _api.post('/auth/verify-otp', body: {'phone': phone10, 'code': code});
    final map = data as Map<String, dynamic>;
    await _tokens.save(
      access: map['accessToken'] as String,
      refresh: map['refreshToken'] as String,
    );
    return AuthResult(
      AppUser.fromJson(map['user'] as Map<String, dynamic>),
      map['isNewUser'] == true,
      signupBonus: (map['signupBonus'] as num?)?.toInt() ?? 0,
    );
  }

  /// Fetch the current user (used on cold start when a session exists).
  Future<AppUser> me() async {
    final data = await _api.get('/auth/me');
    return AppUser.fromJson(data as Map<String, dynamic>);
  }

  /// Patch profile fields (name, gender, language, avatar, birthDetails, …).
  /// Returns the updated user.
  Future<AppUser> updateProfile(Map<String, dynamic> body) async {
    final data = await _api.put('/auth/me', body: body);
    return AppUser.fromJson(data as Map<String, dynamic>);
  }

  /// Register/refresh this device's push token, along with its identity
  /// (deviceId/name/model/OS) so the backend can track multi-device logins and
  /// show them in the admin console.
  Future<void> registerFcmToken(
    String token, {
    String platform = 'android',
    Map<String, String> device = const {},
  }) async {
    await _api.post('/auth/fcm-token', body: {
      'token': token,
      'platform': platform,
      ...device, // deviceId, deviceName, deviceModel, osVersion (all optional)
    });
  }

  /// Remove this device's push token (called on logout so a logged-out device
  /// stops receiving the previous user's pushes).
  Future<void> removeFcmToken(String token) async {
    await _api.delete('/auth/fcm-token', body: {'token': token});
  }

  /// Attribute a notification tap to its broadcast (drives the admin "taps"
  /// count). Best-effort — failures are ignored.
  Future<void> recordNotificationClick(String broadcastId) async {
    await _api.post('/notifications/click', body: {'broadcastId': broadcastId});
  }

  /// Revoke the refresh token server-side, then clear local storage.
  Future<void> logout() async {
    final rt = _tokens.refreshToken;
    try {
      if (rt != null) await _api.post('/auth/logout', body: {'refreshToken': rt});
    } catch (_) {/* clear locally regardless */}
    await _tokens.clear();
  }
}

import 'dart:io';
import 'package:dio/dio.dart';

import 'api_client.dart';

/// Result of a follow toggle / follow-state read: am I following + the public
/// follower count.
class FollowState {
  final bool following;
  final int followers;
  const FollowState({required this.following, required this.followers});
  factory FollowState.fromJson(dynamic j) {
    final m = (j is Map) ? j : const {};
    return FollowState(
      following: m['following'] == true,
      followers: (m['followers'] as num?)?.toInt() ?? 0,
    );
  }
}

/// A place-of-birth suggestion from the backend geo proxy (free Nominatim).
class PlaceSuggestion {
  final String name;
  final double? lat;
  final double? lng;
  const PlaceSuggestion({required this.name, this.lat, this.lng});
  factory PlaceSuggestion.fromJson(Map<String, dynamic> j) => PlaceSuggestion(
        name: (j['name'] ?? '').toString(),
        lat: (j['lat'] as num?)?.toDouble(),
        lng: (j['lng'] as num?)?.toDouble(),
      );
}

/// Image upload + place autocomplete used during onboarding.
class ProfileApi {
  final ApiClient _api;
  ProfileApi(this._api);

  /// Upload a profile photo (multipart field "image") → hosted URL (GCS).
  Future<String> uploadImage(File file) async {
    final form = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    });
    final data = await _api.post('/users/upload', body: form);
    return (data as Map<String, dynamic>)['url'] as String;
  }

  /// Place-of-birth autocomplete (>=2 chars). Returns [] on no match / failure.
  Future<List<PlaceSuggestion>> searchPlaces(String query) async {
    if (query.trim().length < 2) return [];
    final data = await _api.get('/geo/places', query: {'q': query.trim()});
    final list = (data as List?) ?? [];
    return list.map((e) => PlaceSuggestion.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Ask to be notified when a busy/offline astrologer is available.
  /// profileId = AstrologerProfile id; service = call|chat|video.
  /// Returns true if a pending request already existed (idempotent).
  Future<bool> notifyWhenAvailable(String profileId, String service) async {
    final data = await _api.post('/astrologers/$profileId/notify-me', body: {'service': service});
    return (data is Map && data['alreadyRequested'] == true);
  }

  /// Services the current user already has a PENDING notify-me on, for this
  /// astrologer — used to restore the "you'll be notified" state on screen open.
  /// Returns [] on failure (best-effort).
  Future<Set<String>> myNotifyRequests(String profileId) async {
    try {
      final data = await _api.get('/astrologers/$profileId/notify-me');
      final list = (data is Map ? data['services'] as List? : null) ?? const [];
      return list.map((e) => e.toString()).toSet();
    } catch (_) {
      return <String>{};
    }
  }

  /// Follow / unfollow an astrologer (unfollow can carry an optional reason).
  /// Returns the resulting {following, followers} so the UI stays in sync.
  Future<FollowState> setFollow(String profileId, {required bool follow, String? reason}) async {
    final data = await _api.post('/astrologers/$profileId/follow',
        body: {'follow': follow, if (reason != null && reason.isNotEmpty) 'reason': reason});
    return FollowState.fromJson(data);
  }

  /// Current user's follow state + the astrologer's follower count, to restore
  /// the Follow/Unfollow button on profile open. Returns null on failure.
  Future<FollowState?> myFollow(String profileId) async {
    try {
      final data = await _api.get('/astrologers/$profileId/follow');
      return FollowState.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  /// Save astrology preferences (chart style, month, theme, language, ayanamsa).
  Future<void> savePreferences(Map<String, dynamic> prefs) async {
    await _api.put('/auth/me', body: {'preferences': prefs});
  }

  /// Save notification settings (frequency + topics).
  Future<void> saveNotificationSettings({required String frequency, required List<String> topics}) async {
    await _api.put('/auth/me', body: {'notificationSettings': {'frequency': frequency, 'topics': topics}});
  }

  /// Submit feedback form.
  Future<void> submitFeedback({String? fullName, String? email, String? phone, required String message}) async {
    await _api.post('/feedback', body: {'fullName': fullName, 'email': email, 'phone': phone, 'message': message});
  }

  /// Rate the app (stars + optional review).
  Future<void> rateApp({required int rating, String? review}) async {
    await _api.post('/feedback/rate', body: {'rating': rating, if (review != null) 'review': review});
  }

  /// Astrologer registration (reuses the public apply endpoint).
  Future<void> applyAsAstrologer({required String name, required String phone, String? email, String? bio}) async {
    await _api.post('/astrologers/apply', body: {'name': name, 'phone': phone, if (email != null) 'email': email, if (bio != null) 'note': bio});
  }

  /// Reverse-geocode device lat/lng → city (server-side). '' if unavailable.
  Future<String> reverseGeocode(double lat, double lng) async {
    try {
      final data = await _api.get('/geo/reverse', query: {'lat': lat, 'lng': lng});
      return (data as Map<String, dynamic>)['city']?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }
}

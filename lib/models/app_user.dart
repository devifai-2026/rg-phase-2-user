/// Birth details used for astrology readings. `timeKnown=false` means the user
/// doesn't know their time of birth (so we hide/ignore the time).
class BirthDetails {
  final DateTime? dob;
  final String? time; // "HH:mm"
  final bool timeKnown;
  final String? place;
  final double? lat;
  final double? lng;
  final double tz;

  const BirthDetails({
    this.dob,
    this.time,
    this.timeKnown = true,
    this.place,
    this.lat,
    this.lng,
    this.tz = 5.5,
  });

  factory BirthDetails.fromJson(Map<String, dynamic>? j) {
    if (j == null) return const BirthDetails();
    return BirthDetails(
      dob: j['dob'] != null ? DateTime.tryParse(j['dob'].toString()) : null,
      time: j['time'] as String?,
      timeKnown: j['timeKnown'] != false,
      place: j['place'] as String?,
      lat: (j['lat'] as num?)?.toDouble(),
      lng: (j['lng'] as num?)?.toDouble(),
      tz: (j['tz'] as num?)?.toDouble() ?? 5.5,
    );
  }

  Map<String, dynamic> toJson() => {
        if (dob != null) 'dob': dob!.toIso8601String(),
        'time': timeKnown ? time : null,
        'timeKnown': timeKnown,
        if (place != null) 'place': place,
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
        'tz': tz,
      };
}

/// The user object returned by /auth/verify-otp and /auth/me.
/// Mirrors User.toSafeJSON() on the backend.
class AppUser {
  final String id;
  final String phone; // 91 + 10 digits
  final String? name;
  final String? email;
  final String role; // user | astrologer | admin | super_admin
  final String? avatar;
  final String? gender; // male | female | other
  final String language; // en | hi | bn | mr | pa | as
  final BirthDetails birthDetails;
  final bool profileCompleted;
  final bool isPhoneVerified;
  final bool isBlocked;
  final int freeChatMinutes;
  final String? astrologerProfileId;

  const AppUser({
    required this.id,
    required this.phone,
    required this.role,
    this.name,
    this.email,
    this.avatar,
    this.gender,
    this.language = 'en',
    this.birthDetails = const BirthDetails(),
    this.profileCompleted = false,
    this.isPhoneVerified = false,
    this.isBlocked = false,
    this.freeChatMinutes = 0,
    this.astrologerProfileId,
  });

  bool get isAstrologer => role == 'astrologer';

  factory AppUser.fromJson(Map<String, dynamic> j) => AppUser(
        id: (j['_id'] ?? j['id']).toString(),
        phone: (j['phone'] ?? '').toString(),
        role: (j['role'] ?? 'user').toString(),
        name: j['name'] as String?,
        email: j['email'] as String?,
        avatar: j['avatar'] as String?,
        gender: j['gender'] as String?,
        language: (j['language'] ?? 'en').toString(),
        birthDetails: BirthDetails.fromJson(j['birthDetails'] as Map<String, dynamic>?),
        profileCompleted: j['profileCompleted'] == true,
        isPhoneVerified: j['isPhoneVerified'] == true,
        isBlocked: j['isBlocked'] == true,
        freeChatMinutes: (j['freeChatMinutes'] is int)
            ? j['freeChatMinutes'] as int
            : int.tryParse('${j['freeChatMinutes']}') ?? 0,
        astrologerProfileId: j['astrologerProfile']?.toString(),
      );
}

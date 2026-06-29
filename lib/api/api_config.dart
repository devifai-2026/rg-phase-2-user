/// Where the app finds the backend. See ../../CONNECTING.md for the full matrix
/// (emulator vs simulator vs real device vs prod).
///
/// Override at build time without editing code:
///   flutter run --dart-define=RG_API_BASE=http://192.168.1.5:5050
class ApiConfig {
  /// Backend host root (NO trailing /api). The socket connects here too.
  /// Defaults to the Android-emulator alias for the host machine.
  static const String host = String.fromEnvironment(
    'RG_API_BASE',
    defaultValue: 'http://10.0.2.2:5050',
  );

  /// REST base — every endpoint in FLUTTER_API.md is relative to this.
  static String get apiBase => '$host/api';

  /// Socket.io connects to the host root, not /api.
  static String get socketUrl => host;
}

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

  /// Multi-tenant: the tenant slug this build belongs to, stamped by the build
  /// factory (`--dart-define=TENANT=<slug>`). Sent as the `X-Tenant` header on
  /// every REST call and in the socket handshake so the backend routes to the
  /// correct tenant database. Empty in single-tenant/dev builds (backend then
  /// falls back to the default tenant).
  static const String tenant = String.fromEnvironment('TENANT', defaultValue: '');

  /// Per-tenant deep-link URI scheme (e.g. `acme://...`). White-label builds get
  /// their own scheme so two tenant apps on one device never clash. Stamped by
  /// the build factory (`--dart-define=DEEPLINK_SCHEME=<scheme>`) and must match
  /// the AndroidManifest intent-filter (manifestPlaceholder `deepLinkScheme`).
  /// Neutral default for dev/single-tenant.
  static const String deepLinkScheme =
      String.fromEnvironment('DEEPLINK_SCHEME', defaultValue: 'astroapp');
}

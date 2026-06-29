import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../services/media_permission.dart';
import '../../services/push_service.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import '../home/main_shell.dart';
import 'onboarding_screen.dart';

/// Shown right after OTP verification. All permissions are REQUIRED — the user
/// can't proceed until each is granted. Every permission shows its own state
/// (granted / denied / blocked) with a per-item action:
///   • denied   → tap to request again
///   • blocked  → tap to open the system Settings (the OS won't prompt anymore)
/// Statuses are re-checked automatically when the app resumes (so returning
/// from Settings reflects the new grants). Grants + location are saved to the DB.
class PermissionsScreen extends StatefulWidget {
  final bool goOnboardingNext;
  const PermissionsScreen({super.key, required this.goOnboardingNext});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> with WidgetsBindingObserver {
  bool _requesting = false;
  bool _finishing = false;

  // The "photos / gallery" permission, resolved per Android version (see
  // MediaPermission): READ_MEDIA_IMAGES on API 33+, READ_EXTERNAL_STORAGE on
  // Android 9–12. Defaults to Permission.photos until resolved (iOS / 33+).
  Permission _photosPerm = Permission.photos;

  // The required permissions, in display order. Rebuilt once _photosPerm is
  // resolved so we request a permission the OS will actually prompt for.
  List<Permission> get _perms => <Permission>[
        Permission.notification,
        Permission.microphone,
        Permission.camera,
        _photosPerm,
        Permission.locationWhenInUse,
      ];

  // Current status per permission.
  final Map<Permission, PermissionStatus> _status = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Resolve the version-correct photos permission BEFORE the first status read
    // so Android 9–12 ask for READ_EXTERNAL_STORAGE (which has a consent screen)
    // instead of READ_MEDIA_IMAGES (which silently no-ops below API 33).
    _photosPerm = await MediaPermission.photos();
    if (!mounted) return;
    await _refreshStatuses();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // When the user returns from the system Settings, re-read every status so the
  // UI reflects anything they just enabled.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshStatuses();
  }

  Future<void> _refreshStatuses() async {
    for (final p in _perms) {
      _status[p] = await p.status;
    }
    if (mounted) setState(() {});
  }

  bool _isGranted(Permission p) {
    final s = _status[p];
    return s == PermissionStatus.granted || s == PermissionStatus.limited;
  }

  bool get _allGranted => _perms.every(_isGranted);
  bool get _anyBlocked => _perms.any((p) => _status[p] == PermissionStatus.permanentlyDenied || _status[p] == PermissionStatus.restricted);

  /// Request all not-yet-granted permissions (the OS prompts each in turn).
  Future<void> _requestAll() async {
    if (_anyBlocked) { await openAppSettings(); return; }
    setState(() => _requesting = true);
    try {
      final pending = _perms.where((p) => !_isGranted(p)).toList();
      final results = await pending.request();
      results.forEach((p, s) => _status[p] = s);
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _requesting = false);
    }
    if (_allGranted) _finish();
  }

  /// Per-card action: request a single permission, or open Settings if blocked.
  Future<void> _handleItem(Permission p) async {
    final s = _status[p];
    if (_isGranted(p)) return;
    if (s == PermissionStatus.permanentlyDenied || s == PermissionStatus.restricted) {
      await openAppSettings(); // OS won't prompt anymore → send to Settings
      return;
    }
    final res = await p.request();
    _status[p] = res;
    if (mounted) setState(() {});
    if (_allGranted) _finish();
  }

  /// Capture location + persist grants/location to DB, then proceed.
  Future<void> _finish() async {
    if (_finishing) return;
    _finishing = true;
    final auth = context.read<AuthProvider>();
    final profileApi = context.read<ProfileApi>();
    final push = context.read<PushService>(); // capture before async gaps

    double? lat, lng;
    String? city;
    try {
      final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low).timeout(const Duration(seconds: 8));
      lat = pos.latitude; lng = pos.longitude;
      city = await profileApi.reverseGeocode(lat, lng);
    } catch (_) {/* location optional — proceed regardless */}

    if (auth.status == AuthStatus.loggedIn) {
      final body = <String, dynamic>{
        'permissions': {
          'notifications': _isGranted(Permission.notification),
          'microphone': _isGranted(Permission.microphone),
          'camera': _isGranted(Permission.camera),
          'photos': _isGranted(_photosPerm),
          'location': _isGranted(Permission.locationWhenInUse),
        },
      };
      if (lat != null && lng != null) {
        body['location'] = {'lat': lat, 'lng': lng, if (city != null) 'city': city, 'updatedAt': DateTime.now().toIso8601String()};
      }
      auth.updateProfile(body).catchError((_) => auth.user!);
    }
    // Notification permission was just granted here → register the FCM token now
    // (registerWithBackend no longer prompts; this is when it can finally fetch it).
    push.registerWithBackend();
    _proceed();
  }

  void _proceed() {
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      slideRoute(widget.goOnboardingNext ? const OnboardingScreen() : const MainShell()),
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);

    final items = <(Permission, IconData, String, String)>[
      (Permission.notification, Icons.notifications_active_outlined, t.permNotifications, t.permNotificationsDesc),
      (Permission.microphone, Icons.mic_none_rounded, t.permMic, t.permMicDesc),
      (Permission.camera, Icons.videocam_outlined, t.permCamera, t.permCameraDesc),
      (_photosPerm, Icons.photo_library_outlined, t.permPhotos, t.permPhotosDesc),
      (Permission.locationWhenInUse, Icons.location_on_outlined, t.permLocation, t.permLocationDesc),
    ];

    final blocked = _anyBlocked;
    final allGranted = _allGranted;
    final btnLabel = allGranted ? t.continueLabel : (blocked ? t.openSettings : t.permAllow);

    return PopScope(
      canPop: false, // mandatory — can't back out
      child: Scaffold(
        backgroundColor: c.ground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 16 + MediaQuery.of(context).padding.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Container(
                  height: 56, width: 56,
                  decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.shield_outlined, color: c.red, size: 30),
                ),
                const SizedBox(height: 20),
                Text(t.permTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: c.ink)),
                const SizedBox(height: 8),
                Text(
                  blocked
                      ? t.somePermissionsAreBlockedTapA
                      : t.thesePermissionsAreRequiredToUse,
                  style: TextStyle(fontSize: 14, color: c.muted, height: 1.45),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final (perm, icon, title, desc) = items[i];
                      return _PermCard(
                        c: c, icon: icon, title: title, desc: desc,
                        status: _status[perm] ?? PermissionStatus.denied,
                        granted: _isGranted(perm),
                        onTap: () => _handleItem(perm),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _requesting ? null : (allGranted ? _finish : _requestAll),
                    child: _requesting
                        ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                        : Text(btnLabel),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One permission row with status-aware styling + a trailing action chip.
class _PermCard extends StatelessWidget {
  final RgColors c;
  final IconData icon;
  final String title;
  final String desc;
  final PermissionStatus status;
  final bool granted;
  final VoidCallback onTap;
  const _PermCard({required this.c, required this.icon, required this.title, required this.desc, required this.status, required this.granted, required this.onTap});

  bool get _blocked => status == PermissionStatus.permanentlyDenied || status == PermissionStatus.restricted;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF2E9E6B);
    final accent = granted ? green : (_blocked ? c.red : c.gold);
    // Trailing: check when granted; otherwise a tappable action chip.
    final Widget trailing = granted
        ? const Icon(Icons.check_circle, color: green, size: 22)
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: accent.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(20)),
            child: Text(_blocked ? L10n.of(context).settings2 : L10n.of(context).allow, style: TextStyle(color: accent, fontWeight: FontWeight.w700, fontSize: 12)),
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: granted ? null : onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: granted ? green : (_blocked ? c.red.withValues(alpha: 0.5) : c.line)),
          ),
          child: Row(
            children: [
              Container(
                height: 42, width: 42,
                decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(11), border: Border.all(color: c.line)),
                child: Icon(icon, color: c.gold, size: 21),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(
                      _blocked ? L10n.of(context).blockedEnableItInSettings : desc,
                      style: TextStyle(color: _blocked ? c.red : c.muted, fontSize: 12.5, height: 1.3),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}

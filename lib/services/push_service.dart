import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../api/api_config.dart';
import '../api/auth_api.dart';
import 'deep_link.dart';
import 'delivery_ack.dart';
import 'device_info.dart';
import 'local_notifs.dart';

/// Background/terminated-state handler. Must be a top-level function (FCM spawns
/// a separate isolate). Broadcasts are sent DATA-ONLY (no `notification` block)
/// so Android wakes this isolate on every receipt — which lets us (1) ACK true
/// device delivery to the backend and (2) draw the tray notification ourselves
/// (the OS no longer draws it for data-only messages). Keep work light.
@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  final data = message.data;
  // Confirm receipt for delivery analytics (best-effort, reads token from
  // secure storage which is shared with this isolate).
  await DeliveryAck.send(data['broadcastId']?.toString());

  // Draw the notification ourselves since data-only messages have no OS banner.
  final title = (message.notification?.title ?? data['title'] ?? 'New notification').toString();
  final body = (message.notification?.body ?? data['body'] ?? '').toString();
  if (title.isNotEmpty || body.isNotEmpty) {
    await LocalNotifs.show(title, body, payload: PushService._payloadUri(data));
  }
}

/// Owns Firebase Cloud Messaging: permission, token registration with the
/// backend, token refresh, and turning foreground pushes into visible local
/// notifications.
///
/// Lifecycle (wired in main.dart):
///   • call [init] once at startup (registers the FG/BG listeners)
///   • call [registerWithBackend] on login/bootstrap (auth.onLoggedIn)
///   • call [unregisterFromBackend] on logout (auth.onLoggedOut)
class PushService {
  final AuthApi _authApi;
  PushService(this._authApi);

  final _fcm = FirebaseMessaging.instance;
  String? _lastToken;
  bool _listenersReady = false;

  String get _platform => defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android';

  /// Set up message listeners. Safe to call once at startup, before login.
  Future<void> init() async {
    if (_listenersReady) return;
    _listenersReady = true;

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

    // Tap on a foreground (local) notification → the payload is a deep-link URI
    // we encoded at show()-time; route + attribute the tap.
    LocalNotifs.onTap = (payload) {
      if (payload.isEmpty) return;
      final uri = Uri.tryParse(payload);
      if (uri != null && uri.queryParameters['bid'] != null) _recordClick(uri.queryParameters['bid']);
      DeepLink.fromUri(payload);
    };

    // Foreground: the OS does NOT show a tray notification, so we draw one via
    // the existing local-notifications channel. Encode routing (type + optional
    // admin deeplink + broadcastId) into the payload URI so a tap deep-links.
    // Also ACK delivery — the message has demonstrably arrived on this device.
    FirebaseMessaging.onMessage.listen((msg) {
      _recordDelivered(msg.data['broadcastId']?.toString());
      final n = msg.notification;
      final title = (n?.title ?? msg.data['title'] ?? 'New notification').toString();
      final body = (n?.body ?? msg.data['body'] ?? '').toString();
      if (title.isEmpty && body.isEmpty) return;
      LocalNotifs.show(title, body, payload: _payloadUri(msg.data));
    });

    // Tap on a tray notification that opened the app from the BACKGROUND.
    FirebaseMessaging.onMessageOpenedApp.listen(_handleTap);

    // Tap that launched the app from a TERMINATED state.
    _fcm.getInitialMessage().then((msg) {
      if (msg != null) _handleTap(msg);
    });

    // If the token rotates while logged in, push the new one to the backend.
    _fcm.onTokenRefresh.listen((token) async {
      _lastToken = token;
      try {
        final device = await DeviceInfo.collect();
        await _authApi.registerFcmToken(token, platform: _platform, device: device);
      } catch (_) {/* will retry on next login/bootstrap */}
    });
  }

  /// A tray-notification tap (background/terminated): attribute + deep-link.
  /// A tap proves receipt too, so ACK delivery (de-duped server-side) in case
  /// the background isolate's ACK didn't land (e.g. killed before it ran).
  void _handleTap(RemoteMessage msg) {
    final bid = msg.data['broadcastId']?.toString();
    _recordDelivered(bid);
    _recordClick(bid);
    DeepLink.fromNotification(
      type: (msg.data['type'] ?? 'system').toString(),
      data: Map<String, dynamic>.from(msg.data),
    );
  }

  /// Encode an FCM data map into a deep-link URI string used as the local-
  /// notification payload (so a foreground tap can route). Prefers an explicit
  /// admin deeplink; else builds <scheme>://<type-target>. Carries bid (the
  /// broadcastId) as a query param for click attribution.
  static String _payloadUri(Map<String, dynamic> data) {
    final bid = data['broadcastId']?.toString();
    final q = (bid != null && bid.isNotEmpty) ? '?bid=$bid' : '';
    final explicit = data['deeplink']?.toString();
    if (explicit != null && explicit.isNotEmpty) {
      return explicit.contains('?') ? '$explicit&bid=$bid' : '$explicit$q';
    }
    final type = (data['type'] ?? 'system').toString();
    // Live pushes carry the broadcast id → encode it so a FOREGROUND tap can
    // open the live room directly (background taps use the full data map).
    if (type == 'live') {
      final lid = data['liveSessionId']?.toString();
      if (lid != null && lid.isNotEmpty) return '${ApiConfig.deepLinkScheme}://live/$lid$q';
    }
    return '${ApiConfig.deepLinkScheme}://notification/$type$q';
  }

  /// Best-effort tap attribution → backend increments the broadcast's tap count.
  void _recordClick(String? broadcastId) {
    if (broadcastId == null || broadcastId.isEmpty) return;
    _authApi.recordNotificationClick(broadcastId).catchError((_) {});
  }

  /// Best-effort device-delivery ACK → backend counts true (device-confirmed)
  /// delivery. Uses the standalone helper so the same path works everywhere.
  void _recordDelivered(String? broadcastId) {
    DeliveryAck.send(broadcastId).catchError((_) {});
  }

  /// Fetch the FCM token + register it with the backend. Does NOT prompt for
  /// permission — the onboarding PermissionsScreen owns that ask, so we avoid a
  /// duplicate notification prompt on login. We only proceed if permission is
  /// already authorized; otherwise this no-ops (re-runs after the user grants it).
  Future<void> registerWithBackend() async {
    try {
      final settings = await _fcm.getNotificationSettings();
      if (settings.authorizationStatus == AuthorizationStatus.denied ||
          settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        return; // not granted yet → skip; PermissionsScreen will request it
      }
      final token = await _fcm.getToken();
      if (token == null || token.isEmpty) return;
      _lastToken = token;
      final device = await DeviceInfo.collect();
      await _authApi.registerFcmToken(token, platform: _platform, device: device);
    } catch (_) {
      // Don't let push failures block the app — best-effort.
    }
  }

  /// Remove this device's token from the backend, then delete it locally so a
  /// logged-out device stops receiving the previous user's pushes.
  Future<void> unregisterFromBackend() async {
    final token = _lastToken;
    try {
      if (token != null) await _authApi.removeFcmToken(token);
    } catch (_) {/* ignore */}
    try {
      await _fcm.deleteToken();
    } catch (_) {/* ignore */}
    _lastToken = null;
  }
}

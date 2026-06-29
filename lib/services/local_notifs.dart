import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// On-device notifications — used to confirm a save/submit a few seconds later
/// (a friendly "we got it" ping). Not push; purely local scheduling.
class LocalNotifs {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _ready = false;
  static final _rand = Random();

  static const _channel = AndroidNotificationChannel(
    'rg_general', 'Rudraganga', description: 'General app notifications', importance: Importance.high,
  );

  /// Called when the user taps a local notification, with its `payload` string
  /// (we pass the broadcastId so taps can be attributed). Set by PushService.
  static void Function(String payload)? onTap;

  static Future<void> init() async {
    if (_ready) return;
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (resp) {
        final p = resp.payload;
        if (p != null && p.isNotEmpty) onTap?.call(p);
      },
    );
    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
    _ready = true;
  }

  /// Show a notification immediately — used to surface a foreground FCM push
  /// (the OS suppresses the tray banner while the app is in the foreground).
  /// [payload] is returned to [onTap] when the user taps it.
  static Future<void> show(String title, String body, {String? payload}) async {
    await init();
    await _plugin.show(
      _rand.nextInt(1 << 30),
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails('rg_general', 'Rudraganga',
            channelDescription: 'General app notifications', importance: Importance.high, priority: Priority.high),
        iOS: DarwinNotificationDetails(),
      ),
      payload: payload,
    );
  }

  /// Show a notification 5–12s from now (random), e.g. after a save/submit.
  static Future<void> pingAfterDelay(String title, String body) async {
    await init();
    final delay = 5 + _rand.nextInt(8); // 5..12s
    Future.delayed(Duration(seconds: delay), () {
      _plugin.show(
        _rand.nextInt(1 << 30),
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails('rg_general', 'Rudraganga',
              channelDescription: 'General app notifications', importance: Importance.high, priority: Priority.high),
          iOS: DarwinNotificationDetails(),
        ),
      );
    });
  }
}

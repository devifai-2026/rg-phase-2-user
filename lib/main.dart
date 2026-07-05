import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'api/api_client.dart';
import 'api/app_config_service.dart';
import 'api/auth_api.dart';
import 'api/notification_api.dart';
import 'api/pooja_api.dart';
import 'api/profile_api.dart';
import 'api/gift_api.dart';
import 'api/live_api.dart';
import 'api/horoscope_api.dart';
import 'api/panchang_api.dart';
import 'api/numerology_api.dart';
import 'api/wallet_api.dart';
import 'api/astrologer_api.dart';
import 'api/category_api.dart';
import 'api/product_api.dart';
import 'api/video_api.dart';
import 'api/content_api.dart';
import 'api/cart_api.dart';
import 'api/shop_api.dart';
import 'api/order_api.dart';
import 'api/store_charges_api.dart';
import 'api/offers_api.dart';
import 'api/referral_api.dart';
import 'api/socket_service.dart';
import 'api/session_api.dart';
import 'api/token_store.dart';
import 'theme/rg_colors.dart';
import 'l10n/app_localizations.dart';
import 'providers/auth_provider.dart';
import 'providers/notifications_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/session_provider.dart';
import 'providers/settings_provider.dart';
import 'providers/wallet_provider.dart';
import 'services/analytics.dart';
import 'services/deep_link.dart';
import 'services/local_notifs.dart';
import 'services/push_service.dart';
import 'screens/splash/splash_one_screen.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait — no landscape rotation.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Firebase (Cloud Messaging — push). Must come before any FCM use.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Local notifications (save/submit confirmation pings + foreground pushes).
  await LocalNotifs.init();

  // Dependency wiring (manual DI — no codegen).
  final tokens = TokenStore();
  final api = ApiClient(tokens);
  final authApi = AuthApi(api, tokens);
  final profileApi = ProfileApi(api);
  final poojaApi = PoojaApi(api);
  final walletApi = WalletApi(api);
  final astrologerApi = AstrologerApi(api);
  final giftApi = GiftApi(api);
  final categoryApi = CategoryApi(api);
  final productApi = ProductApi(api);
  final videoApi = VideoApi(api);
  final contentApi = ContentApi(api);
  final shopApi = ShopApi(api);
  final orderApi = OrderApi(api);
  final storeChargesApi = StoreChargesApi(api);
  final offersApi = OffersApi(api);
  final referralApi = ReferralApi(api);
  final cart = CartProvider(CartApi(api));
  final notifications = NotificationsProvider(NotificationApi(api));

  // Push notifications: register listeners now; (un)register the device token
  // with the backend on login/logout below.
  final push = PushService(authApi);
  await push.init();

  final settings = SettingsProvider();
  await settings.load(); // restore theme + locale before first frame
  // Send the chosen language as `x-lang` on every request so the backend returns
  // dynamic content (bios, products, AI text) in that language — even before the
  // user profile's language field is synced. Seed now + keep updated on change.
  api.langCode = settings.effectiveLangCode;
  settings.onLanguageChanged = (code) => api.langCode = code;

  // Admin-driven app config (theme/splash/banners/videos). Load the cached copy
  // before the first frame so the theme & splash are already custom; refresh in
  // the background. The compiled tokens/screens are the fallback throughout.
  final appConfig = AppConfigService(api);
  await appConfig.loadCache();
  appConfig.refresh(); // fire-and-forget; applies on next build / launch

  final socket = SocketService(tokens);
  final wallet = WalletProvider(walletApi);
  final sessionApi = SessionApi(api);
  final liveApi = LiveApi(api);
  final horoscopeApi = HoroscopeApi(api);
  final panchangApi = PanchangApi(api);
  final numerologyApi = NumerologyApi(api);
  final session = SessionProvider(sessionApi);
  // Keep the app-wide balance live from the realtime wallet-updated event.
  socket.onWalletUpdated = (data) => wallet.applySocket(Map<String, dynamic>.from(data));
  // Route consultation-session realtime events into the SessionProvider so the
  // active screen (Requesting/Chat/Call) stays in sync no matter what's mounted.
  socket.onRequestAccepted = (d) => session.onAccepted(d);
  socket.onSessionStarted = (d) => session.onStarted(d);
  socket.onRequestRejected = (d) => session.onRejected(d);
  socket.onRequestMissed = (d) => session.onMissed(d);
  socket.onReceiveMessage = (d) => session.onReceiveMessage(d);
  socket.onLowBalanceWarning = (d) => session.onLowBalance(d);
  socket.onSessionExtended = (d) => session.onExtended(d);
  socket.onGiftReceived = (d) => session.onGift(d);
  socket.onSessionEnded = (d) => session.onEnded(d);
  final auth = AuthProvider(api, authApi, tokens);
  // Seed locale from the DB ONLY if the user hasn't picked one locally yet —
  // never override a manual choice (otherwise login/refresh would reset it).
  auth.onUserLanguage = (code) {
    if (settings.locale == null) settings.setLocale(Locale(code));
  };
  // On login/bootstrap: connect the realtime socket AND register this device's
  // push token. On logout: tear both down and drop the token server-side.
  auth.onLoggedIn = () {
    socket.connect();
    push.registerWithBackend(); // fire-and-forget; self-recovers on token refresh
    notifications.load(); // prime the inbox + unread badge
    wallet.refresh(); // prime the wallet balance for the Home top bar
    cart.refresh(); // prime the store cart + badge count
    // RESUME: if a consultation is still live server-side (app was killed mid-
    // session), rehydrate it so the Home resume bar reappears and the user can
    // rejoin the chat/call they're still being billed for.
    session.resumeFromActive(socket);
    // GA: tag the signed-in user + role so events segment in the dashboard.
    Analytics.instance.setUser(auth.user?.id);
    Analytics.instance.setProp('role', 'user');
  };
  auth.onLoggedOut = () {
    socket.disconnect();
    push.unregisterFromBackend();
    notifications.reset();
    wallet.reset();
    cart.reset();
    Analytics.instance.setUser(null); // GA: detach the user on logout
  };

  // External deep links (<scheme>://... and https App Links). Handle the link
  // that launched the app + any received while running. Routing is no-op until
  // the navigator is mounted, so this is safe to start now.
  final appLinks = AppLinks();
  appLinks.getInitialLink().then((uri) {
    if (uri != null) DeepLink.fromUri(uri.toString());
  });
  appLinks.uriLinkStream.listen((uri) => DeepLink.fromUri(uri.toString()));

  runApp(RgUserApp(settings: settings, auth: auth, profileApi: profileApi, giftApi: giftApi, poojaApi: poojaApi, walletApi: walletApi, astrologerApi: astrologerApi, categoryApi: categoryApi, productApi: productApi, videoApi: videoApi, contentApi: contentApi, shopApi: shopApi, orderApi: orderApi, storeChargesApi: storeChargesApi, offersApi: offersApi, referralApi: referralApi, cart: cart, wallet: wallet, push: push, socket: socket, appConfig: appConfig, notifications: notifications, session: session, sessionApi: sessionApi, liveApi: liveApi, horoscopeApi: horoscopeApi, panchangApi: panchangApi, numerologyApi: numerologyApi));
}

class RgUserApp extends StatelessWidget {
  final SettingsProvider settings;
  final AuthProvider auth;
  final ProfileApi profileApi;
  final PoojaApi poojaApi;
  final WalletApi walletApi;
  final AstrologerApi astrologerApi;
  final GiftApi giftApi;
  final CategoryApi categoryApi;
  final ProductApi productApi;
  final VideoApi videoApi;
  final ContentApi contentApi;
  final ShopApi shopApi;
  final OrderApi orderApi;
  final StoreChargesApi storeChargesApi;
  final OffersApi offersApi;
  final ReferralApi referralApi;
  final CartProvider cart;
  final WalletProvider wallet;
  final PushService push;
  final SocketService socket;
  final AppConfigService appConfig;
  final NotificationsProvider notifications;
  final SessionProvider session;
  final SessionApi sessionApi;
  final LiveApi liveApi;
  final HoroscopeApi horoscopeApi;
  final PanchangApi panchangApi;
  final NumerologyApi numerologyApi;
  const RgUserApp({super.key, required this.settings, required this.auth, required this.profileApi, required this.giftApi, required this.poojaApi, required this.walletApi, required this.astrologerApi, required this.categoryApi, required this.productApi, required this.videoApi, required this.contentApi, required this.shopApi, required this.orderApi, required this.storeChargesApi, required this.offersApi, required this.referralApi, required this.cart, required this.wallet, required this.push, required this.socket, required this.appConfig, required this.notifications, required this.session, required this.sessionApi, required this.liveApi, required this.horoscopeApi, required this.panchangApi, required this.numerologyApi});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settings),
        ChangeNotifierProvider.value(value: auth),
        ChangeNotifierProvider.value(value: socket),
        ChangeNotifierProvider.value(value: appConfig),
        ChangeNotifierProvider.value(value: notifications),
        ChangeNotifierProvider.value(value: wallet),
        ChangeNotifierProvider.value(value: cart),
        ChangeNotifierProvider.value(value: session),
        Provider.value(value: sessionApi),
        Provider.value(value: liveApi),
        Provider.value(value: horoscopeApi),
        Provider.value(value: panchangApi),
        Provider.value(value: numerologyApi),
        Provider.value(value: profileApi),
        Provider.value(value: giftApi),
        Provider.value(value: poojaApi),
        Provider.value(value: walletApi),
        Provider.value(value: astrologerApi),
        Provider.value(value: categoryApi),
        Provider.value(value: productApi),
        Provider.value(value: videoApi),
        Provider.value(value: contentApi),
        Provider.value(value: shopApi),
        Provider.value(value: orderApi),
        Provider.value(value: storeChargesApi),
        Provider.value(value: offersApi),
        Provider.value(value: referralApi),
        Provider.value(value: push),
      ],
      // Rebuild the themes whenever settings (mode/locale) OR the admin theme
      // tokens change. Remote tokens overlay the compiled set per-token.
      child: Consumer2<SettingsProvider, AppConfigService>(
        builder: (context, s, cfg, _) {
          final darkTokens = RgColors.dark.merge(cfg.themeTokens(true));
          final lightTokens = RgColors.light.merge(cfg.themeTokens(false));
          return MaterialApp(
            title: cfg.appName,
            debugShowCheckedModeBanner: false,
            navigatorKey: DeepLink.navigatorKey, // lets push/URI handlers navigate
            navigatorObservers: [Analytics.instance.observer], // auto screen_view → GA

            theme: AppTheme.light(lightTokens),
            darkTheme: AppTheme.dark(darkTokens),
            themeMode: s.themeMode,
            locale: s.locale, // null → follow device
            supportedLocales: SettingsProvider.supportedLocales,
            localizationsDelegates: const [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const SplashOneScreen(),
          );
        },
      ),
    );
  }
}

# Rudraganga — User App (Flutter)

The end-user (seeker) Flutter app for the Rudraganga astrology platform.
Role-aware: a verified user is a seeker; if an admin later promotes them to
astrologer, `user.role` becomes `astrologer` and you can branch the UI.

- **Dark + Light** themes from the RG brand palette (crimson + gold on a
  near-black / cream ground). System / Light / Dark toggle on the Home screen.
- **6 languages**: English, हिन्दी, বাংলা, मराठी, ਪੰਜਾਬੀ, অসমীয়া — switchable
  anywhere via the globe button; choice persists.
- **Phone + OTP auth** against the backend (`/auth/request-otp` →
  `/auth/verify-otp`). Dev OTP is **123456**.
- Two branded splash screens → auth (or straight to Home if a session exists).

## What's here

```
lib/
  main.dart                     # DI wiring + MaterialApp (themes, locales, routing)
  theme/
    rg_colors.dart              # brand tokens (dark = exact spec, light = derived)
    app_theme.dart              # Material 3 dark & light ThemeData
  l10n/                         # app_en/hi/bn/mr/pa/as.arb  (gen-l10n source)
  api/
    api_config.dart             # base URL (override with --dart-define=RG_API_BASE=...)
    token_store.dart            # secure access+refresh token storage
    api_client.dart             # Dio + Bearer + auto refresh-on-401 + envelope unwrap
    auth_api.dart               # /auth/* calls
  models/app_user.dart
  providers/
    auth_provider.dart          # session lifecycle (bootstrap, OTP, logout)
    settings_provider.dart      # theme mode + locale (persisted)
  widgets/
    rg_logo.dart                # painted RG mark (no asset needed)
    language_button.dart        # language picker sheet
  screens/
    splash/splash_one_screen.dart, splash_two_screen.dart
    auth/phone_login_screen.dart, otp_verify_screen.dart
    home/home_screen.dart       # post-login landing (theme/language/logout)
docs/
  FLUTTER_API.md                # full backend API contract
  openapi.json                  # machine spec (Swagger / codegen)
```

## First-time setup

Flutter isn't committed (only `lib/`, `pubspec.yaml`, `l10n.yaml`, ARBs). Generate
the native shells once, then run:

```bash
cd flutter/user
flutter create . --platforms=android,ios --org com.rudraganga   # native folders
flutter pub get                                                  # also runs gen-l10n
flutter run
```

> `flutter pub get` generates `lib/l10n/app_localizations.dart` (the `L10n`
> class) from the ARB files. It's intentionally not committed — don't hand-edit it.

## Pointing the app at the backend

Default base URL is `http://10.0.2.2:5050` (Android emulator → your Mac's
localhost, where the backend runs on **5050**). Override per run:

| Target | `RG_API_BASE` |
|--------|---------------|
| Android emulator | `http://10.0.2.2:5050` (default) |
| iOS simulator | `http://localhost:5050` |
| Real device (same Wi-Fi) | `http://<your-mac-LAN-IP>:5050` (e.g. `http://192.168.1.5:5050`) |
| Production | `https://api.yourdomain.com` |

```bash
flutter run --dart-define=RG_API_BASE=http://192.168.1.5:5050
```

### ⚠️ Cleartext HTTP for local dev

The dev backend is plain `http://`. Android (API 28+) and iOS block cleartext by
default, so add this **after** `flutter create`:

**Android** — `android/app/src/main/AndroidManifest.xml`, on `<application>`:
```xml
<application
    android:label="Rudraganga"
    android:usesCleartextTraffic="true"
    ... >
```
(Internet permission is included by default in debug builds.)

**iOS** — `ios/Runner/Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
</dict>
```

Remove both for production (use HTTPS).

## How auth flows

1. `PhoneLoginScreen` → enter 10 digits → `POST /auth/request-otp`.
2. `OtpVerifyScreen` → enter **123456** → `POST /auth/verify-otp` → tokens saved
   to secure storage, `AuthProvider` flips to `loggedIn`, lands on `HomeScreen`.
3. On next launch, `SplashTwoScreen` calls `AuthProvider.bootstrap()` which
   restores the session (refreshing the access token if needed) and skips login.
4. `ApiClient` transparently refreshes on any 401 and retries once; if refresh
   fails it clears the session and routes back to login.

## Next to build

The Home screen is a placeholder. The backend contract for everything else
(astrologer list, wallet/recharge, call/chat/video sessions + Socket.io events,
store, poojas, reviews) is in [`docs/FLUTTER_API.md`](docs/FLUTTER_API.md). Add new
API wrappers next to `auth_api.dart` and new screens under `lib/screens/`.
# rg-phase-2-user

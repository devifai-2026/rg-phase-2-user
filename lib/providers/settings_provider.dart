import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Bumped when the app language changes, AFTER the stale localised caches have
/// been dropped and the `x-lang` header updated. Any screen showing
/// server-translated content (astrologer bios, category / pooja / product names)
/// should listen and refetch, which is what makes a language switch feel like a
/// fresh launch without actually restarting the process.
final ValueNotifier<int> languageRefreshTick = ValueNotifier<int>(0);

/// Persists the user's theme mode + chosen locale across launches.
/// A `null` locale means "follow the device locale".
class SettingsProvider extends ChangeNotifier {
  static const _kTheme = 'rg_theme_mode';
  static const _kLocale = 'rg_locale';

  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;

  /// Effective language code actually shown to the user (chosen locale, or the
  /// device locale fallback 'en'). Used to tell the backend which language to
  /// return dynamic content in.
  String get effectiveLangCode => _locale?.languageCode ?? 'en';

  /// Called whenever the effective language changes, so the API client can send
  /// the right `x-lang` header for dynamic-content translation. Set from main().
  void Function(String langCode)? onLanguageChanged;

  void _notifyLanguage() => onLanguageChanged?.call(effectiveLangCode);

  /// The languages the app ships with (must match lib/l10n/*.arb).
  static const supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('bn'),
    Locale('mr'),
    Locale('pa'),
    Locale('as'),
    Locale('kn'),
    Locale('te'),
    Locale('ta'),
  ];

  /// Native names for the language picker.
  static const languageNames = <String, String>{
    'en': 'English',
    'hi': 'हिन्दी',
    'bn': 'বাংলা',
    'mr': 'मराठी',
    'pa': 'ਪੰਜਾਬੀ',
    'as': 'অসমীয়া',
    'kn': 'ಕನ್ನಡ',
    'te': 'తెలుగు',
    'ta': 'தமிழ்',
  };

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString(_kTheme);
    _themeMode = switch (t) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    final l = prefs.getString(_kLocale);
    _locale = (l == null || l.isEmpty) ? null : Locale(l);
    _notifyLanguage();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTheme, mode.name);
  }

  /// Pass `null` to follow the device language.
  ///
  /// Changing the language must behave like a fresh start: the app's own strings
  /// come from the ARB bundles and swap instantly, but astrologer bios, category
  /// names, pooja and product titles are translated SERVER-side and arrive over
  /// the API. Screens already holding that data — plus the on-disk caches, which
  /// store the previously-translated text — would otherwise keep showing the old
  /// language until each one happened to refetch.
  ///
  /// Restarting the process is not an option on Android (no supported API; exit()
  /// just closes the app and reads as a crash), so instead we drop the stale
  /// caches and fire the app-wide refresh tick that every API-bound rail already
  /// listens to. Same end result, no fake crash.
  Future<void> setLocale(Locale? locale) async {
    final changed = locale?.languageCode != _locale?.languageCode;
    _locale = locale;
    _notifyLanguage(); // updates the x-lang header BEFORE anything refetches
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocale, locale?.languageCode ?? '');
    if (changed) await _reloadLocalisedData(prefs);
  }

  /// Evict language-dependent disk caches, then ask every listening screen to
  /// refetch with the new `x-lang` header.
  Future<void> _reloadLocalisedData(SharedPreferences prefs) async {
    // These hold SERVER-TRANSLATED copy (app config strings, recharge pack
    // names/benefits). Keeping them would show the old language after the switch.
    for (final key in const ['rg_app_config_v1', 'rg_recharge_packs_v1']) {
      await prefs.remove(key);
    }
    languageRefreshTick.value++;
  }
}

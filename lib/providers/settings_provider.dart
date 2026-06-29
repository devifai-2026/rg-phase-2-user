import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  ];

  /// Native names for the language picker.
  static const languageNames = <String, String>{
    'en': 'English',
    'hi': 'हिन्दी',
    'bn': 'বাংলা',
    'mr': 'मराठी',
    'pa': 'ਪੰਜਾਬੀ',
    'as': 'অসমীয়া',
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
  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    _notifyLanguage();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocale, locale?.languageCode ?? '');
  }
}

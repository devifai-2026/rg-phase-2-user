import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/settings_provider.dart';
import '../theme/rg_colors.dart';

/// A globe icon that opens a sheet to pick the app language. Writes through
/// SettingsProvider, which persists the choice and rebuilds MaterialApp.locale.
class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return IconButton(
      icon: Icon(Icons.translate, color: c.ink),
      tooltip: L10n.of(context).language,
      onPressed: () => showLanguageSheet(context),
    );
  }
}

Future<void> showLanguageSheet(BuildContext context) {
  final c = context.rg;
  final settings = context.read<SettingsProvider>();
  final auth = context.read<AuthProvider>();
  final current = settings.locale?.languageCode;

  return showModalBottomSheet(
    context: context,
    backgroundColor: c.ground2,
    // The 9 supported languages are taller than the default 50%-of-screen cap on
    // shorter devices, so the fixed Column overflowed. isScrollControlled lifts
    // that cap and the list below scrolls if it still doesn't fit.
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: ConstrainedBox(
          // Never taller than 80% of the screen — keeps the scrim tappable so the
          // sheet can still be dismissed by tapping outside.
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(ctx).size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 8),
              // Flexible + shrinkWrap: takes only the height it needs, but scrolls
              // instead of overflowing once it hits maxHeight.
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    for (final locale in SettingsProvider.supportedLocales)
                      ListTile(
                        title: Text(
                          SettingsProvider.languageNames[locale.languageCode] ?? locale.languageCode,
                          style: TextStyle(color: c.ink, fontWeight: FontWeight.w600),
                        ),
                        trailing: current == locale.languageCode
                            ? Icon(Icons.check_circle, color: c.red)
                            : null,
                        onTap: () {
                          // 1) App-wide + local storage (SharedPreferences).
                          settings.setLocale(locale);
                          // 2) Persist to DB when logged in (fire-and-forget).
                          if (auth.status == AuthStatus.loggedIn) {
                            auth.updateProfile({'language': locale.languageCode}).catchError((_) => auth.user!);
                          }
                          Navigator.of(ctx).pop();
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    },
  );
}

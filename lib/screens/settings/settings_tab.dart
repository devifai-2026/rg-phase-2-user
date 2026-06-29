import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/language_button.dart';
import '../auth/phone_login_screen.dart';

/// Settings tab — theme mode, language, account + logout.
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final auth = context.watch<AuthProvider>();
    final settings = context.watch<SettingsProvider>();
    final user = auth.user;

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(t.settings, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Account header.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line)),
            child: Row(children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: c.card,
                backgroundImage: user?.avatar != null ? NetworkImage(user!.avatar!) : null,
                child: user?.avatar == null ? Icon(Icons.person, color: c.muted, size: 28) : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text((user?.name?.trim().isNotEmpty ?? false) ? user!.name! : t.seeker,
                      style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text(user?.phone ?? '', style: TextStyle(color: c.muted, fontSize: 13)),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: 24),

          Text(t.theme, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(value: ThemeMode.system, label: Text(t.themeSystem)),
              ButtonSegment(value: ThemeMode.light, label: Text(t.themeLight)),
              ButtonSegment(value: ThemeMode.dark, label: Text(t.themeDark)),
            ],
            selected: {settings.themeMode},
            onSelectionChanged: (s) => context.read<SettingsProvider>().setThemeMode(s.first),
          ),
          const SizedBox(height: 24),

          Text(t.language, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: Icon(Icons.translate, color: c.red),
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                SettingsProvider.languageNames[settings.locale?.languageCode] ?? t.themeSystem,
                style: TextStyle(color: c.ink),
              ),
            ),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50), side: BorderSide(color: c.line)),
            onPressed: () => showLanguageSheet(context),
          ),
          const SizedBox(height: 40),

          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: Text(t.logout),
            onPressed: () async {
              await context.read<AuthProvider>().logout();
              if (!context.mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
                (r) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

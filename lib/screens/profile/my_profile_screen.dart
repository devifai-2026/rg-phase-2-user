import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/language_button.dart';
import '../../widgets/slide_route.dart';
import '../auth/phone_login_screen.dart';
import '../consult/consultation_history_screen.dart';
import '../onboarding/onboarding_screen.dart';

/// My Profile — account header, edit, theme (System/Light/Dark), language, logout.
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final auth = context.watch<AuthProvider>();
    final settings = context.watch<SettingsProvider>();
    final user = auth.user;
    final name = (user?.name?.trim().isNotEmpty ?? false) ? user!.name! : t.seeker;

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(t.myProfile, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account header.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(colors: [c.redDeep, c.red], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white24,
                backgroundImage: user?.avatar != null ? NetworkImage(user!.avatar!) : null,
                child: user?.avatar == null ? const Icon(Icons.person, color: Colors.white, size: 32) : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18)),
                  const SizedBox(height: 3),
                  Text(user?.phone ?? '', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13)),
                ]),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(slideRoute(const OnboardingScreen())),
                icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 20),
              ),
            ]),
          ),
          const SizedBox(height: 24),

          // Theme switcher.
          _SectionLabel(t.theme),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(value: ThemeMode.system, icon: const Icon(Icons.brightness_auto, size: 18), label: Text(t.themeSystem)),
              ButtonSegment(value: ThemeMode.light, icon: const Icon(Icons.light_mode_outlined, size: 18), label: Text(t.themeLight)),
              ButtonSegment(value: ThemeMode.dark, icon: const Icon(Icons.dark_mode_outlined, size: 18), label: Text(t.themeDark)),
            ],
            selected: {settings.themeMode},
            showSelectedIcon: false,
            onSelectionChanged: (s) => context.read<SettingsProvider>().setThemeMode(s.first),
          ),
          const SizedBox(height: 24),

          // Language.
          _SectionLabel(t.language),
          const SizedBox(height: 8),
          _Tile(
            icon: Icons.translate,
            label: SettingsProvider.languageNames[settings.locale?.languageCode] ?? t.themeSystem,
            onTap: () => showLanguageSheet(context),
          ),
          const SizedBox(height: 24),

          // My consultations (chat/call/video history with duration + coins).
          _Tile(
            icon: Icons.history,
            label: 'My consultations',
            onTap: () => Navigator.of(context).push(slideRoute(const ConsultationHistoryScreen())),
          ),
          const SizedBox(height: 24),

          // Logout.
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: Text(t.logout),
            style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white),
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

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);
  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(color: context.rg.muted, fontWeight: FontWeight.w700, fontSize: 13));
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _Tile({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
        child: Row(children: [
          Icon(icon, color: c.red, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: TextStyle(color: c.ink, fontSize: 14.5))),
          Icon(Icons.chevron_right, color: c.muted),
        ]),
      ),
    );
  }
}

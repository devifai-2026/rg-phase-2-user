import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/app_config_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/rg_logo.dart';
import '../auth/phone_login_screen.dart';
import '../home/main_shell.dart';

/// Second splash — the blessing/tagline over a soft crimson glow. While it's
/// shown we bootstrap the session, then route to Home (if logged in) or the
/// phone login screen.
class SplashTwoScreen extends StatefulWidget {
  const SplashTwoScreen({super.key});

  @override
  State<SplashTwoScreen> createState() => _SplashTwoScreenState();
}

class _SplashTwoScreenState extends State<SplashTwoScreen> {
  @override
  void initState() {
    super.initState();
    _go();
  }

  Future<void> _go() async {
    final auth = context.read<AuthProvider>();
    // Run bootstrap and a minimum dwell time in parallel so the splash doesn't flash.
    await Future.wait([
      auth.bootstrap(),
      Future.delayed(const Duration(milliseconds: 1600)),
    ]);
    if (!mounted) return;
    final loggedIn = auth.status == AuthStatus.loggedIn;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (_, __, ___) => loggedIn ? const MainShell() : const PhoneLoginScreen(),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final appCfg = context.watch<AppConfigService>();
    final t = L10n.of(context);
    return Scaffold(
      backgroundColor: c.ground,
      body: Stack(
        children: [
          // Soft crimson radial glow behind the content.
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.3),
                  radius: 1.1,
                  colors: [c.redSoft, c.ground],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RgLogo(size: 96, brandName: appCfg.appName, logoUrl: appCfg.logoUrl),
                const SizedBox(height: 28),
                Text(
                  appCfg.appName, // tenant's real brand name (from /app-config), not the static default
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: c.ink),
                ),
                const SizedBox(height: 8),
                Text(
                  appCfg.tagline.isNotEmpty ? appCfg.tagline : t.tagline, // tenant tagline (localized) else static default
                  style: TextStyle(fontSize: 15, color: c.gold, fontWeight: FontWeight.w600, letterSpacing: 0.4),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    t.splashBlessing,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: c.muted, height: 1.5),
                  ),
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: 26,
                  height: 26,
                  child: CircularProgressIndicator(strokeWidth: 2.4, color: c.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/app_config_service.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/rg_logo.dart';
import 'splash_two_screen.dart';

/// First splash — the RG brand mark fades + scales in, then hands off to the
/// second splash. Pure intro animation; no logic.
class SplashOneScreen extends StatefulWidget {
  const SplashOneScreen({super.key});

  @override
  State<SplashOneScreen> createState() => _SplashOneScreenState();
}

class _SplashOneScreenState extends State<SplashOneScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;
  // True once the admin config has been resolved (either the cache already had a
  // splash, or the network refresh finished/failed). We DON'T render the branded
  // splash — or the fallback — until we know, so a tenant never flashes the
  // generic logo when they actually have a splash image set.
  bool _configReady = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1100))..forward();
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _scale = Tween(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack),
    );
    _prepare();
  }

  Future<void> _prepare() async {
    final cfg = context.read<AppConfigService>();
    final isDark = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    // If the cached config already has a splash image, we're ready instantly.
    // Otherwise wait for a fresh fetch (bounded) so a tenant with a configured
    // splash always sees it — the fallback logo only appears on real failure.
    if (cfg.splashImage(isDark) == null) {
      try { await cfg.refresh().timeout(const Duration(seconds: 6)); } catch (_) {/* fall back */}
    } else {
      cfg.refresh(); // keep it fresh in the background
    }
    if (!mounted) return;
    setState(() => _configReady = true);

    // Start the dwell only after config is resolved.
    final ms = (cfg.splash['durationMs'] as num?)?.toInt() ?? 1900;
    Future.delayed(Duration(milliseconds: ms.clamp(600, 6000)), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const SplashTwoScreen(),
          transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final cfg = context.watch<AppConfigService>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final splashImg = cfg.splashImage(isDark);
    final bg = _parseHex(cfg.splash['backgroundColor']) ?? c.ground;
    final fit = (cfg.splash['fit'] == 'contain') ? BoxFit.contain : BoxFit.cover;

    // Still resolving the admin config → neutral loader (no brand flash). We only
    // decide between the configured splash and the fallback once config is ready.
    if (!_configReady) {
      return Scaffold(
        backgroundColor: bg,
        body: Center(child: CircularProgressIndicator(color: c.red, strokeWidth: 2.4)),
      );
    }

    // Admin full-screen image splash (with the animated logo as fallback ONLY on
    // a genuine image load error).
    if (splashImg != null) {
      return Scaffold(
        backgroundColor: bg,
        body: FadeTransition(
          opacity: _fade,
          child: SizedBox.expand(
            child: Image.network(
              splashImg,
              fit: fit,
              errorBuilder: (_, __, ___) => Center(child: RgLogo(size: 150, showWordmark: true, brandName: cfg.appName)),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: RgLogo(size: 150, showWordmark: true, brandName: cfg.appName),
          ),
        ),
      ),
    );
  }
}

// '#AARRGGBB' / '0xAARRGGBB' / '#RRGGBB' → Color (null on bad input).
Color? _parseHex(dynamic v) {
  if (v == null) return null;
  var s = v.toString().trim().replaceAll('#', '').replaceAll('0x', '').replaceAll('0X', '');
  if (s.length == 6) s = 'FF$s';
  if (s.length != 8) return null;
  final n = int.tryParse(s, radix: 16);
  return n == null ? null : Color(n);
}

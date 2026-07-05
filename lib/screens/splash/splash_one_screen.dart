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

// Splash phases: exactly what the PO asked for —
//   loading : show a loader while we fetch the admin config (+ preload its image)
//   ready   : config resolved → show the tenant splash image (or branded logo)
//   failed  : the fetch failed AND we had no usable cached config → fallback logo
enum _Phase { loading, ready, failed }

class _SplashOneScreenState extends State<SplashOneScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;
  _Phase _phase = _Phase.loading;
  String? _readyImage; // the fully-preloaded splash image URL, if any

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

    // 1) Ensure we have config. Cached config = instant; otherwise wait for the
    //    network (bounded). Only if BOTH the fetch fails AND we have no cached
    //    config at all do we go to the fallback (failed) phase.
    var hadConfig = cfg.hasConfig;
    if (!hadConfig) {
      try {
        await cfg.refresh().timeout(const Duration(seconds: 8));
        hadConfig = cfg.hasConfig;
      } catch (_) {/* network failure */}
      if (!hadConfig) { // API failed AND nothing cached → fallback
        if (mounted) setState(() => _phase = _Phase.failed);
        _scheduleNext(cfg);
        return;
      }
    } else {
      cfg.refresh(); // have cache → refresh in the background
    }

    // 2) If the tenant set a splash image, PRELOAD it so we never flash a
    //    half-loaded image or the loader→image swap. On image failure → fallback.
    final img = cfg.splashImage(isDark);
    if (img != null) {
      try {
        await precacheImage(NetworkImage(img), context).timeout(const Duration(seconds: 8));
        if (mounted) setState(() { _readyImage = img; _phase = _Phase.ready; });
      } catch (_) {
        if (mounted) setState(() => _phase = _Phase.failed); // image couldn't load
      }
    } else {
      // No image configured → show the branded logo (ready, not a failure).
      if (mounted) setState(() => _phase = _Phase.ready);
    }
    _scheduleNext(cfg);
  }

  void _scheduleNext(AppConfigService cfg) {
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
    final bg = _parseHex(cfg.splash['backgroundColor']) ?? c.ground;
    final fit = (cfg.splash['fit'] == 'contain') ? BoxFit.contain : BoxFit.cover;

    Widget body;
    switch (_phase) {
      case _Phase.loading:
        // LOADER while we fetch config + preload the splash image. No brand flash.
        body = Center(child: CircularProgressIndicator(color: c.red, strokeWidth: 2.4));
        break;
      case _Phase.ready:
        // Config resolved. If the tenant set a splash image (preloaded) show it;
        // else show the branded (tenant-monogram) logo.
        body = _readyImage != null
            ? FadeTransition(opacity: _fade, child: SizedBox.expand(child: Image.network(_readyImage!, fit: fit)))
            : Center(
                child: FadeTransition(
                  opacity: _fade,
                  child: ScaleTransition(scale: _scale, child: RgLogo(size: 150, showWordmark: true, brandName: cfg.appName, logoUrl: cfg.logoUrl)),
                ),
              );
        break;
      case _Phase.failed:
        // API/image failure with no cached config → branded fallback logo.
        body = Center(
          child: FadeTransition(
            opacity: _fade,
            child: ScaleTransition(scale: _scale, child: RgLogo(size: 150, showWordmark: true, brandName: cfg.appName, logoUrl: cfg.logoUrl)),
          ),
        );
        break;
    }
    return Scaffold(backgroundColor: bg, body: body);
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/rg_colors.dart';

/// Disk + memory cached network image with consistent loading/error fallbacks.
/// Use everywhere instead of Image.network so images (categories, products,
/// avatars — which rarely change) load once and never re-download / flicker.
class CachedImage extends StatefulWidget {
  final String? url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final IconData fallbackIcon;

  /// Show a tappable "Retry" on load failure. On by default: a chat photo or a
  /// product shot that fails on a flaky mobile network is otherwise stuck as a
  /// broken-image icon until the whole screen is rebuilt.
  final bool retryable;

  const CachedImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.fallbackIcon = Icons.image_outlined,
    this.retryable = true,
  });

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  /// Bumped on Retry. Part of the CachedNetworkImage key, so a rebuild is a real
  /// refetch rather than a replay of the cached failure.
  int _attempt = 0;

  Future<void> _retry(String url) async {
    // Drop the failed entry, else the cache serves the same error straight back.
    await CachedNetworkImage.evictFromCache(url);
    if (mounted) setState(() => _attempt += 1);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final u = widget.url?.trim() ?? '';
    if (u.isEmpty) return _fallback(c, widget.fallbackIcon);
    return CachedNetworkImage(
      key: ValueKey('$u#$_attempt'),
      imageUrl: u,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      // Smooth fade once the (cached or fetched) image is ready.
      fadeInDuration: const Duration(milliseconds: 180),
      placeholder: (_, __) => Container(
        color: c.ground2,
        alignment: Alignment.center,
        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: c.muted)),
      ),
      errorWidget: (_, __, ___) => widget.retryable ? _retryTile(c, u) : _fallback(c, Icons.broken_image_outlined),
    );
  }

  /// Failure state that can recover itself — tap anywhere on the tile to refetch.
  Widget _retryTile(RgColors c, String url) => GestureDetector(
        onTap: () => _retry(url),
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: widget.width,
          height: widget.height,
          color: c.ground2,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh_rounded, color: c.muted, size: 24),
              const SizedBox(height: 4),
              Text('Retry', style: TextStyle(color: c.muted, fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );

  Widget _fallback(RgColors c, IconData icon) =>
      Container(color: c.ground2, alignment: Alignment.center, child: Icon(icon, color: c.muted, size: 28));
}

/// An ImageProvider variant (for CircleAvatar.backgroundImage / DecorationImage)
/// backed by the same disk cache.
ImageProvider? cachedImageProvider(String? url) {
  final u = url?.trim() ?? '';
  return u.isEmpty ? null : CachedNetworkImageProvider(u);
}

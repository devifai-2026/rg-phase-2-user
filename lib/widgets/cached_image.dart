import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/rg_colors.dart';

/// Disk + memory cached network image with consistent loading/error fallbacks.
/// Use everywhere instead of Image.network so images (categories, products,
/// avatars — which rarely change) load once and never re-download / flicker.
class CachedImage extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final IconData fallbackIcon;
  const CachedImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.fallbackIcon = Icons.image_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final u = url?.trim() ?? '';
    if (u.isEmpty) return _fallback(c, fallbackIcon);
    return CachedNetworkImage(
      imageUrl: u,
      fit: fit,
      width: width,
      height: height,
      // Smooth fade once the (cached or fetched) image is ready.
      fadeInDuration: const Duration(milliseconds: 180),
      placeholder: (_, __) => Container(
        color: c.ground2,
        alignment: Alignment.center,
        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: c.muted)),
      ),
      errorWidget: (_, __, ___) => _fallback(c, Icons.broken_image_outlined),
    );
  }

  Widget _fallback(RgColors c, IconData icon) =>
      Container(color: c.ground2, alignment: Alignment.center, child: Icon(icon, color: c.muted, size: 28));
}

/// An ImageProvider variant (for CircleAvatar.backgroundImage / DecorationImage)
/// backed by the same disk cache.
ImageProvider? cachedImageProvider(String? url) {
  final u = url?.trim() ?? '';
  return u.isEmpty ? null : CachedNetworkImageProvider(u);
}

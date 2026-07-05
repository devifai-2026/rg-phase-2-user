import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/rg_colors.dart';
import '../../../widgets/cached_image.dart';

/// Circular product chip (Products row): round image + label underneath.
/// Renders [imageUrl] when provided; otherwise an empty image placeholder.
class ProductChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String? imageUrl;
  const ProductChip({super.key, required this.label, required this.onTap, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: SizedBox(
          width: 70,
          child: Column(
            children: [
              Container(
                height: 64, width: 64,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: c.card,
                  border: Border.all(color: c.line),
                ),
                child: CachedImage(url: imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 7),
              Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: c.ink, fontSize: 11.5, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Video thumbnail card (Videos + Astrology's lessons rows) with a play overlay.
class VideoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double width;
  final String? thumbnail; // real YouTube thumbnail (admin-managed); null → placeholder
  const VideoCard({super.key, required this.title, required this.onTap, this.width = 168, this.thumbnail});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail (real YouTube image when available) + centered play button.
              Container(
                height: 98,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: c.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: c.line),
                  gradient: thumbnail == null
                      ? LinearGradient(colors: [c.ground2, c.card], begin: Alignment.topLeft, end: Alignment.bottomRight)
                      : null,
                  image: thumbnail != null
                      ? DecorationImage(image: NetworkImage(thumbnail!), fit: BoxFit.cover)
                      : null,
                ),
                child: Center(
                  child: Container(
                    height: 38, width: 38,
                    decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(9)),
                    child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 26),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Text(title, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: c.ink, fontSize: 12.5, fontWeight: FontWeight.w600, height: 1.25)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Circular icon shortcut used in the "Others" grid.
class OthersIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  /// Optional SVG asset; when set it renders instead of [icon] (tinted gold).
  final String? svgAsset;
  const OthersIcon({super.key, required this.icon, required this.label, required this.onTap, this.svgAsset});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 58, width: 58,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: c.ground2, border: Border.all(color: c.line)),
            child: svgAsset != null
                ? SvgPicture.asset(svgAsset!, width: 28, height: 28, colorFilter: ColorFilter.mode(c.gold, BlendMode.srcIn))
                : Icon(icon, color: c.gold, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
              style: TextStyle(color: c.ink, fontSize: 10.5, fontWeight: FontWeight.w500, height: 1.15)),
        ],
      ),
    );
  }
}

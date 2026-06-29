import 'dart:async';
import 'package:flutter/material.dart';
import '../../../theme/rg_colors.dart';
import '../../../widgets/cached_image.dart';

/// Swipeable image carousel with page dots. Optionally auto-advances. Falls back
/// to a placeholder when there are no images. Used by the product card (compact,
/// autoPlay) and the detail page (large, swipe + dots).
class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final bool autoPlay;
  final double? dotSize;
  const ImageCarousel({super.key, required this.images, this.autoPlay = false, this.dotSize});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final _controller = PageController();
  int _page = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay && widget.images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        if (!mounted || !_controller.hasClients) return;
        final next = (_page + 1) % widget.images.length;
        _controller.animateToPage(next, duration: const Duration(milliseconds: 450), curve: Curves.easeInOut);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final imgs = widget.images;
    if (imgs.isEmpty) {
      return Container(color: c.ground2, child: Icon(Icons.image_outlined, color: c.muted, size: 36));
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: imgs.length,
          onPageChanged: (i) => setState(() => _page = i),
          itemBuilder: (_, i) => CachedImage(url: imgs[i], fit: BoxFit.cover),
        ),
        if (imgs.length > 1)
          Positioned(
            bottom: 8, left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imgs.length, (i) {
                final active = i == _page;
                final s = widget.dotSize ?? 6.0;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: s, width: active ? s * 2.4 : s,
                  decoration: BoxDecoration(
                    color: active ? Colors.white : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(s),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

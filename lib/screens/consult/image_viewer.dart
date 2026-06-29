import 'package:flutter/material.dart';

import '../../widgets/cached_image.dart';

/// Full-screen, pinch-to-zoom viewer for a chat image. Tap anywhere or the
/// close button to dismiss. Used by both the user and astrologer chat bubbles.
class ImageViewer extends StatelessWidget {
  final String url;
  const ImageViewer({super.key, required this.url});

  static void open(BuildContext context, String url) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black,
      pageBuilder: (_, __, ___) => ImageViewer(url: url),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4,
                child: Center(child: CachedImage(url: url, fit: BoxFit.contain)),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

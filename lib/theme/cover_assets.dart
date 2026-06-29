/// Cover-photo sources for astrologer profiles (FB/LinkedIn-style banner).
///
/// Source pages (provided by the client):
///   • https://unsplash.com/photos/lunar-eclipse-illustration-TbuescuqMjA
///   • https://unsplash.com/photos/a-picture-of-the-stars-in-the-night-sky-teadNyAXDro
///
/// Until real per-astrologer covers come from the backend, we rotate through
/// this set so different astrologers show different covers (not one shared one).
/// Swap these for the exact direct URLs of the photos above, or GCS-hosted
/// covers, when available.
class CoverAssets {
  static const lunarEclipsePage = 'https://unsplash.com/photos/lunar-eclipse-illustration-TbuescuqMjA';
  static const starsNightSkyPage = 'https://unsplash.com/photos/a-picture-of-the-stars-in-the-night-sky-teadNyAXDro';

  /// Rotating cover set (cosmic / night-sky themed direct Unsplash CDN URLs).
  static const covers = [
    'https://images.unsplash.com/photo-1532693322450-2cb5c511067d?auto=format&fit=crop&w=1200&q=70', // lunar eclipse vibe
    'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?auto=format&fit=crop&w=1200&q=70', // stars / night sky
    'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?auto=format&fit=crop&w=1200&q=70', // milky way
    'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?auto=format&fit=crop&w=1200&q=70', // cosmos
  ];

  /// Pick a stable cover for a given astrologer (by name hash) so it doesn't
  /// flicker between rebuilds.
  static String coverFor(String key) {
    if (covers.isEmpty) return '';
    var h = 0;
    for (final ch in key.codeUnits) {
      h = (h * 31 + ch) & 0x7fffffff;
    }
    return covers[h % covers.length];
  }

  /// Back-compat default.
  static String get coverUrl => covers.first;
}

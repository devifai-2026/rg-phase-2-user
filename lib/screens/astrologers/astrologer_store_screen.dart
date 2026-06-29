import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../api/astrologer_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../../widgets/slide_route.dart';
import '../shop/product_detail_screen.dart';
import '../pooja/pooja_detail_screen.dart';

/// A themed accent per store template key (mirrors the astrologer app themes).
/// Shiva is red; each template recolors the storefront's hero + accents.
/// Storefront theme record. `motifSvg` (when non-null) is an AI-generated inline
/// SVG drawn in the hero instead of the [motif] icon.
typedef StoreTheme = ({List<Color> bg, Color accent, Color accent2, IconData motif, String? motifSvg, String? heroImage});

StoreTheme _theme(String key) {
  switch (key) {
    case 'shiva':
      return (bg: const [Color(0xFF3A0A0A), Color(0xFF120303)], accent: const Color(0xFFFF5436), accent2: const Color(0xFFE0B7A0), motif: Icons.change_history, motifSvg: null, heroImage: null);
    case 'cosmic':
      return (bg: const [Color(0xFF1C1030), Color(0xFF0A0617)], accent: const Color(0xFFB98CFF), accent2: const Color(0xFFF2C879), motif: Icons.auto_awesome, motifSvg: null, heroImage: null);
    case 'royal':
      return (bg: const [Color(0xFF2B0B12), Color(0xFF140509)], accent: const Color(0xFFD4AF37), accent2: const Color(0xFFE0556B), motif: Icons.workspace_premium, motifSvg: null, heroImage: null);
    case 'rudraksh':
    default:
      return (bg: const [Color(0xFF2A1A0E), Color(0xFF120B06)], accent: const Color(0xFFE8A33D), accent2: const Color(0xFFB5651D), motif: Icons.spa, motifSvg: null, heroImage: null);
  }
}

Color _specHex(String? v, Color fallback) {
  if (v == null || !RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(v)) return fallback;
  return Color(int.parse('FF${v.substring(1)}', radix: 16));
}

/// Resolve the storefront theme: the AI-designed [layoutSpec] when present,
/// otherwise the picked preset [theme]. Prefers the AI-generated hero IMAGE; the
/// SVG motif is a legacy fallback. Server-validated, with per-field defaults.
StoreTheme _resolveTheme(Storefront? s) {
  final base = _theme(s?.theme ?? 'rudraksh');
  final spec = s?.layoutSpec;
  if (spec == null) return base;
  final bg = (spec['bgGradient'] as List?)?.cast<dynamic>().map((e) => e?.toString()).toList() ?? const [];
  final svg = (spec['motifSvg'] ?? '').toString();
  final hero = (spec['heroImage'] ?? '').toString();
  return (
    bg: [
      _specHex(bg.isNotEmpty ? bg[0] : null, base.bg.first),
      _specHex(bg.length > 1 ? bg[1] : null, base.bg.last),
    ],
    accent: _specHex(spec['accent'] as String?, base.accent),
    accent2: _specHex(spec['accent2'] as String?, base.accent2),
    motif: base.motif,
    motifSvg: svg.trim().startsWith('<svg') ? svg : null,
    heroImage: hero.startsWith('http') ? hero : null,
  );
}

/// The seeker-facing storefront for an astrologer: themed link-in-bio page with
/// the astrologer's approved products + poojas. Tapping an item opens its detail
/// screen (existing Buy Now / Book flow, paid from the wallet). [profileId] is
/// the AstrologerProfile id.
class AstrologerStoreScreen extends StatefulWidget {
  final String profileId;
  const AstrologerStoreScreen({super.key, required this.profileId});

  @override
  State<AstrologerStoreScreen> createState() => _AstrologerStoreScreenState();
}

class _AstrologerStoreScreenState extends State<AstrologerStoreScreen> with WidgetsBindingObserver {
  Storefront? _store;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Refetch when the user returns to the app — the astrologer may have just
    // generated/activated a new storefront design (and the AI hero image lands
    // asynchronously a few seconds after generation), so a one-time initState
    // load would otherwise show a stale store.
    if (state == AppLifecycleState.resumed) _load(silent: true);
  }

  Future<void> _load({bool silent = false}) async {
    final t = L10n.of(context);
    try {
      final s = await context.read<AstrologerApi>().storefront(widget.profileId);
      if (mounted) setState(() { _store = s; _error = null; });
    } catch (_) {
      // On a silent (resume/refresh) reload, keep showing what we have rather
      // than replacing the store with an error.
      if (mounted && !silent) setState(() => _error = t.couldNotLoadThisStore);
    }
  }

  void _openItem(StoreItem it) {
    if (it.isPooja) {
      Navigator.of(context).push(slideRoute(PoojaDetailScreen(poojaId: it.id)));
    } else {
      Navigator.of(context).push(slideRoute(ProductDetailScreen(productId: it.id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final s = _store;
    final th = _resolveTheme(s);

    // The AI-generated artwork (when present) is the FULL-PAGE background — it
    // sits behind the hero AND the product/pooja cards, with a gradient scrim so
    // text/cards stay legible. Falls back to the theme gradient colour.
    final bgImage = th.heroImage;

    return Scaffold(
      backgroundColor: th.bg.last,
      body: s == null
          ? (_error != null
              ? _ErrorView(message: _error!, color: c)
              : const Center(child: CircularProgressIndicator()))
          : Stack(
            children: [
              if (bgImage != null) ...[
                Positioned.fill(child: CachedImage(url: bgImage, fit: BoxFit.cover)),
                // Scrim: darken the lower portion so cards/text read over the art.
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          th.bg.last.withValues(alpha: 0.15),
                          th.bg.last.withValues(alpha: 0.72),
                          th.bg.last.withValues(alpha: 0.92),
                        ],
                        stops: const [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
              RefreshIndicator(
              onRefresh: () => _load(silent: true),
              child: CustomScrollView(
              // Always scrollable so pull-to-refresh works even when the store is short.
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _Hero(store: s, th: th, onBack: () => Navigator.of(context).maybePop())),
                if (s.products.isNotEmpty) ...[
                  _sectionHeader(th, L10n.of(context).products),
                  _grid(s.products, th),
                ],
                if (s.poojas.isNotEmpty) ...[
                  _sectionHeader(th, L10n.of(context).poojas),
                  _grid(s.poojas, th),
                ],
                if (s.products.isEmpty && s.poojas.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(L10n.of(context).thisStoreHasNoItemsYet, style: TextStyle(color: th.accent2)),
                    )),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 28)),
              ],
            ),
          ),
            ],
          ),
    );
  }

  SliverToBoxAdapter _sectionHeader(StoreTheme th, String t) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
          child: Row(children: [
            Container(width: 3, height: 16, decoration: BoxDecoration(color: th.accent, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
          ]),
        ),
      );

  SliverPadding _grid(List<StoreItem> items, StoreTheme th) =>
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.72),
          delegate: SliverChildBuilderDelegate(
            (_, i) => _ItemCard(item: items[i], th: th, onTap: () => _openItem(items[i])),
            childCount: items.length,
          ),
        ),
      );
}

class _Hero extends StatelessWidget {
  final Storefront store;
  final StoreTheme th;
  final VoidCallback onBack;
  const _Hero({required this.store, required this.th, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: th.bg, begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Stack(clipBehavior: Clip.none, children: [
        SizedBox(
          // AI hero is a tall designed background; give it more height. Falls
          // back to the real cover photo, then a gradient.
          height: th.heroImage != null ? 220 : 150,
          width: double.infinity,
          child: th.heroImage != null
              ? CachedImage(url: th.heroImage, fit: BoxFit.cover)
              : (store.coverPhoto != null && store.coverPhoto!.isNotEmpty)
                  ? CachedImage(url: store.coverPhoto, fit: BoxFit.cover)
                  : DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [th.accent.withValues(alpha: 0.5), th.accent2.withValues(alpha: 0.2)]))),
        ),
        // Decorative motif only when there's NO AI hero image (the image already
        // carries its own astrology motifs). SVG, else the preset icon.
        if (th.heroImage == null)
          Positioned(
            right: -8, top: top,
            child: th.motifSvg != null
                ? SvgPicture.string(
                    th.motifSvg!,
                    width: 120, height: 120,
                    colorFilter: ColorFilter.mode(th.accent.withValues(alpha: 0.28), BlendMode.srcIn),
                    placeholderBuilder: (_) => Icon(th.motif, size: 120, color: th.accent.withValues(alpha: 0.25)),
                  )
                : Icon(th.motif, size: 120, color: th.accent.withValues(alpha: 0.25)),
          ),
        Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, th.bg.first])))),
        Positioned(top: top + 4, left: 4, child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: onBack)),
        Padding(
          padding: const EdgeInsets.only(top: 96),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [th.accent, th.accent2])),
              child: CircleAvatar(
                radius: 40, backgroundColor: th.bg.last,
                backgroundImage: cachedImageProvider(store.avatar),
                child: cachedImageProvider(store.avatar) == null
                    ? Text(store.name.isNotEmpty ? store.name[0].toUpperCase() : 'A', style: TextStyle(color: th.accent, fontWeight: FontWeight.w800, fontSize: 28))
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            Text(store.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20)),
            if (store.bio.isNotEmpty) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(store.bio, textAlign: TextAlign.center, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: th.accent2, fontSize: 12.5, height: 1.4)),
              ),
            ],
            const SizedBox(height: 10),
            Wrap(spacing: 8, children: [
              _chip(th, Icons.star, '${store.rating} (${store.reviewCount})'),
              _chip(th, Icons.favorite, store.followers >= 1000 ? L10n.of(context).storeFollowers1000Tostringasfixed1K((store.followers / 1000).toStringAsFixed(1)) : '${store.followers}'),
            ]),
            const SizedBox(height: 6),
          ]),
        ),
      ]),
    );
  }

  Widget _chip(StoreTheme th, IconData icon, String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(20), border: Border.all(color: th.accent.withValues(alpha: 0.4))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 12, color: th.accent),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w600)),
        ]),
      );
}

class _ItemCard extends StatelessWidget {
  final StoreItem item;
  final StoreTheme th;
  final VoidCallback onTap;
  const _ItemCard({required this.item, required this.th, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final discount = item.mrp > item.price ? (((item.mrp - item.price) / item.mrp) * 100).round() : 0;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(16), border: Border.all(color: th.accent.withValues(alpha: 0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: (item.image != null && item.image!.isNotEmpty)
                  ? CachedImage(url: item.image, fit: BoxFit.cover)
                  : Container(color: Colors.white.withValues(alpha: 0.04), child: Icon(item.isPooja ? Icons.local_fire_department : Icons.inventory_2_outlined, color: th.accent, size: 34)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
              const SizedBox(height: 4),
              Row(children: [
                Text('₹${item.price}', style: TextStyle(color: th.accent, fontWeight: FontWeight.w800, fontSize: 14)),
                if (discount > 0) ...[
                  const SizedBox(width: 6),
                  Text('₹${item.mrp}', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 11, decoration: TextDecoration.lineThrough)),
                ],
              ]),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [th.accent, th.accent2]), borderRadius: BorderRadius.circular(9)),
                child: Text(item.isPooja ? L10n.of(context).book : L10n.of(context).buy, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final RgColors color;
  const _ErrorView({required this.message, required this.color});
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.storefront_outlined, color: Colors.white54, size: 48),
            const SizedBox(height: 12),
            Text(message, style: const TextStyle(color: Colors.white70)),
          ]),
        ),
      );
}

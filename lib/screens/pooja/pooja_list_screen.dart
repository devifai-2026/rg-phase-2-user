import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../api/pooja_api.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'pooja_detail_screen.dart';

/// Pooja catalog (live): dynamic category chips, debounced search, filters
/// (max budget + min capacity) and pooja cards. Tap a pooja → detail screen.
class PoojaListScreen extends StatefulWidget {
  /// Optional: open pre-filtered to a category (used by category banners).
  final String? initialCategoryId;
  const PoojaListScreen({super.key, this.initialCategoryId});
  @override
  State<PoojaListScreen> createState() => _PoojaListScreenState();
}

class _PoojaListScreenState extends State<PoojaListScreen> {
  late final PoojaApi _api;
  final _search = TextEditingController();
  Timer? _debounce;

  List<PoojaCategory> _categories = [];
  String? _categoryId; // null = All
  double _maxPrice = 25000;
  int _minPersons = 0; // 0 = any; else only poojas allowing ≥ this many

  List<Pooja> _poojas = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _api = context.read<PoojaApi>();
    _categoryId = widget.initialCategoryId; // pre-filter when opened from a category banner
    _loadCategories();
    _loadPoojas();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    try {
      final cats = await _api.categories();
      if (mounted) setState(() => _categories = cats);
    } catch (_) {/* chips just stay at All */}
  }

  Future<void> _loadPoojas() async {
    setState(() { _loading = true; _error = null; });
    try {
      final q = _search.text.trim();
      final filtering = _categoryId != null || q.isNotEmpty || _minPersons > 0 || _maxPrice < 25000;
      // Default "All" tab uses the dedicated endpoint; filtered views use /types.
      final list = filtering
          ? await _api.types(
              q: q,
              categoryId: _categoryId,
              maxPersons: _minPersons,
              maxPrice: _maxPrice < 25000 ? _maxPrice.round() : null,
            )
          : await _api.all();
      if (mounted) setState(() { _poojas = list; _loading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = L10n.of(context).couldNotLoadPoojas; _loading = false; });
    }
  }

  // Debounce the search box so we don't hit the API on every keystroke.
  void _onSearchChanged(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), _loadPoojas);
  }

  int get _activeFilters => (_maxPrice < 25000 ? 1 : 0) + (_minPersons > 0 ? 1 : 0);

  Future<void> _openFilters() async {
    final c = context.rg;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(builder: (ctx, setSheet) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 12, 20, 16 + MediaQuery.of(ctx).padding.bottom),
          decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(22)), border: Border.all(color: c.line)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2)))),
              const SizedBox(height: 16),
              Text(L10n.of(context).filterPoojas, style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: 18),

              // Max budget.
              Text(L10n.of(context).maxBudgetMaxpriceRound(_maxPrice.round()), style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
              Slider(
                value: _maxPrice, min: 500, max: 25000, divisions: 49,
                activeColor: c.red, label: '₹${_maxPrice.round()}',
                onChanged: (v) => setSheet(() => _maxPrice = v),
              ),
              const SizedBox(height: 12),

              // Min persons capacity.
              Text(L10n.of(context).minPersonsSupported, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [0, 1, 2, 3, 4].map((n) {
                  final sel = _minPersons == n;
                  return ChoiceChip(
                    label: Text(n == 0 ? L10n.of(context).any : '$n+'),
                    selected: sel,
                    onSelected: (_) => setSheet(() => _minPersons = n),
                    showCheckmark: false,
                    backgroundColor: c.ground2,
                    selectedColor: c.redSoft,
                    side: BorderSide(color: sel ? c.red : c.line),
                    labelStyle: TextStyle(color: sel ? c.red : c.muted, fontWeight: FontWeight.w600),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              Row(children: [
                Expanded(child: OutlinedButton(
                  onPressed: () => setSheet(() { _maxPrice = 25000; _minPersons = 0; }),
                  style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48), side: BorderSide(color: c.line)),
                  child: Text(L10n.of(context).reset, style: TextStyle(color: c.ink)),
                )),
                const SizedBox(width: 12),
                Expanded(child: ElevatedButton(
                  onPressed: () { Navigator.of(ctx).pop(); _loadPoojas(); },
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                  child: Text(L10n.of(context).apply),
                )),
              ]),
            ],
          ),
        );
      }),
    );
  }

  void _selectCategory(String? id) {
    setState(() => _categoryId = id);
    _loadPoojas();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(L10n.of(context).bookAPooja, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        actions: [
          Stack(children: [
            IconButton(onPressed: _openFilters, icon: Icon(Icons.tune, color: c.ink, size: 22)),
            if (_activeFilters > 0)
              Positioned(
                right: 6, top: 6,
                child: Container(
                  padding: const EdgeInsets.all(2), constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                  decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.ground, width: 1.5)),
                  child: Text('$_activeFilters', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w800)),
                ),
              ),
          ]),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
            child: TextField(
              controller: _search,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: L10n.of(context).searchPoojas,
                prefixIcon: Icon(Icons.search, color: c.muted, size: 21),
                isDense: true,
              ),
            ),
          ),
          // Dynamic category chips ("All" + admin categories).
          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length + 1,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final isAll = i == 0;
                final cat = isAll ? null : _categories[i - 1];
                final sel = isAll ? _categoryId == null : _categoryId == cat!.id;
                return ChoiceChip(
                  label: Text(isAll ? L10n.of(context).all : cat!.name),
                  selected: sel,
                  onSelected: (_) => _selectCategory(isAll ? null : cat!.id),
                  showCheckmark: false,
                  backgroundColor: c.ground2,
                  selectedColor: c.redSoft,
                  side: BorderSide(color: sel ? c.red : c.line),
                  labelStyle: TextStyle(color: sel ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 13),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          Expanded(child: _buildList(c)),
        ],
      ),
    );
  }

  Widget _buildList(RgColors c) {
    if (_loading) return const Center(child: CircularProgress());
    if (_error != null) {
      return _Empty(icon: Icons.cloud_off, title: _error!, action: 'Retry', onAction: _loadPoojas);
    }
    if (_poojas.isEmpty) {
      // If a category/search/filter is narrowing the results, offer a one-tap
      // way back to everything (common when a category has no poojas yet).
      final narrowed = _categoryId != null || _search.text.trim().isNotEmpty || _minPersons > 0 || _maxPrice < 25000;
      return _Empty(
        icon: Icons.temple_hindu_outlined,
        title: L10n.of(context).noPoojasHere,
        subtitle: narrowed ? L10n.of(context).nothingMatchesTheCurrentFilters : L10n.of(context).noPoojasAvailableYet,
        action: narrowed ? L10n.of(context).showAllPoojas : null,
        onAction: narrowed ? () {
          _search.clear();
          setState(() { _categoryId = null; _minPersons = 0; _maxPrice = 25000; });
          _loadPoojas();
        } : null,
      );
    }
    return RefreshIndicator(
      onRefresh: _loadPoojas,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _poojas.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final p = _poojas[i];
          return _PoojaCard(
            pooja: p,
            onTap: () => Navigator.of(context).push(slideRoute(PoojaDetailScreen(poojaId: p.id))),
          );
        },
      ),
    );
  }
}

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30, width: 30,
        child: CircularProgressIndicator(strokeWidth: 2.5, color: context.rg.red),
      );
}

class _Empty extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? action;
  final VoidCallback? onAction;
  const _Empty({required this.icon, required this.title, this.subtitle, this.action, this.onAction});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: c.muted),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700)),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle!, style: TextStyle(color: c.muted, fontSize: 12.5)),
          ],
          if (action != null) ...[
            const SizedBox(height: 14),
            OutlinedButton(onPressed: onAction, child: Text(action!)),
          ],
        ],
      ),
    );
  }
}

class _PoojaCard extends StatelessWidget {
  final Pooja pooja;
  final VoidCallback onTap;
  const _PoojaCard({required this.pooja, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final img = pooja.listImage ?? ''; // portrait preferred for cards
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: c.line),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 14, offset: const Offset(0, 6))],
          ),
          clipBehavior: Clip.antiAlias,
          // Fixed height so the stretched image column has a bounded constraint.
          child: SizedBox(
            height: 134,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Wider image with price badge.
                SizedBox(
                  width: 120,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (img.isEmpty)
                        Container(
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [c.gold.withValues(alpha: 0.35), c.card], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                          child: Icon(Icons.temple_hindu, color: c.gold, size: 40),
                        )
                      else
                        Image.network(img, fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(color: c.card, child: Icon(Icons.temple_hindu_outlined, color: c.gold, size: 36))),
                      Positioned(
                        left: 6, bottom: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: pooja.isFree ? c.green : c.red, borderRadius: BorderRadius.circular(8)),
                          child: Text(pooja.priceLabel, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                // Dense info column: fills the height, no centered float / dead space.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 11, 8, 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (pooja.categoryName != null)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                              decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(20)),
                              child: Text(pooja.categoryName!, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.red, fontSize: 10.5, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        const SizedBox(height: 6),
                        Text(pooja.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15.5, height: 1.1)),
                        const SizedBox(height: 3),
                        // Description fills the remaining space, truncated with “…”.
                        Expanded(
                          child: Text(
                            (pooja.description ?? '').isNotEmpty ? pooja.description! : L10n.of(context).tapToViewDetailsBook,
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.35),
                          ),
                        ),
                        // Bottom metadata row.
                        Row(children: [
                          if (pooja.durationLabel.isNotEmpty) _meta(c, Icons.schedule, pooja.durationLabel),
                          if (pooja.maxPersons > 0) _meta(c, Icons.group_outlined, L10n.of(context).upToPoojaMaxpersons(pooja.maxPersons)),
                          if (pooja.bookedLabel.isNotEmpty) _meta(c, Icons.event_available_outlined, pooja.bookedLabel),
                        ]),
                        // Availability window — only when admin set one.
                        if (pooja.availabilityLabel.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Row(children: [
                              Icon(Icons.event_available, size: 12, color: c.gold),
                              const SizedBox(width: 4),
                              Flexible(child: Text(pooja.availabilityLabel, maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: c.gold, fontSize: 10.5, fontWeight: FontWeight.w600))),
                            ]),
                          ),
                      ],
                    ),
                  ),
                ),
                // Chevron — vertically centered on the card's right edge.
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_forward_ios, size: 13, color: c.muted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _meta(RgColors c, IconData icon, String label) => Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 13, color: c.muted),
          const SizedBox(width: 3),
          Text(label, style: TextStyle(color: c.muted, fontSize: 11)),
        ]),
      );
}

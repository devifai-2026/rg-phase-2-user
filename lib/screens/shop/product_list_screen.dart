import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/category_api.dart';
import '../../api/product_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'product_detail_screen.dart';
import 'widgets/product_card.dart';
import 'widgets/cart_icon_button.dart';

/// Products directory — search + category chips + filters + smooth pagination,
/// shown as a 2-column grid of carousel cards. [initialCategoryId] pre-selects
/// a category (used when a Products chip is tapped on Home).
class ProductListScreen extends StatefulWidget {
  final String? initialCategoryId;
  final String? title;
  const ProductListScreen({super.key, this.initialCategoryId, this.title});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final ProductApi _api;
  final _search = TextEditingController();
  final _scroll = ScrollController();
  Timer? _debounce;

  List<Category> _cats = [];
  String? _catId; // selected category id (null = All)

  // Filters.
  int? _minPrice, _maxPrice;
  bool _inStock = false;
  String _sort = 'newest';
  int get _activeFilters => (_minPrice != null ? 1 : 0) + (_maxPrice != null ? 1 : 0) + (_inStock ? 1 : 0) + (_sort != 'newest' ? 1 : 0);

  static const _pageSize = 20;
  List<Product> _items = [];
  bool _loading = true, _loadingMore = false, _hasMore = true;
  int _page = 1;
  String? _error;

  @override
  void initState() {
    super.initState();
    _api = context.read<ProductApi>();
    _catId = widget.initialCategoryId;
    _scroll.addListener(_onScroll);
    _loadCategories();
    _load();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    try {
      final cats = await context.read<CategoryApi>().list();
      if (mounted) setState(() => _cats = cats);
    } catch (_) {/* chips optional */}
  }

  /// App-bar title reflects the CURRENTLY selected category (live), not the
  /// static title it was opened with — so tapping "All" resets it to "Products".
  String get _title {
    if (_catId == null) return 'Products';
    final cat = _cats.where((x) => x.id == _catId).firstOrNull;
    return cat?.name ?? widget.title ?? 'Products';
  }

  String get _sortParam => switch (_sort) {
        'price_asc' => 'price_asc',
        'price_desc' => 'price_desc',
        'rating' => 'rating',
        _ => '',
      };

  Future<void> _load() async {
    final hadItems = _items.isNotEmpty;
    setState(() { _loading = !hadItems; _error = null; _page = 1; });
    try {
      final list = await _api.list(
        category: _catId, q: _search.text.trim(),
        minPrice: _minPrice, maxPrice: _maxPrice, inStock: _inStock ? true : null,
        sort: _sortParam, page: 1, limit: _pageSize,
      );
      if (!mounted) return;
      setState(() { _items = list; _hasMore = list.length >= _pageSize; _loading = false; });
    } catch (_) {
      if (mounted) setState(() { _loading = false; if (!hadItems) _error = L10n.of(context).couldNotLoadProducts; });
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore || _loading) return;
    setState(() => _loadingMore = true);
    try {
      final next = _page + 1;
      final more = await _api.list(
        category: _catId, q: _search.text.trim(),
        minPrice: _minPrice, maxPrice: _maxPrice, inStock: _inStock ? true : null,
        sort: _sortParam, page: next, limit: _pageSize,
      );
      if (mounted) setState(() { _items = [..._items, ...more]; _page = next; _hasMore = more.length >= _pageSize; _loadingMore = false; });
    } catch (_) {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  void _onScroll() {
    if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 400) _loadMore();
  }

  void _onSearch(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), _load);
  }

  Future<void> _openFilters() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FiltersSheet(
        minPrice: _minPrice, maxPrice: _maxPrice, inStock: _inStock, sort: _sort,
        onApply: (min, max, stock, sort) {
          setState(() { _minPrice = min; _maxPrice = max; _inStock = stock; _sort = sort; });
          _load();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(_title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
        actions: [
          const CartIconButton(),
          Stack(children: [
            IconButton(onPressed: _openFilters, icon: Icon(Icons.tune, color: c.ink, size: 22)),
            if (_activeFilters > 0)
              Positioned(right: 6, top: 6, child: Container(
                padding: const EdgeInsets.all(2), constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.ground, width: 1.5)),
                child: Text('$_activeFilters', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w800)),
              )),
          ]),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // Search.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
            child: TextField(
              controller: _search, textInputAction: TextInputAction.search, onChanged: _onSearch,
              decoration: InputDecoration(hintText: L10n.of(context).searchProducts, prefixIcon: Icon(Icons.search, color: c.muted, size: 21), isDense: true),
            ),
          ),
          // Category chips (All + admin categories).
          if (_cats.isNotEmpty)
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _cats.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final isAll = i == 0;
                  final cat = isAll ? null : _cats[i - 1];
                  final sel = isAll ? _catId == null : _catId == cat!.id;
                  return ChoiceChip(
                    label: Text(isAll ? L10n.of(context).all : cat!.name),
                    selected: sel,
                    onSelected: (_) { setState(() => _catId = isAll ? null : cat!.id); _load(); },
                    showCheckmark: false,
                    backgroundColor: c.ground2, selectedColor: c.redSoft,
                    side: BorderSide(color: sel ? c.red : c.line),
                    labelStyle: TextStyle(color: sel ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 13),
                  );
                },
              ),
            ),
          const SizedBox(height: 6),
          Expanded(child: _buildBody(c)),
        ],
      ),
    );
  }

  Widget _buildBody(RgColors c) {
    if (_loading) return Center(child: CircularProgressIndicator(color: c.red));
    if (_error != null) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.cloud_off, color: c.muted, size: 40), const SizedBox(height: 12),
        Text(_error!, style: TextStyle(color: c.ink)), const SizedBox(height: 12),
        OutlinedButton(onPressed: _load, child: Text(L10n.of(context).retry)),
      ]));
    }
    if (_items.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.shopping_bag_outlined, color: c.muted, size: 44), const SizedBox(height: 12),
        Text(L10n.of(context).noProductsFound, style: TextStyle(color: c.muted)),
      ]));
    }
    return RefreshIndicator(
      onRefresh: _load,
      child: GridView.builder(
        controller: _scroll,
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Fixed cell HEIGHT (image 150 + details) → no leftover gap under the
          // buttons regardless of column width.
          crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, mainAxisExtent: 318,
        ),
        itemCount: _items.length + (_hasMore ? 2 : 0),
        itemBuilder: (_, i) {
          if (i >= _items.length) {
            return const Center(child: Padding(padding: EdgeInsets.all(16),
              child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2.4))));
          }
          final p = _items[i];
          return ProductCard(product: p, onTap: () => Navigator.of(context).push(slideRoute(ProductDetailScreen(productId: p.id, preview: p))));
        },
      ),
    );
  }
}

/// Bottom-sheet filters: price range, in-stock, sort.
class _FiltersSheet extends StatefulWidget {
  final int? minPrice, maxPrice;
  final bool inStock;
  final String sort;
  final void Function(int? min, int? max, bool inStock, String sort) onApply;
  const _FiltersSheet({this.minPrice, this.maxPrice, required this.inStock, required this.sort, required this.onApply});

  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  late final TextEditingController _min = TextEditingController(text: widget.minPrice?.toString() ?? '');
  late final TextEditingController _max = TextEditingController(text: widget.maxPrice?.toString() ?? '');
  late bool _inStock = widget.inStock;
  late String _sort = widget.sort;

  static const _sorts = [('newest', 'Newest'), ('price_asc', 'Price: Low→High'), ('price_desc', 'Price: High→Low'), ('rating', 'Top rated')];

  @override
  void dispose() { _min.dispose(); _max.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(22))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(height: 4, width: 40, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2)))),
          const SizedBox(height: 16),
          Text(L10n.of(context).filters, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 16),
          Text(L10n.of(context).priceRange, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: TextField(controller: _min, keyboardType: TextInputType.number, decoration: InputDecoration(hintText: L10n.of(context).min, isDense: true))),
            const SizedBox(width: 12),
            Expanded(child: TextField(controller: _max, keyboardType: TextInputType.number, decoration: InputDecoration(hintText: L10n.of(context).max, isDense: true))),
          ]),
          const SizedBox(height: 16),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(L10n.of(context).inStockOnly, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w600)),
            value: _inStock, onChanged: (v) => setState(() => _inStock = v),
          ),
          const SizedBox(height: 8),
          Text(L10n.of(context).sortBy, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final s in _sorts)
              ChoiceChip(
                label: Text(s.$2), selected: _sort == s.$1,
                onSelected: (_) => setState(() => _sort = s.$1),
                showCheckmark: false, backgroundColor: c.ground2, selectedColor: c.redSoft,
                side: BorderSide(color: _sort == s.$1 ? c.red : c.line),
                labelStyle: TextStyle(color: _sort == s.$1 ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 12.5),
              ),
          ]),
          const SizedBox(height: 22),
          Row(children: [
            Expanded(child: OutlinedButton(
              onPressed: () { widget.onApply(null, null, false, 'newest'); Navigator.pop(context); },
              child: Text(L10n.of(context).clear),
            )),
            const SizedBox(width: 12),
            Expanded(child: ElevatedButton(
              onPressed: () {
                widget.onApply(
                  int.tryParse(_min.text.trim()), int.tryParse(_max.text.trim()), _inStock, _sort,
                );
                Navigator.pop(context);
              },
              child: Text(L10n.of(context).apply),
            )),
          ]),
        ],
      ),
    );
  }
}

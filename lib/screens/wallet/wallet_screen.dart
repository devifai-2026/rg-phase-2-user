import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_config.dart';
import '../../api/wallet_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'payment_webview_screen.dart';

/// Wallet page (live): balance, recharge packs (PayU is the single pay entry
/// point), and the transactions list. Recharge opens PayU in the browser; on
/// return the balance is refreshed.
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with WidgetsBindingObserver {
  late final WalletApi _api;
  int _balance = 0;
  List<RechargePack> _packs = [];
  List<WalletTxn> _txns = [];
  bool _loading = true;
  bool _txnLoading = false;
  // True when the server revalidation failed AND we had no cached balance/txns to
  // show — so the UI can offer Retry instead of a confident (but wrong) ₹0 / empty.
  bool _loadFailed = false;
  // Transaction filters.
  int? _filterDays; // null = all time; else 7/14/30
  String? _filterSource; // null = all; else 'recharge'/'pooja'/'call'/…
  // Pagination.
  static const _pageSize = 20;
  int _txnPage = 1;
  bool _txnHasMore = true;
  bool _txnLoadingMore = false;
  final _scroll = ScrollController();

  // Time-range chips.
  static const _ranges = [(null, 'All'), (7, '7d'), (14, '14d'), (30, '30d')];
  // Category chips (value → label). Covers the spend sources users will see.
  static const _cats = [
    (null, 'All'), ('recharge', 'Recharge'), ('pooja', 'Pooja'),
    ('call', 'Call'), ('chat', 'Chat'), ('video', 'Video'),
    ('gift', 'Gift'), ('product', 'Shop'),
  ];

  @override
  void initState() {
    super.initState();
    _api = context.read<WalletApi>();
    WidgetsBinding.instance.addObserver(this);
    _scroll.addListener(_onScroll);
    _load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  // Load the next page when near the bottom (infinite scroll).
  void _onScroll() {
    if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 300) { _loadMore(); }
  }

  // Returning from the PayU browser tab → refresh the balance/txns.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refresh();
  }

  Future<void> _load() async {
    // Show cached packs instantly (admin-managed, rarely change) so the "Add
    // money" section renders without waiting on the network.
    final cached = await _api.cachedPacks();
    if (!mounted) return;
    if (cached.isNotEmpty) {
      setState(() { _packs = cached; _loading = false; });
    } else {
      setState(() => _loading = true);
    }

    // Revalidate everything from the server in the background (txns = page 1).
    try {
      final results = await Future.wait([
        _api.balance(), _api.packs(),
        _api.transactions(page: 1, limit: _pageSize, source: _filterSource, days: _filterDays),
      ]);
      if (!mounted) return;
      final t = results[2] as List<WalletTxn>;
      setState(() {
        _balance = results[0] as int;
        _packs = results[1] as List<RechargePack>;
        _txns = t;
        _txnPage = 1;
        _txnHasMore = t.length >= _pageSize;
        _loading = false;
        _loadFailed = false;
      });
      context.read<WalletProvider>().setBalance(_balance); // keep Home top bar in sync
    } catch (_) {
      // Keep any cached packs, but flag the failure so we don't present a
      // confident ₹0 / empty history as if it were real, loaded data.
      if (mounted) setState(() { _loading = false; _loadFailed = true; });
    }
  }

  Future<void> _refresh() async {
    try {
      final b = await _api.balance();
      final t = await _api.transactions(page: 1, limit: _pageSize, source: _filterSource, days: _filterDays);
      if (mounted) {
        setState(() { _balance = b; _txns = t; _txnPage = 1; _txnHasMore = t.length >= _pageSize; });
        context.read<WalletProvider>().setBalance(b);
      }
    } catch (_) {/* keep current */}
  }

  // Re-fetch page 1 when a filter chip changes (resets pagination).
  Future<void> _loadTxns() async {
    setState(() { _txnLoading = true; _txnPage = 1; });
    try {
      final t = await _api.transactions(page: 1, limit: _pageSize, source: _filterSource, days: _filterDays);
      if (mounted) setState(() { _txns = t; _txnHasMore = t.length >= _pageSize; _txnLoading = false; });
    } catch (_) {
      if (mounted) setState(() => _txnLoading = false);
    }
  }

  // Append the next page (infinite scroll).
  Future<void> _loadMore() async {
    if (_txnLoadingMore || !_txnHasMore || _txnLoading) return;
    setState(() => _txnLoadingMore = true);
    try {
      final next = _txnPage + 1;
      final more = await _api.transactions(page: next, limit: _pageSize, source: _filterSource, days: _filterDays);
      if (mounted) {
        setState(() {
          _txns = [..._txns, ...more];
          _txnPage = next;
          _txnHasMore = more.length >= _pageSize;
          _txnLoadingMore = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _txnLoadingMore = false);
    }
  }

  bool _starting = false;
  Future<void> _recharge(RechargePack pack) async {
    if (_starting) return;
    setState(() => _starting = true);
    try {
      final txnid = await _api.initiateRecharge(pack.amount);
      if (!mounted) return;
      if (txnid.isEmpty) { _toast(L10n.of(context).couldNotStartRecharge); return; }
      // Open the PayU checkout INSIDE the app (WebView) — never the browser.
      final url = '${ApiConfig.host}/api/payments/payu/recharge-redirect/$txnid';
      final result = await Navigator.of(context).push<bool>(
        slideRoute(PaymentWebViewScreen(url: url, title: L10n.of(context).securePayment)),
      );
      if (!mounted) return;
      if (result == true) {
        _toast(L10n.of(context).paymentSuccessful);
      } else if (result == false) {
        _toast(L10n.of(context).paymentWasNotCompleted);
      }
      // Either way, refresh balance/txns (success credits; the callback may also
      // have arrived via ngrok). Cancelled (null) just re-syncs.
      await _refresh();
    } catch (_) {
      if (mounted) _toast(L10n.of(context).couldNotStartRechargeTryAgain);
    } finally {
      if (mounted) setState(() => _starting = false);
    }
  }

  void _toast(String m) {
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(L10n.of(context).wallet, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          controller: _scroll,
          padding: const EdgeInsets.all(16),
          children: [
            // Balance card.
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(colors: [c.redDeep, c.red], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(L10n.of(context).availableBalance, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13)),
                  const SizedBox(height: 6),
                  Text('₹$_balance', style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(L10n.of(context).useItForPoojasConsultations, style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Row(children: [
              Text(L10n.of(context).addMoney, style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(width: 8),
              Icon(Icons.bolt, size: 16, color: c.gold),
              Text(L10n.of(context).instantTopUp, style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 12),
            if (_loading)
              Padding(padding: const EdgeInsets.all(24), child: Center(child: CircularProgressIndicator(color: c.red)))
            else if (_packs.isEmpty)
              Text(L10n.of(context).noRechargePacksAvailableRightNow, style: TextStyle(color: c.muted, fontSize: 13))
            else
              // Premium horizontal rail of recharge tiles.
              SizedBox(
                height: 152,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: _packs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => _PackCard(pack: _packs[i], onTap: () => _recharge(_packs[i])),
                ),
              ),
            const SizedBox(height: 20),

            Row(children: [
              Text(L10n.of(context).transactions, style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800)),
              const Spacer(),
              if (_filterDays != null || _filterSource != null)
                GestureDetector(
                  onTap: () { setState(() { _filterDays = null; _filterSource = null; }); _loadTxns(); },
                  child: Row(children: [
                    Icon(Icons.close, size: 13, color: c.red),
                    const SizedBox(width: 3),
                    Text(L10n.of(context).clear, style: TextStyle(color: c.red, fontSize: 12, fontWeight: FontWeight.w700)),
                  ]),
                ),
            ]),
            const SizedBox(height: 12),

            // Time-range: a tidy segmented control.
            _SegmentedRange(
              c: c,
              items: _ranges.map((r) => (r.$1 as Object?, r.$2)).toList(),
              selected: _filterDays,
              onSelect: (v) { setState(() => _filterDays = v as int?); _loadTxns(); },
            ),
            const SizedBox(height: 10),
            // Category filter pills (horizontally scrollable).
            _ChipRow(
              c: c, scroll: true,
              items: _cats.map((r) => (r.$1 as Object?, r.$2)).toList(),
              selected: _filterSource,
              onSelect: (v) { setState(() => _filterSource = v as String?); _loadTxns(); },
            ),
            const SizedBox(height: 16),

            if (_txnLoading)
              Padding(padding: const EdgeInsets.all(20), child: Center(child: CircularProgressIndicator(color: c.red)))
            else if (_loadFailed && _txns.isEmpty)
              // Load failed and we have nothing to show — offer Retry rather than
              // pretending the history is empty.
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
                child: Column(children: [
                  Icon(Icons.cloud_off_outlined, color: c.muted, size: 34),
                  const SizedBox(height: 10),
                  Text(L10n.of(context).errNetwork, style: TextStyle(color: c.muted, fontSize: 13), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _load,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(L10n.of(context).retry),
                    style: OutlinedButton.styleFrom(foregroundColor: c.red, side: BorderSide(color: c.red)),
                  ),
                ]),
              )
            else if (_txns.isEmpty)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
                child: Column(children: [
                  Icon(Icons.receipt_long_outlined, color: c.muted, size: 34),
                  const SizedBox(height: 10),
                  Text(
                    (_filterDays != null || _filterSource != null) ? L10n.of(context).noTransactionsMatchTheseFilters : L10n.of(context).noTransactionsYet,
                    style: TextStyle(color: c.muted, fontSize: 13), textAlign: TextAlign.center,
                  ),
                ]),
              )
            else ...[
              // Grouped, premium list inside one rounded container.
              Container(
                decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    for (int i = 0; i < _txns.length; i++) ...[
                      if (i > 0) Divider(height: 1, color: c.line),
                      _TxnRow(txn: _txns[i]),
                    ],
                  ],
                ),
              ),
              if (_txnLoadingMore)
                Padding(padding: const EdgeInsets.all(16), child: Center(child: SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: c.red))))
              else if (!_txnHasMore && _txns.length > _pageSize - 1)
                Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: Center(child: Text(L10n.of(context).endOfTransactions, style: TextStyle(color: c.muted, fontSize: 11.5)))),
            ],
          ],
        ),
      ),
    );
  }
}

/// A row of single-select filter chips. `selected`/values are generic (int? for
/// the time range, String? for the category). `scroll` = horizontal scroller.
/// Category filter pills — soft-filled selected state (premium, calm).
class _ChipRow extends StatelessWidget {
  final RgColors c;
  final List<(Object?, String)> items;
  final Object? selected;
  final void Function(Object?) onSelect;
  final bool scroll;
  const _ChipRow({required this.c, required this.items, required this.selected, required this.onSelect, this.scroll = false});

  @override
  Widget build(BuildContext context) {
    final chips = items.map((it) {
      final sel = selected == it.$1;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () => onSelect(it.$1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: sel ? c.redSoft : c.ground2,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: sel ? c.red : c.line, width: sel ? 1.3 : 1),
            ),
            child: Text(it.$2, style: TextStyle(color: sel ? c.red : c.muted, fontWeight: FontWeight.w700, fontSize: 12.5)),
          ),
        ),
      );
    }).toList();
    if (scroll) {
      return SizedBox(height: 38, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.zero, children: chips));
    }
    return Wrap(children: chips);
  }
}

/// Time-range segmented control (7d / 14d / 30d / All) — a single rounded
/// track with a sliding-feel highlighted segment.
class _SegmentedRange extends StatelessWidget {
  final RgColors c;
  final List<(Object?, String)> items;
  final Object? selected;
  final void Function(Object?) onSelect;
  const _SegmentedRange({required this.c, required this.items, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
      child: Row(
        children: items.map((it) {
          final sel = selected == it.$1;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(it.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  gradient: sel ? LinearGradient(colors: [c.red, c.redDeep]) : null,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: sel ? [BoxShadow(color: c.red.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 2))] : null,
                ),
                child: Text(it.$2, textAlign: TextAlign.center,
                    style: TextStyle(color: sel ? Colors.white : c.muted, fontWeight: FontWeight.w700, fontSize: 12.5)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Premium recharge tile (horizontal rail). Emphasizes the credited value,
/// shows a bonus + admin badge, and a clear "Pay ₹N" footer.
class _PackCard extends StatelessWidget {
  final RechargePack pack;
  final VoidCallback onTap;
  const _PackCard({required this.pack, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final hasBadge = pack.badge != null && pack.badge!.isNotEmpty;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: hasBadge ? c.gold.withValues(alpha: 0.6) : c.line, width: hasBadge ? 1.4 : 1),
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [c.ground2, c.card],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(L10n.of(context).youGet, style: TextStyle(color: c.muted, fontSize: 10.5, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text('₹${pack.tokens}', style: TextStyle(color: c.ink, fontSize: 26, fontWeight: FontWeight.w900, height: 1)),
                  const SizedBox(height: 6),
                  if (pack.bonus > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                      decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(6)),
                      child: Text(L10n.of(context).packBonusBonus(pack.bonus), style: TextStyle(color: c.gold, fontSize: 10, fontWeight: FontWeight.w800)),
                    )
                  else if ((pack.name ?? '').isNotEmpty)
                    Text(pack.name!, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.muted, fontSize: 11, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  // Pay footer.
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [c.red, c.redDeep]), borderRadius: BorderRadius.circular(10)),
                    child: Text(L10n.of(context).payPackAmount(pack.amount), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                  ),
                ],
              ),
            ),
            // Corner badge (e.g. POPULAR / BEST VALUE).
            if (hasBadge)
              Positioned(
                right: 0, top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: c.gold, borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomLeft: Radius.circular(10))),
                  child: Text(pack.badge!.toUpperCase(), style: const TextStyle(color: Color(0xFF1A1408), fontSize: 8.5, fontWeight: FontWeight.w900, letterSpacing: 0.3)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TxnRow extends StatelessWidget {
  final WalletTxn txn;
  const _TxnRow({required this.txn});

  static const _months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  // Per-source icon + friendly label.
  static (IconData, String) _meta(String source, bool credit) {
    switch (source) {
      case 'recharge': return (Icons.add_card_rounded, 'Money added');
      case 'pooja': return (Icons.temple_hindu_rounded, 'Pooja booking');
      case 'call': return (Icons.call_rounded, 'Call');
      case 'chat': return (Icons.chat_bubble_rounded, 'Chat');
      case 'video': return (Icons.videocam_rounded, 'Video call');
      case 'gift': return (Icons.card_giftcard_rounded, 'Gift');
      case 'product': return (Icons.shopping_bag_rounded, 'Shop order');
      case 'refund': return (Icons.undo_rounded, 'Refund');
      case 'bonus': return (Icons.auto_awesome_rounded, 'Bonus');
      default: return (credit ? Icons.south_west_rounded : Icons.north_east_rounded, credit ? 'Credited' : 'Debited');
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final credit = txn.isCredit;
    final color = credit ? c.green : c.red;
    final (icon, label) = _meta(txn.source, credit);
    final title = (txn.description != null && txn.description!.isNotEmpty) ? txn.description! : label;
    final d = txn.createdAt;
    final dateStr = d != null ? '${d.day} ${_months[d.month]} ${d.year}' : '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(children: [
        Container(
          height: 40, width: 40,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.13), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color, size: 19),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
          if (dateStr.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(dateStr, style: TextStyle(color: c.muted, fontSize: 11)),
          ],
        ])),
        const SizedBox(width: 8),
        Text('${credit ? '+' : '−'} ₹${txn.amount}', style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 14.5)),
      ]),
    );
  }
}

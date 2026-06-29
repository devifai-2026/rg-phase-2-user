import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api_client.dart';
import '../../api/order_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'product_detail_screen.dart';

String _prettyStatus(String s) =>
    s.replaceAll('_', ' ').split(' ').map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}').join(' ');

Color _statusColor(RgColors c, String s) {
  switch (s) {
    case 'delivered':
      return c.green;
    case 'cancelled':
    case 'refunded':
      return c.red;
    case 'shipped':
    case 'out_for_delivery':
      return c.blue;
    default:
      return c.gold;
  }
}

/// "Your Orders" — the signed-in user's order history. Tapping an order opens
/// its full detail (items, timeline, invoice download).
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _loading = true;
  String? _error;
  List<Order> _orders = const [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final orders = await context.read<OrderApi>().myOrders();
      if (!mounted) return;
      setState(() {
        _orders = orders;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e is ApiException ? e.message : e.toString().replaceAll('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(L10n.of(context).yourOrders, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? _Retry(message: _error!, onRetry: _load)
                : _orders.isEmpty
                    ? _EmptyOrders(c: c)
                    : RefreshIndicator(
                        onRefresh: _load,
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(14, 12, 14, 20),
                          itemCount: _orders.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (_, i) => _OrderCard(
                            order: _orders[i],
                            onTap: () => Navigator.of(context).push(slideRoute(OrderDetailScreen(orderId: _orders[i].id, initial: _orders[i]))),
                          ),
                        ),
                      ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;
  const _OrderCard({required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final sc = _statusColor(c, order.status);
    final date = order.createdAt != null ? DateFormat(L10n.of(context).dMmmYyyyHMmA).format(order.createdAt!) : '';
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text('#${order.id.length > 6 ? order.id.substring(order.id.length - 6).toUpperCase() : order.id}',
                style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14, fontFamily: 'monospace')),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(color: sc.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(20)),
              child: Text(_prettyStatus(order.status), style: TextStyle(color: sc, fontWeight: FontWeight.w700, fontSize: 11)),
            ),
          ]),
          if (date.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(date, style: TextStyle(color: c.muted, fontSize: 12)),
          ],
          const SizedBox(height: 10),
          Text(
            order.items.map((i) => '${i.name} × ${i.qty}').join(', '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.35),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text('${order.itemCount} item${order.itemCount == 1 ? '' : 's'}', style: TextStyle(color: c.muted, fontSize: 12)),
            const Spacer(),
            Text('₹${order.total}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 15)),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: c.muted, size: 20),
          ]),
        ]),
      ),
    );
  }
}

class _EmptyOrders extends StatelessWidget {
  final RgColors c;
  const _EmptyOrders({required this.c});
  @override
  Widget build(BuildContext context) {
    return ListView(
      // ListView so RefreshIndicator-less empty state still fills; centered content.
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.18),
        Icon(Icons.receipt_long_outlined, color: c.muted, size: 64),
        const SizedBox(height: 16),
        Center(child: Text(L10n.of(context).noOrdersYet, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 18))),
        const SizedBox(height: 8),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(L10n.of(context).yourOrdersWillAppearHereOnce,
                textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.5)),
          ),
        ),
      ],
    );
  }
}

/// Full order detail: items (tap → product), bill, timeline, invoice download.
class OrderDetailScreen extends StatefulWidget {
  final String orderId;
  final Order? initial;
  const OrderDetailScreen({super.key, required this.orderId, this.initial});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  Order? _order;
  bool _loading = true;
  String? _error;

  OrderInvoice? _invoice;
  bool _downloadingInvoice = false;

  @override
  void initState() {
    super.initState();
    _order = widget.initial;
    _loading = widget.initial == null;
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    try {
      final api = context.read<OrderApi>();
      final order = await api.getOrder(widget.orderId);
      OrderInvoice? inv;
      if (order.paymentStatus == 'paid') {
        try { inv = await api.invoice(widget.orderId); } catch (_) {/* not ready */}
      }
      if (!mounted) return;
      setState(() {
        _order = order;
        _invoice = inv;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        if (_order == null) _error = e is ApiException ? e.message : e.toString().replaceAll('Exception: ', '');
      });
    }
  }

  Future<void> _downloadInvoice() async {
    final inv = _invoice;
    if (inv == null || _downloadingInvoice) return;
    final l10n = L10n.of(context);
    setState(() => _downloadingInvoice = true);
    try {
      // Refresh in case the PDF just became ready.
      final fresh = await context.read<OrderApi>().invoice(widget.orderId);
      if (mounted) setState(() => _invoice = fresh);
      final url = fresh.pdfUrl;
      if (url == null || url.isEmpty) {
        _toast(l10n.invoiceIsStillBeingGeneratedTry);
        return;
      }
      final uri = Uri.tryParse(url);
      if (uri != null && await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _toast(l10n.couldNotOpenTheInvoice);
      }
    } catch (e) {
      _toast(e is ApiException ? e.message : l10n.couldNotDownloadInvoice);
    } finally {
      if (mounted) setState(() => _downloadingInvoice = false);
    }
  }

  void _toast(String m) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(m), behavior: SnackBarBehavior.floating));

  Future<void> _openHelp(Order order) async {
    final thanksMsg = L10n.of(context).thanksOurTeamWillReachOut;
    final sent = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _HelpSheet(orderId: order.id, orderNo: order.id.length > 6 ? order.id.substring(order.id.length - 6).toUpperCase() : order.id),
    );
    if (sent == true) _toast(thanksMsg);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final order = _order;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        elevation: 0,
        title: Text(L10n.of(context).orderDetails, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19)),
        actions: [
          if (order != null)
            TextButton.icon(
              onPressed: () => _openHelp(order),
              icon: Icon(Icons.help_outline, size: 18, color: c.red),
              label: Text(L10n.of(context).needHelp, style: TextStyle(color: c.red, fontWeight: FontWeight.w700)),
            ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : order == null
                ? _Retry(message: _error ?? L10n.of(context).orderNotFound, onRetry: _load)
                : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                    children: [
                      _header(c, order),
                      const SizedBox(height: 18),
                      _section(c, Icons.shopping_bag_outlined, L10n.of(context).products),
                      const SizedBox(height: 8),
                      ...order.items.map((it) => _itemRow(c, it)),
                      const SizedBox(height: 18),
                      _section(c, Icons.location_on_outlined, L10n.of(context).deliveryAddress),
                      const SizedBox(height: 8),
                      _addressBox(c, order),
                      const SizedBox(height: 18),
                      _section(c, Icons.receipt_long_outlined, L10n.of(context).billDetails),
                      const SizedBox(height: 8),
                      _billBox(c, order),
                      const SizedBox(height: 18),
                      _section(c, Icons.timeline_outlined, L10n.of(context).activityTimeline),
                      const SizedBox(height: 8),
                      _timeline(c, order),
                      const SizedBox(height: 18),
                      _invoiceBox(c, order),
                      const SizedBox(height: 18),
                      OutlinedButton.icon(
                        onPressed: () => _openHelp(order),
                        icon: const Icon(Icons.support_agent_outlined, size: 20),
                        label: Text(L10n.of(context).needHelpWithThisOrder),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: c.red,
                          side: BorderSide(color: c.red.withValues(alpha: 0.5)),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _header(RgColors c, Order order) {
    final sc = _statusColor(c, order.status);
    final date = order.createdAt != null ? DateFormat(L10n.of(context).eeeDMmmYyyyHMm).format(order.createdAt!) : '';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text('#${order.id.length > 6 ? order.id.substring(order.id.length - 6).toUpperCase() : order.id}',
              style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 16, fontFamily: 'monospace')),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: sc.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(20)),
            child: Text(_prettyStatus(order.status), style: TextStyle(color: sc, fontWeight: FontWeight.w700, fontSize: 12)),
          ),
        ]),
        if (date.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(L10n.of(context).placedOnDate(date), style: TextStyle(color: c.muted, fontSize: 12.5)),
        ],
      ]),
    );
  }

  Widget _section(RgColors c, IconData icon, String text) => Row(children: [
        Icon(icon, size: 17, color: c.gold),
        const SizedBox(width: 7),
        Text(text, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14.5)),
      ]);

  Widget _itemRow(RgColors c, OrderItem it) {
    final hasProduct = (it.productId ?? '').isNotEmpty;
    return InkWell(
      onTap: hasProduct ? () => Navigator.of(context).push(slideRoute(ProductDetailScreen(productId: it.productId!))) : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
        child: Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(it.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
              const SizedBox(height: 3),
              Text('₹${it.price} × ${it.qty}', style: TextStyle(color: c.muted, fontSize: 12)),
            ]),
          ),
          const SizedBox(width: 10),
          Text('₹${it.lineTotal}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
          if (hasProduct) Icon(Icons.chevron_right, color: c.muted, size: 18),
        ]),
      ),
    );
  }

  Widget _addressBox(RgColors c, Order order) {
    final a = order.address;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if ((a.name ?? '').isNotEmpty) Text(a.name!, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 2),
        Text(a.oneLine, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.35)),
        if ((a.phone ?? '').isNotEmpty) Text(a.phone!, style: TextStyle(color: c.muted, fontSize: 12)),
      ]),
    );
  }

  Widget _billBox(RgColors c, Order order) {
    Widget row(String l, String v, {Color? vc, bool bold = false}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.5),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(l, style: TextStyle(color: bold ? c.ink : c.muted, fontSize: bold ? 15 : 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w500)),
            Text(v, style: TextStyle(color: vc ?? c.ink, fontSize: bold ? 17 : 13.5, fontWeight: bold ? FontWeight.w900 : FontWeight.w700)),
          ]),
        );
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Column(children: [
        row(L10n.of(context).itemsSubtotal, '₹${order.subtotal}'),
        if (order.discount > 0) row('Discount${order.couponCode != null ? ' (${order.couponCode})' : ''}', '− ₹${order.discount}', vc: c.green),
        Divider(color: c.line, height: 18),
        row(L10n.of(context).totalPaid, '₹${order.total}', bold: true),
      ]),
    );
  }

  Widget _timeline(RgColors c, Order order) {
    // Newest first — latest activity on top.
    final events = order.timeline.isNotEmpty
        ? order.timeline.reversed.toList()
        : [OrderEvent(label: L10n.of(context).orderPlaced2, at: order.createdAt)];
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (int i = 0; i < events.length; i++) _timelineRow(c, events[i], last: i == events.length - 1),
      ]),
    );
  }

  Widget _timelineRow(RgColors c, OrderEvent e, {required bool last}) {
    final when = e.at != null ? DateFormat(L10n.of(context).dMmmHMmA).format(e.at!) : '';
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [
          Container(margin: const EdgeInsets.only(top: 3), height: 11, width: 11, decoration: BoxDecoration(color: c.red, shape: BoxShape.circle)),
          if (!last) Expanded(child: Container(width: 2, color: c.line)),
        ]),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: last ? 0 : 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(e.label, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
              if (when.isNotEmpty || (e.note ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text([when, e.note].where((s) => (s ?? '').isNotEmpty).join(' · '), style: TextStyle(color: c.muted, fontSize: 11.5)),
                ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _invoiceBox(RgColors c, Order order) {
    if (order.paymentStatus != 'paid') return const SizedBox.shrink();
    final inv = _invoice;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.line)),
      child: Row(children: [
        Icon(Icons.description_outlined, color: c.gold, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(L10n.of(context).invoice, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
            Text(inv?.invoiceNo.isNotEmpty == true ? inv!.invoiceNo : L10n.of(context).generating,
                style: TextStyle(color: c.muted, fontSize: 12, fontFamily: 'monospace')),
          ]),
        ),
        ElevatedButton.icon(
          onPressed: (inv == null || _downloadingInvoice) ? null : _downloadInvoice,
          icon: _downloadingInvoice
              ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Icon(Icons.download_outlined, size: 18),
          label: Text(L10n.of(context).download),
          style: ElevatedButton.styleFrom(minimumSize: const Size(120, 44)),
        ),
      ]),
    );
  }
}

class _Retry extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _Retry({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.error_outline, color: c.red, size: 48),
          const SizedBox(height: 14),
          Text(message, textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 14)),
          const SizedBox(height: 18),
          ElevatedButton(onPressed: onRetry, style: ElevatedButton.styleFrom(minimumSize: const Size(140, 46)), child: Text(L10n.of(context).retry)),
        ]),
      ),
    );
  }
}

/// "Need help" bottom sheet — pick a reason + describe the issue, then submit.
/// Pops `true` on success.
class _HelpSheet extends StatefulWidget {
  final String orderId;
  final String orderNo;
  const _HelpSheet({required this.orderId, required this.orderNo});

  @override
  State<_HelpSheet> createState() => _HelpSheetState();
}

class _HelpSheetState extends State<_HelpSheet> {
  String _category = orderSupportCategories.keys.first;
  final _msg = TextEditingController();
  bool _sending = false;
  String? _err;

  @override
  void dispose() {
    _msg.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_sending) return;
    if (_msg.text.trim().isEmpty) {
      setState(() => _err = L10n.of(context).pleaseDescribeTheIssue);
      return;
    }
    setState(() {
      _sending = true;
      _err = null;
    });
    try {
      await context.read<OrderApi>().requestSupport(widget.orderId, category: _category, message: _msg.text.trim());
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _sending = false;
        _err = e is ApiException ? e.message : e.toString().replaceAll('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(child: Container(height: 4, width: 44, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(4)))),
              const SizedBox(height: 16),
              Row(children: [
                Icon(Icons.support_agent_outlined, color: c.red, size: 22),
                const SizedBox(width: 8),
                Text(L10n.of(context).needHelp2, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 18)),
              ]),
              const SizedBox(height: 4),
              Text(L10n.of(context).orderWidgetOrderno(widget.orderNo), style: TextStyle(color: c.muted, fontSize: 13)),
              const SizedBox(height: 16),
              Text(L10n.of(context).whatWentWrong, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
              const SizedBox(height: 8),
              Wrap(spacing: 8, runSpacing: 8, children: orderSupportCategories.entries.map((e) {
                final sel = e.key == _category;
                return InkWell(
                  onTap: () => setState(() => _category = e.key),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: sel ? c.redSoft : c.card,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: sel ? c.red : c.line, width: sel ? 1.5 : 1),
                    ),
                    child: Text(e.value, style: TextStyle(color: sel ? c.red : c.ink, fontWeight: sel ? FontWeight.w700 : FontWeight.w500, fontSize: 12.5)),
                  ),
                );
              }).toList()),
              const SizedBox(height: 16),
              Text(L10n.of(context).describeTheIssue, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
              const SizedBox(height: 8),
              TextField(
                controller: _msg,
                maxLines: 4,
                maxLength: 2000,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: L10n.of(context).tellUsWhatHappenedSoWe,
                  errorText: _err,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _sending ? null : _submit,
                style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(52)),
                child: _sending
                    ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                    : Text(L10n.of(context).submitRequest, style: const TextStyle(fontWeight: FontWeight.w800)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

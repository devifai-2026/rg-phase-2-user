import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/notification_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/notifications_provider.dart';
import '../../theme/rg_colors.dart';

/// Notifications inbox, wired to /notifications. Tap to mark read, swipe or the
/// trailing button to delete one, "Mark all read" + "Clear all" in the app bar.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh on open so the list + unread badge are current.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationsProvider>().load();
    });
  }

  // Map a backend notification `type` to an icon.
  IconData _iconFor(String type) {
    switch (type) {
      case 'incoming_request':
      case 'missed_call':
        return Icons.call_outlined;
      case 'astrologer_available':
        return Icons.person;
      case 'order_status':
        return Icons.shopping_bag_outlined;
      case 'withdrawal_status':
      case 'wallet':
        return Icons.account_balance_wallet_outlined;
      case 'pooja_status':
        return Icons.local_fire_department_outlined;
      case 'gift_received':
        return Icons.card_giftcard;
      case 'escalation':
        return Icons.report_gmailerrorred_outlined;
      default:
        return Icons.auto_awesome;
    }
  }

  String _timeAgo(BuildContext context, DateTime? dt) {
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return L10n.of(context).justNow;
    if (diff.inMinutes < 60) return L10n.of(context).diffInminutesMAgo(diff.inMinutes);
    if (diff.inHours < 24) return L10n.of(context).diffInhoursHAgo(diff.inHours);
    if (diff.inDays < 7) return L10n.of(context).diffIndaysDAgo(diff.inDays);
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  Future<void> _confirmClearAll() async {
    final c = context.rg;
    final prov = context.read<NotificationsProvider>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: c.ground2,
        title: Text(L10n.of(context).clearAllNotifications, style: TextStyle(color: c.ink)),
        content: Text(L10n.of(context).thisPermanentlyDeletesAllYourNotifications, style: TextStyle(color: c.muted)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(L10n.of(context).cancel, style: TextStyle(color: c.muted))),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(L10n.of(context).clearAll, style: TextStyle(color: c.red, fontWeight: FontWeight.w700))),
        ],
      ),
    );
    if (ok == true) await prov.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final prov = context.watch<NotificationsProvider>();
    final items = prov.items;

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        title: Text(L10n.of(context).notifications, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        actions: [
          if (prov.unread > 0)
            TextButton(
              onPressed: prov.markAllRead,
              child: Text(L10n.of(context).markAllRead, style: TextStyle(color: c.red, fontSize: 13, fontWeight: FontWeight.w600)),
            ),
          if (items.isNotEmpty)
            IconButton(tooltip: L10n.of(context).clearAll, onPressed: _confirmClearAll, icon: Icon(Icons.delete_sweep_outlined, color: c.ink)),
        ],
      ),
      body: RefreshIndicator(
        color: c.red,
        onRefresh: prov.load,
        child: _body(c, prov, items),
      ),
    );
  }

  Widget _body(RgColors c, NotificationsProvider prov, List<AppNotification> items) {
    // First load with nothing yet → spinner.
    if (prov.loading && !prov.loaded) {
      return Center(child: CircularProgressIndicator(color: c.red));
    }
    if (prov.error != null && items.isEmpty) {
      return _Message(c, icon: Icons.wifi_off_rounded, title: L10n.of(context).couldNotLoad, hint: prov.error!, onRetry: prov.load);
    }
    if (items.isEmpty) {
      // ListView so pull-to-refresh works even when empty.
      return ListView(children: [SizedBox(height: MediaQuery.of(context).size.height * 0.25), _Empty(c)]);
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final n = items[i];
        return Dismissible(
          key: ValueKey(n.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => prov.delete(n),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.delete_outline, color: Colors.white),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => prov.tap(n),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: n.isRead ? c.ground2 : c.redSoft,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: n.isRead ? c.line : c.red.withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(11), border: Border.all(color: c.line)),
                    child: Icon(_iconFor(n.type), color: c.gold, size: 21),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(n.title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14))),
                            if (!n.isRead) Container(height: 8, width: 8, decoration: BoxDecoration(color: c.red, shape: BoxShape.circle)),
                          ],
                        ),
                        if (n.body.isNotEmpty) ...[
                          const SizedBox(height: 3),
                          Text(n.body, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.3)),
                        ],
                        const SizedBox(height: 6),
                        Text(_timeAgo(context, n.createdAt), style: TextStyle(color: c.muted, fontSize: 11)),
                      ],
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => prov.delete(n),
                    icon: Icon(Icons.close, size: 18, color: c.muted),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Empty extends StatelessWidget {
  final RgColors c;
  const _Empty(this.c);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 84, width: 84,
            decoration: BoxDecoration(color: c.redSoft, borderRadius: BorderRadius.circular(22)),
            child: Icon(Icons.notifications_none_rounded, color: c.red, size: 40),
          ),
          const SizedBox(height: 18),
          Text(L10n.of(context).noNotifications, style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(L10n.of(context).youReAllCaughtUp, style: TextStyle(color: c.muted, fontSize: 13)),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final RgColors c;
  final IconData icon;
  final String title;
  final String hint;
  final Future<void> Function() onRetry;
  const _Message(this.c, {required this.icon, required this.title, required this.hint, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.22),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: c.muted, size: 44),
              const SizedBox(height: 14),
              Text(title, style: TextStyle(color: c.ink, fontSize: 17, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text(hint, style: TextStyle(color: c.muted, fontSize: 13)),
              const SizedBox(height: 16),
              OutlinedButton(onPressed: onRetry, child: Text(L10n.of(context).retry)),
            ],
          ),
        ),
      ],
    );
  }
}

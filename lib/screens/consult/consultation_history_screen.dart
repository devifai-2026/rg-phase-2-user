import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/session_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';
import 'chat_history_screen.dart';

/// The user's past consultations (chat/call/video) with duration + coins
/// deducted. Backed by GET /sessions. Filter chips switch the `?type=` query.
///
/// Note: chat *message history* is retained for 7 days only (server TTL) — but
/// these session summary rows persist. Completed chat rows whose transcript is
/// still within the window expose a "View chat" affordance (canViewChat); once
/// the window lapses they show a subtle "History expired" label instead.
class ConsultationHistoryScreen extends StatefulWidget {
  const ConsultationHistoryScreen({super.key});

  @override
  State<ConsultationHistoryScreen> createState() => _ConsultationHistoryScreenState();
}

/// (label shown on the chip, backend `type` value — null == All).
const _filters = <(String, String?)>[
  ('All', null),
  ('Chat', 'chat'),
  ('Audio', 'call'),
  ('Video', 'video'),
];

class _ConsultationHistoryScreenState extends State<ConsultationHistoryScreen> {
  List<SessionInfo>? _items;
  String? _error;
  int _filter = 0; // index into _filters

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _items = null;
      _error = null;
    });
    try {
      final items = await context.read<SessionApi>().history(limit: 50, type: _filters[_filter].$2);
      if (mounted) setState(() => _items = items);
    } catch (_) {
      if (mounted) setState(() => _error = L10n.of(context).couldNotLoadYourConsultations);
    }
  }

  void _selectFilter(int i) {
    if (i == _filter) return;
    setState(() => _filter = i);
    _load();
  }

  IconData _icon(String type) => switch (type) {
        'call' => Icons.call,
        'video' => Icons.videocam,
        _ => Icons.chat_bubble_outline,
      };

  String _typeLabel(BuildContext context, String type) => switch (type) {
        'call' => L10n.of(context).audio,
        'video' => L10n.of(context).video,
        'chat' => L10n.of(context).chat,
        _ => '${type[0].toUpperCase()}${type.substring(1)}',
      };

  String _statusLabel(BuildContext context, SessionInfo s) {
    if (s.status == 'completed') return L10n.of(context).durSDurationsecSTotalamountCoins(_dur(s.durationSec), s.totalAmount);
    if (s.status == 'missed') return L10n.of(context).missed;
    if (s.status == 'rejected') return L10n.of(context).declined;
    if (s.status == 'cancelled') return L10n.of(context).cancelled;
    return s.status;
  }

  String _dur(int sec) {
    final m = sec ~/ 60, s = sec % 60;
    return s == 0 ? '${m}m' : '${m}m ${s}s';
  }

  void _openChat(SessionInfo s) {
    // The history row doesn't carry the astrologer's name, so the transcript
    // header falls back to a neutral label.
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ChatHistoryScreen(
        sessionId: s.sessionId,
        astrologerName: L10n.of(context).astrologer,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        title: Text(L10n.of(context).myConsultations, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
      ),
      body: Column(
        children: [
          _chips(c),
          Expanded(child: _content(c)),
        ],
      ),
    );
  }

  // Localized label for a filter chip, keyed off the backend `type` (null == All).
  String _chipLabel(String? type) => switch (type) {
        'chat' => L10n.of(context).chat,
        'call' => L10n.of(context).audio,
        'video' => L10n.of(context).video,
        _ => L10n.of(context).all,
      };

  Widget _chips(RgColors c) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final selected = i == _filter;
          return GestureDetector(
            onTap: () => _selectFilter(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: selected ? c.gold.withValues(alpha: 0.16) : c.ground2,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: selected ? c.gold : c.line),
              ),
              child: Text(
                _chipLabel(_filters[i].$2),
                style: TextStyle(
                  color: selected ? c.gold : c.muted,
                  fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _content(RgColors c) {
    if (_error != null) {
      return RefreshIndicator(
        onRefresh: _load,
        child: ListView(children: [
          const SizedBox(height: 120),
          Center(child: Text(_error!, style: TextStyle(color: c.muted))),
        ]),
      );
    }
    if (_items == null) return const Center(child: CircularProgressIndicator());
    if (_items!.isEmpty) {
      return RefreshIndicator(
        onRefresh: _load,
        child: ListView(children: [
          const SizedBox(height: 120),
          Center(child: Text(L10n.of(context).noConsultationsYet, style: TextStyle(color: c.muted))),
        ]),
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        itemCount: _items!.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) => _row(c, _items![i]),
      ),
    );
  }

  Widget _row(RgColors c, SessionInfo s) {
    final completed = s.status == 'completed';
    final isChat = s.type == 'chat';
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: c.ground2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: c.gold.withValues(alpha: 0.15),
              child: Icon(_icon(s.type), color: c.gold, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(L10n.of(context).typelabelSTypeConsultation(_typeLabel(context, s.type)),
                    style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14.5)),
                const SizedBox(height: 3),
                Text(_statusLabel(context, s),
                    style: TextStyle(color: completed ? c.muted : c.red, fontSize: 12.5)),
              ]),
            ),
            if (completed)
              Text('₹${s.totalAmount}', style: TextStyle(color: c.gold, fontWeight: FontWeight.w800)),
          ]),
          // Transcript affordance — completed chat rows only.
          if (completed && isChat) ...[
            const SizedBox(height: 10),
            Divider(height: 1, color: c.line),
            const SizedBox(height: 10),
            if (s.canViewChat)
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => _openChat(s),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.chat_outlined, size: 16, color: c.gold),
                      const SizedBox(width: 6),
                      Text(L10n.of(context).viewChat,
                          style: TextStyle(color: c.gold, fontWeight: FontWeight.w800, fontSize: 13)),
                    ]),
                  ),
                ),
              )
            else
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.history_toggle_off, size: 15, color: c.muted),
                const SizedBox(width: 6),
                Text(L10n.of(context).historyExpired, style: TextStyle(color: c.muted, fontSize: 12)),
              ]),
          ],
        ],
      ),
    );
  }
}

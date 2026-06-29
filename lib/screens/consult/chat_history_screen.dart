import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../api/session_api.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../../widgets/secure_screen.dart';
import '../../widgets/slide_route.dart';
import '../shop/product_detail_screen.dart';
import 'image_viewer.dart';

/// Read-only viewer for a COMPLETED chat consultation's transcript. Messages are
/// fetched once via [SessionApi.messagesWithMeta]; there is no input bar. Chat
/// history is retained server-side for 7 days only — once that lapses the API
/// returns `expired: true` and we show a friendly empty state instead.
///
/// The screen is screenshot/recording-protected for its whole lifetime via
/// [SecureScreenMixin] (transcripts can contain private guidance).
class ChatHistoryScreen extends StatefulWidget {
  final String sessionId;
  final String astrologerName;

  const ChatHistoryScreen({
    super.key,
    required this.sessionId,
    required this.astrologerName,
  });

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> with SecureScreenMixin {
  List<ChatMsg>? _items;
  bool _expired = false;
  String? _error;
  UserRecap? _recap; // astrologer-approved AI recap (Feature 1), if any

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final api = context.read<SessionApi>();
    final t = L10n.of(context);
    try {
      final res = await api.messagesWithMeta(widget.sessionId, limit: 200);
      if (mounted) {
        setState(() {
          _items = res.items;
          _expired = res.expired;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _error = t.couldNotLoadThisChatHistory);
    }
    // Recap is a bonus — load it independently so a recap failure never blocks
    // (or a missing recap never breaks) the transcript.
    try {
      final r = await api.recap(widget.sessionId);
      if (mounted && r != null && !r.isEmpty) setState(() => _recap = r);
    } catch (_) {/* no recap — show the plain transcript */}
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final myId = context.read<AuthProvider>().user?.id;
    final items = _items;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: c.ground,
        title: Text(
          L10n.of(context).widgetAstrologernameChatHistory(widget.astrologerName),
          style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: _error != null
          ? _empty(c, _error!)
          : items == null
              ? const Center(child: CircularProgressIndicator())
              : (_expired || items.isEmpty)
                  ? _empty(c, L10n.of(context).thisChatHistoryIsNoLonger)
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      // The recap (if any) is prepended as the first item.
                      itemCount: items.length + (_recap != null ? 1 : 0),
                      itemBuilder: (_, i) {
                        if (_recap != null && i == 0) {
                          return _RecapCard(recap: _recap!, astrologerName: widget.astrologerName);
                        }
                        final msgIndex = _recap != null ? i - 1 : i;
                        return _Bubble(msg: items[msgIndex], myId: myId);
                      },
                    ),
    );
  }

  Widget _empty(RgColors c, String message) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.history_toggle_off, size: 44, color: c.muted),
              const SizedBox(height: 14),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.4),
              ),
            ],
          ),
        ),
      );
}

/// A single read-only message bubble: system/gift (centered), or user/astrologer
/// (sided), text or image. Visual style mirrors `chat_room_screen.dart`.
class _Bubble extends StatelessWidget {
  final ChatMsg msg;
  final String? myId;
  const _Bubble({required this.msg, this.myId});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    if (msg.kind == 'gift') {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
          child: Text('🎁 You sent ${msg.message ?? 'a gift'}', style: TextStyle(color: c.gold, fontSize: 12.5, fontWeight: FontWeight.w700)),
        ),
      );
    }
    if (msg.isSystem) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
          child: Text(msg.message ?? '', textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.3)),
        ),
      );
    }
    final mine = myId != null && msg.sender == myId;
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: msg.hasImage ? const EdgeInsets.all(4) : const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
        decoration: BoxDecoration(
          color: mine ? c.gold : c.ground2,
          borderRadius: BorderRadius.circular(14),
          border: mine ? null : Border.all(color: c.line),
        ),
        child: msg.hasImage
            ? GestureDetector(
                onTap: () => ImageViewer.open(context, msg.mediaUrl!),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImage(url: msg.mediaUrl, fit: BoxFit.cover, width: 200, height: 200),
                ),
              )
            : Text(msg.message ?? '', style: TextStyle(color: mine ? const Color(0xFF1A1408) : c.ink, fontSize: 14, height: 1.35)),
      ),
    );
  }
}

/// The astrologer-approved AI recap, shown at the top of the transcript: a short
/// summary plus any suggested products that tap through to the store.
class _RecapCard extends StatelessWidget {
  final UserRecap recap;
  final String astrologerName;
  const _RecapCard({required this.recap, required this.astrologerName});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.aiSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.violet.withValues(alpha: 0.35)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.auto_awesome, size: 17, color: c.violet),
          const SizedBox(width: 7),
          Expanded(
            child: Text(L10n.of(context).summaryFromAstrologername(astrologerName),
                style: TextStyle(color: c.violet, fontWeight: FontWeight.w800, fontSize: 13.5)),
          ),
        ]),
        if (recap.summary.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(recap.summary, style: TextStyle(color: c.ink, fontSize: 13.5, height: 1.5)),
        ],
        if (recap.keyTopics.isNotEmpty) ...[
          const SizedBox(height: 12),
          Wrap(spacing: 7, runSpacing: 7, children: [
            ...recap.keyTopics.map((t) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: c.aiSurface2,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: c.line),
                  ),
                  child: Text(t, style: TextStyle(color: c.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
                )),
          ]),
        ],
        if (recap.reminders.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(L10n.of(context).remindersSetForYou, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13.5)),
          const SizedBox(height: 10),
          ...recap.reminders.map((r) => _ReminderCard(r: r)),
        ],
        if (recap.suggestions.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(L10n.of(context).suggestedForYou, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 13.5)),
          const SizedBox(height: 10),
          ...recap.suggestions.map((s) => _SuggestionCard(s: s)),
        ],
      ]),
    );
  }
}

/// A single read-only reminder row inside the recap card: a daily mantra
/// practice (repeat icon, "Daily at HH:MM · for 14 days") or a one-off event
/// (calendar icon, "On YYYY-MM-DD"), each with the astrologer's reason.
class _ReminderCard extends StatelessWidget {
  final UserReminder r;
  const _ReminderCard({required this.r});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final bool isMantra = r.isMantra;
    final Color accent = isMantra ? c.green : c.blue;
    final IconData icon = isMantra ? Icons.self_improvement : Icons.event_outlined;
    final String? when = isMantra
        ? ((r.timeOfDay != null && r.timeOfDay!.isNotEmpty) ? L10n.of(context).dailyAtRTimeofdayFor14(r.timeOfDay!) : L10n.of(context).dailyFor14Days)
        : ((r.date != null && r.date!.isNotEmpty) ? L10n.of(context).onRDate(r.date!) : null);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: c.ground2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.line),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: accent, size: 19),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(r.title.isEmpty ? (isMantra ? L10n.of(context).dailyMantra : L10n.of(context).reminder) : r.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
            if (when != null) ...[
              const SizedBox(height: 2),
              Text(when, style: TextStyle(color: accent, fontSize: 12, fontWeight: FontWeight.w600)),
            ],
            if (r.reason != null && r.reason!.isNotEmpty) ...[
              const SizedBox(height: 3),
              Text(r.reason!, maxLines: 3, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: c.muted, fontSize: 12, height: 1.3)),
            ],
          ]),
        ),
      ]),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final RecapSuggestion s;
  const _SuggestionCard({required this.s});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: s.productId.isEmpty
          ? null
          : () => Navigator.of(context).push(slideRoute(ProductDetailScreen(productId: s.productId))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: c.ground2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.line),
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: (s.image != null && s.image!.isNotEmpty)
                ? CachedImage(url: s.image, fit: BoxFit.cover, width: 46, height: 46)
                : Container(
                    width: 46,
                    height: 46,
                    color: c.gold.withValues(alpha: 0.15),
                    child: Icon(Icons.inventory_2_outlined, color: c.gold, size: 20),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Text(s.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
              if (s.reason != null && s.reason!.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(s.reason!, maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: c.muted, fontSize: 12, height: 1.3)),
              ],
            ]),
          ),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
            Text('₹${s.price}', style: TextStyle(color: c.gold, fontWeight: FontWeight.w800, fontSize: 14)),
            const SizedBox(height: 2),
            Icon(Icons.chevron_right, color: c.muted, size: 18),
          ]),
        ]),
      ),
    );
  }
}

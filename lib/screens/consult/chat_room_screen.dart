import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../api/profile_api.dart';
import '../../api/session_api.dart';
import '../../l10n/app_localizations.dart';
import '../../api/socket_service.dart';
import '../../providers/auth_provider.dart';
import '../../providers/session_provider.dart';
import '../../providers/wallet_provider.dart';
import '../shop/product_detail_screen.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../../widgets/secure_screen.dart';
import '../astrologers/gift_sheet.dart';
import 'call_screen.dart';
import 'image_viewer.dart';
import 'session_popups.dart';

/// Live chat consultation room. Text + image messages, system bubbles, a running
/// timer, the live wallet balance, gifting, and a switch-to-call/video action.
/// Per-minute billing + low-balance warnings come from the backend over the
/// socket (routed through SessionProvider).
class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> with WidgetsBindingObserver, SecureScreenMixin {
  final _input = TextEditingController();
  final _scroll = ScrollController();
  bool _sending = false;
  bool _lowBalanceShown = false;
  bool _endHandled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final s = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    // Join the session room (records the both-joined handshake + scopes gifts),
    // load history, and re-sync the clock from the server (handles resume).
    if (s.sessionId != null) socket.joinSession(s.sessionId!);
    s.loadMessages();
    s.syncStartedAt();
    s.addListener(_onSession);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    try { context.read<SessionProvider>().removeListener(_onSession); } catch (_) {}
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Survive background: reconnect, rejoin, reload missed messages + re-sync.
      final s = context.read<SessionProvider>();
      final socket = context.read<SocketService>();
      socket.connect();
      if (s.sessionId != null) socket.joinSession(s.sessionId!);
      s.loadMessages();
      s.syncStartedAt();
    }
  }

  void _onSession() {
    if (!mounted) return;
    final s = context.read<SessionProvider>();
    // Auto-scroll on new messages.
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToEnd());

    // Low-balance warning → recharge sheet (chat stays open).
    if (s.lowBalance && !_lowBalanceShown) {
      _lowBalanceShown = true;
      showLowBalanceSheet(context, s.minutesLeft);
    }
    if (!s.lowBalance) _lowBalanceShown = false;

    // Session ended → summary + review popup, then leave.
    if (s.phase == SessionPhase.ended && !_endHandled) {
      _endHandled = true;
      _handleEnd(s);
    }
  }

  Future<void> _handleEnd(SessionProvider s) async {
    final summary = s.endSummary;
    final name = s.astrologerName;
    if (!mounted) return;
    // Return the user to the home shell — pop every screen pushed on top of it
    // (chat room, and whatever they opened it from: astrologer profile, list,
    // deep link). A single pop() could strand them on an intermediate screen;
    // popUntil(isFirst) guarantees home no matter the entry path. This also
    // covers the balance-ran-out case, where the backend auto-ends the session.
    Navigator.of(context).popUntil((r) => r.isFirst);
    if (summary != null) {
      await showSessionEndDialog(context, summary, astrologerName: name);
    }
    s.clear();
  }

  void _jumpToEnd() {
    if (_scroll.hasClients) {
      _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    }
  }

  Future<void> _sendText() async {
    final text = _input.text.trim();
    if (text.isEmpty) return;
    final s = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    if (s.sessionId == null) return;
    _input.clear();
    socket.sendMessage(s.sessionId!, message: text, ack: (resp) {
      // Server echoes the persisted (moderated) message; the receive-message
      // event already adds the receiver's copy. Add our own optimistic copy.
    });
    // Optimistic local echo.
    s.messages.add(ChatMsg(
      id: 'local-${DateTime.now().microsecondsSinceEpoch}',
      sessionId: s.sessionId!,
      sender: context.read<AuthProvider>().user?.id,
      message: text,
      timestamp: DateTime.now(),
    ));
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToEnd());
  }

  Future<void> _sendImage() async {
    final s = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    if (s.sessionId == null || _sending) return;
    final profileApi = context.read<ProfileApi>();
    final myId = context.read<AuthProvider>().user?.id;
    final messenger = ScaffoldMessenger.of(context);
    final picker = ImagePicker();
    final x = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1280, imageQuality: 85);
    if (x == null) return;
    setState(() => _sending = true);
    try {
      final url = await profileApi.uploadImage(File(x.path));
      socket.sendMessage(s.sessionId!, mediaUrl: url, mediaType: 'image');
      s.messages.add(ChatMsg(
        id: 'local-${DateTime.now().microsecondsSinceEpoch}',
        sessionId: s.sessionId!,
        sender: myId,
        mediaUrl: url,
        mediaType: 'image',
        timestamp: DateTime.now(),
      ));
    } catch (_) {
      if (mounted) messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).couldNotSendImage)));
    } finally {
      if (mounted) setState(() => _sending = false);
      WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToEnd());
    }
  }

  Future<void> _confirmEnd() async {
    final c = context.rg;
    final session = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: c.ground,
        title: Text(L10n.of(context).endConsultation, style: TextStyle(color: c.ink)),
        content: Text(L10n.of(context).thisWillEndTheChatAnd, style: TextStyle(color: c.muted)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(L10n.of(context).keepChatting)),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(L10n.of(context).end)),
        ],
      ),
    );
    if (ok == true) await session.end(socket);
  }

  /// Switch to call/video: end the chat first (billed at chat rate), then start
  /// a fresh request at the new service's rate.
  Future<void> _switchTo(String type) async {
    final c = context.rg;
    final s = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final astroUserId = s.astrologerUserId;
    final astroName = s.astrologerName;
    final astroProfileId = s.astrologerProfileId;
    final astroAvatar = s.astrologerAvatar;
    if (astroUserId == null) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: c.ground,
        title: Text(L10n.of(context).switchToType0TouppercaseType(type[0].toUpperCase(), type.substring(1)), style: TextStyle(color: c.ink)),
        content: Text(L10n.of(context).yourChatWillEndAndA(type, type), style: TextStyle(color: c.muted)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(L10n.of(context).cancel)),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(L10n.of(context).switchLabel)),
        ],
      ),
    );
    if (ok != true) return;

    // Suppress the review popup for the switch: end chat, then immediately
    // re-request as call/video. We mark end handled so _onSession won't pop.
    _endHandled = true;
    await s.end(socket);
    // Wait briefly for session-ended, then start the new request.
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    s.clear();
    try {
      await s.request(
        astrologerUserId: astroUserId,
        type: type,
        astrologerName: astroName,
        astrologerProfileId: astroProfileId,
        astrologerAvatar: astroAvatar,
      );
      if (mounted) {
        navigator.pushReplacement(MaterialPageRoute(builder: (_) => const _RequestingThenCall()));
      }
    } catch (e) {
      if (mounted) {
        messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).couldNotSwitchETostring(e.toString()))));
        navigator.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final s = context.watch<SessionProvider>();
    final wallet = context.watch<WalletProvider>();
    final myId = context.read<AuthProvider>().user?.id;

    // Back MINIMIZES the room (session keeps running); a floating "Resume"
    // button on Home brings it back. End is explicit (menu / End action).
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: c.ground,
        appBar: AppBar(
          backgroundColor: c.ground,
          titleSpacing: 0,
          title: Row(children: [
            CircleAvatar(radius: 18, backgroundColor: c.gold.withValues(alpha: 0.2), child: Text(
              (s.astrologerName?.isNotEmpty == true ? s.astrologerName![0] : '★'),
              style: TextStyle(color: c.gold, fontWeight: FontWeight.w800),
            )),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s.astrologerName ?? L10n.of(context).astrologer, style: TextStyle(color: c.ink, fontSize: 15, fontWeight: FontWeight.w800), maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(children: [
                Icon(Icons.timer_outlined, size: 12, color: c.muted),
                const SizedBox(width: 4),
                Text(s.clock, style: TextStyle(color: c.muted, fontSize: 12)),
              ]),
            ])),
          ]),
          actions: [
            // Live wallet chip.
            Center(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.monetization_on_outlined, size: 13, color: c.gold),
                const SizedBox(width: 3),
                Text('${wallet.balance}', style: TextStyle(color: c.gold, fontWeight: FontWeight.w800, fontSize: 12.5)),
              ]),
            )),
            const SizedBox(width: 2),
            // Quick switch to Audio / Video right in the top bar (ends the chat,
            // starts a fresh call/video request — see _switchTo). Plus an explicit
            // End button. Gift moves to the overflow menu.
            IconButton(
              tooltip: L10n.of(context).switchToAudioCall,
              visualDensity: VisualDensity.compact,
              onPressed: () => _switchTo('call'),
              icon: Icon(Icons.call, color: c.green, size: 21),
            ),
            IconButton(
              tooltip: L10n.of(context).switchToVideoCall,
              visualDensity: VisualDensity.compact,
              onPressed: () => _switchTo('video'),
              icon: Icon(Icons.videocam, color: c.violet, size: 22),
            ),
            IconButton(
              tooltip: L10n.of(context).endConsultation2,
              visualDensity: VisualDensity.compact,
              onPressed: _confirmEnd,
              icon: Icon(Icons.call_end, color: c.red, size: 21),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: c.ink),
              onSelected: (v) {
                if (v == 'gift') showGiftSheet(context, s.astrologerName ?? L10n.of(context).astrologer, astrologerUserId: s.astrologerUserId, sessionId: s.sessionId);
              },
              itemBuilder: (_) => [
                PopupMenuItem(value: 'gift', child: Text(L10n.of(context).sendAGift)),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: s.messages.isEmpty
                  ? Center(child: Text(L10n.of(context).sayHello, style: TextStyle(color: c.muted)))
                  : ListView.builder(
                      controller: _scroll,
                      padding: const EdgeInsets.all(16),
                      itemCount: s.messages.length,
                      itemBuilder: (_, i) => _Bubble(msg: s.messages[i], myId: myId),
                    ),
            ),
            _inputBar(c, s),
          ],
        ),
      ),
    );
  }

  Widget _inputBar(RgColors c, SessionProvider s) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(color: c.ground, border: Border(top: BorderSide(color: c.line))),
        child: Row(children: [
          IconButton(
            onPressed: _sending ? null : _sendImage,
            icon: _sending
                ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : Icon(Icons.image_outlined, color: c.gold),
          ),
          IconButton(
            onPressed: () => showGiftSheet(context, s.astrologerName ?? L10n.of(context).astrologer, astrologerUserId: s.astrologerUserId, sessionId: s.sessionId),
            icon: Icon(Icons.card_giftcard, color: c.gold),
          ),
          Expanded(
            child: TextField(
              controller: _input,
              style: TextStyle(color: c.ink),
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendText(),
              decoration: InputDecoration(
                hintText: L10n.of(context).typeAMessage,
                hintStyle: TextStyle(color: c.muted),
                filled: true,
                fillColor: c.ground2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(onPressed: _sendText, icon: Icon(Icons.send, color: c.gold)),
        ]),
      ),
    );
  }
}

/// A single message bubble: system (centered), or user/astrologer (sided),
/// text or image.
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

    // Astrologer-shared product card → tap opens the product detail page.
    if (msg.hasProduct) {
      final p = msg.product!;
      return Align(
        alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailScreen(productId: p.productId),
          )),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.66),
            decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(14), border: Border.all(color: c.gold.withValues(alpha: 0.5))),
            clipBehavior: Clip.antiAlias,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              if (p.image != null && p.image!.isNotEmpty)
                CachedImage(url: p.image, fit: BoxFit.cover, width: double.infinity, height: 130),
              Padding(
                padding: const EdgeInsets.all(11),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Row(children: [Icon(Icons.storefront, size: 13, color: c.gold), const SizedBox(width: 5), Text(L10n.of(context).recommendedProduct, style: TextStyle(color: c.gold, fontSize: 11, fontWeight: FontWeight.w700))]),
                  const SizedBox(height: 6),
                  Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 6),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('₹${p.price}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                    Row(children: [Text(L10n.of(context).view, style: TextStyle(color: c.gold, fontWeight: FontWeight.w700, fontSize: 12.5)), Icon(Icons.chevron_right, size: 16, color: c.gold)]),
                  ]),
                ]),
              ),
            ]),
          ),
        ),
      );
    }

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

/// Tiny intermediate that shows "Connecting…" then transitions to the call
/// screen on accept — used by the chat→call/video switch.
class _RequestingThenCall extends StatefulWidget {
  const _RequestingThenCall();
  @override
  State<_RequestingThenCall> createState() => _RequestingThenCallState();
}

class _RequestingThenCallState extends State<_RequestingThenCall> {
  @override
  void initState() {
    super.initState();
    context.read<SessionProvider>().addListener(_check);
  }

  @override
  void dispose() {
    try { context.read<SessionProvider>().removeListener(_check); } catch (_) {}
    super.dispose();
  }

  void _check() {
    if (!mounted) return;
    final s = context.read<SessionProvider>();
    if (s.phase == SessionPhase.ongoing) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const CallScreen()));
    } else if (s.phase == SessionPhase.ended || s.phase == SessionPhase.idle) {
      Navigator.of(context).pop();
      final reason = s.rejectionReason;
      if (reason != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(reason)));
      }
      s.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(L10n.of(context).connecting, style: TextStyle(color: c.muted)),
      ])),
    );
  }
}

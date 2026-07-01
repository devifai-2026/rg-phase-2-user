import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../api/api_client.dart';
import '../../api/gift_api.dart';
import '../../api/live_api.dart';
import '../../api/socket_service.dart';
import '../../services/agora_audience.dart';
import '../../theme/rg_colors.dart';
import '../astrologers/gift_sheet.dart';

/// The viewer's live room. Joins the broadcast as Agora audience (sees the
/// astrologer's video/audio), shows the live comment stream + AI poll, and lets
/// the viewer comment, vote, and send gifts (superchats). Read-only video — the
/// viewer never publishes.
class LiveAudienceScreen extends StatefulWidget {
  final String liveSessionId;
  final String headline;
  const LiveAudienceScreen({super.key, required this.liveSessionId, required this.headline});

  @override
  State<LiveAudienceScreen> createState() => _LiveAudienceScreenState();
}

class _LiveAudienceScreenState extends State<LiveAudienceScreen> {
  final _agora = AgoraAudience();
  final _scroll = ScrollController();
  final _commentCtrl = TextEditingController();
  final _comments = <Map<String, dynamic>>[];

  bool _loading = true;
  bool _ended = false;
  String? _error;
  int _viewers = 0;
  int _superTotal = 0;
  String? _astrologerUserId;
  String _channelName = '';
  DateTime? _startedAt; // when the broadcast began → live elapsed timer
  Timer? _ticker; // 1s tick to refresh the elapsed label
  Map<String, dynamic>? _poll;
  String? _myVotedPollId; // guards double-voting in the UI

  SocketService get _socket => context.read<SocketService>();
  LiveApi get _liveApi => context.read<LiveApi>();

  // Cached service refs so teardown (dispose → _leave) never calls context.read
  // after the widget is deactivated ("Looking up a deactivated widget's ancestor
  // is unsafe"). Captured in didChangeDependencies (a safe inherited-widget read).
  SocketService? _socketRef;
  LiveApi? _liveApiRef;

  @override
  void initState() {
    super.initState();
    _join();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _socketRef = _socket;
    _liveApiRef = _liveApi;
  }

  Future<void> _join() async {
    try {
      final res = await _liveApi.join(widget.liveSessionId);
      if (!mounted) return;
      setState(() {
        _astrologerUserId = res.astrologerUserId;
        _channelName = res.token.channelName;
        _viewers = res.viewerCount;
        _startedAt = res.startedAt;
        _poll = res.activePoll;
        _loading = false;
      });
      // Tick once a second so the elapsed label stays live. Only the timer pill
      // rebuilds visibly; cheap enough for a 1s cadence.
      _ticker?.cancel();
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted && !_ended) setState(() {});
      });

      await _agora.joinAsAudience(res.token);
      _agora.broadcasterUid.addListener(_onBroadcaster);

      final s = _socket.raw;
      if (s != null) {
        s.emit('join-live', {'liveSessionId': widget.liveSessionId});
        s.on('live-comment', _onComment);
        s.on('live-gift', _onGift);
        s.on('live-viewers', _onViewers);
        s.on('live-poll', _onPoll);
        s.on('live-poll-tally', _onPoll);
        s.on('live-ended', _onEnded);
      }
    } catch (e) {
      if (!mounted) return;
      // Tapping a stale "X is live" notification after the broadcast ended hits
      // 410 (ended) or 404 (session gone). That's not an error to shout about —
      // show the same friendly "This live has ended" state, not a raw exception.
      if (e is ApiException && (e.statusCode == 410 || e.statusCode == 404)) {
        _ticker?.cancel();
        setState(() { _loading = false; _ended = true; });
        return;
      }
      setState(() { _loading = false; _error = e.toString().replaceFirst('Exception: ', ''); });
    }
  }

  void _onBroadcaster() { if (mounted) setState(() {}); }

  void _onComment(dynamic d) {
    final m = _unwrap(d);
    if (m['liveSessionId'] != widget.liveSessionId) return;
    setState(() => _comments.add(m));
    _autoscroll();
  }

  void _onGift(dynamic d) {
    final m = _unwrap(d);
    if (m['liveSessionId'] != widget.liveSessionId) return;
    setState(() {
      _superTotal = (m['superchatTotal'] as num?)?.toInt() ?? _superTotal;
      _comments.add({...m, '_kind': 'gift'});
    });
    _autoscroll();
  }

  void _onViewers(dynamic d) {
    final m = _unwrap(d);
    if (m['liveSessionId'] != widget.liveSessionId) return;
    setState(() => _viewers = (m['viewerCount'] as num?)?.toInt() ?? _viewers);
  }

  void _onPoll(dynamic d) {
    final m = _unwrap(d);
    setState(() => _poll = m);
  }

  void _onEnded(dynamic d) {
    _ticker?.cancel();
    if (mounted) setState(() => _ended = true);
  }

  /// Elapsed since the broadcast started, as m:ss (or h:mm:ss past an hour).
  String get _elapsed {
    if (_startedAt == null) return '0:00';
    var s = DateTime.now().difference(_startedAt!).inSeconds;
    if (s < 0) s = 0;
    final h = s ~/ 3600, m = (s % 3600) ~/ 60, sec = s % 60;
    final mm = m.toString().padLeft(h > 0 ? 2 : 1, '0');
    final ss = sec.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mm:$ss' : '$mm:$ss';
  }

  Map<String, dynamic> _unwrap(dynamic d) {
    var v = d;
    if (v is List) v = v.isNotEmpty ? v.first : null;
    return v is Map ? Map<String, dynamic>.from(v) : <String, dynamic>{};
  }

  void _autoscroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 220), curve: Curves.easeOut);
      }
    });
  }

  Future<void> _sendComment() async {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    _commentCtrl.clear();
    try {
      // The socket broadcasts the moderated comment back to everyone (incl. us).
      final s = _socket.raw;
      if (s != null) {
        s.emit('live-comment', {'liveSessionId': widget.liveSessionId, 'text': text});
      } else {
        await _liveApi.comment(widget.liveSessionId, text);
      }
    } catch (_) {/* swallow; user can retry */}
  }

  Future<void> _vote(String optionId) async {
    final poll = _poll;
    if (poll == null || _myVotedPollId == poll['id']) return;
    setState(() => _myVotedPollId = poll['id'] as String?);
    try {
      await _liveApi.vote(widget.liveSessionId, poll['id'].toString(), optionId);
    } catch (_) {
      // Revert the local guard on failure (e.g. already voted server-side stays).
    }
  }

  void _openGifts() {
    if (_astrologerUserId == null) return;
    showGiftSheet(context, widget.headline, astrologerUserId: _astrologerUserId, liveSessionId: widget.liveSessionId);
  }

  Future<void> _leave() async {
    // Use cached refs (NOT context.read) — _leave runs from dispose(), after the
    // widget is deactivated, where context lookups are unsafe.
    final s = _socketRef?.raw;
    if (s != null) {
      s.emit('leave-live', {'liveSessionId': widget.liveSessionId});
      s.off('live-comment', _onComment);
      s.off('live-gift', _onGift);
      s.off('live-viewers', _onViewers);
      s.off('live-poll', _onPoll);
      s.off('live-poll-tally', _onPoll);
      s.off('live-ended', _onEnded);
    }
    _agora.broadcasterUid.removeListener(_onBroadcaster);
    await _agora.leave();
    _liveApiRef?.leave(widget.liveSessionId).catchError((_) {});
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _leave();
    _scroll.dispose();
    _commentCtrl.dispose();
    _agora.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {},
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              // Join failed because the live already ended/was removed → show the
              // friendly ended overlay on its own (no video/panel to host it).
              : (_ended && _channelName.isEmpty)
                  ? _endedOverlay(c)
                  : _error != null
                      ? _errorView(c)
                      : Column(children: [
                          Expanded(flex: 5, child: _videoArea(c)),
                          Expanded(flex: 6, child: _bottomPanel(c)),
                        ]),
        ),
      ),
    );
  }

  Widget _errorView(RgColors c) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.live_tv_outlined, color: c.muted, size: 56),
            const SizedBox(height: 16),
            Text(_error!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), style: ElevatedButton.styleFrom(backgroundColor: c.red), child: Text(L10n.of(context).back)),
          ]),
        ),
      );

  Widget _videoArea(RgColors c) {
    final uid = _agora.broadcasterUid.value;
    return Stack(children: [
      Positioned.fill(
        child: (_agora.engine != null && uid != null && !_ended)
            ? AgoraVideoView(
                controller: VideoViewController.remote(
                  rtcEngine: _agora.engine!,
                  canvas: VideoCanvas(uid: uid),
                  connection: RtcConnection(channelId: _channelName),
                ),
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [c.redDeep, const Color(0xFF120A0A)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Center(
                  child: _ended
                      ? null
                      : Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(width: 26, height: 26, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white54)),
                          const SizedBox(height: 12),
                          Text(L10n.of(context).connectingToLive, style: const TextStyle(color: Colors.white54)),
                        ]),
                ),
              ),
      ),
      // Top overlay: LIVE + viewers + close.
      Positioned(
        top: 10, left: 12, right: 12,
        child: Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(color: c.red, borderRadius: BorderRadius.circular(6)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.circle, color: Colors.white, size: 8), const SizedBox(width: 5),
              Text(L10n.of(context).live, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
            ]),
          ),
          const SizedBox(width: 8),
          _pill(Icons.timer_outlined, _elapsed),
          const SizedBox(width: 8),
          _pill(Icons.visibility, '$_viewers'),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ]),
      ),
      Positioned(
        left: 12, bottom: 12, right: 12,
        child: Text(widget.headline, maxLines: 2, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
      ),
      if (_ended) Positioned.fill(child: _endedOverlay(c)),
    ]);
  }

  Widget _endedOverlay(RgColors c) => Container(
        color: Colors.black87,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.stop_circle_outlined, color: c.gold, size: 56),
            const SizedBox(height: 14),
            Text(L10n.of(context).thisLiveHasEnded, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), style: ElevatedButton.styleFrom(backgroundColor: c.red), child: Text(L10n.of(context).backToLive)),
          ]),
        ),
      );

  Widget _bottomPanel(RgColors c) => Container(
        decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(18))),
        child: Column(children: [
          if (_poll != null) _pollCard(c, _poll!),
          Expanded(child: _commentList(c)),
          _composer(c),
        ]),
      );

  Widget _commentList(RgColors c) {
    if (_comments.isEmpty) {
      return Center(child: Text(L10n.of(context).sayHelloBeTheFirstTo, style: TextStyle(color: c.muted)));
    }
    return ListView.builder(
      controller: _scroll,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      itemCount: _comments.length,
      itemBuilder: (_, i) {
        final m = _comments[i];
        if (m['_kind'] == 'gift') return _giftLine(c, m);
        return _commentLine(c, m);
      },
    );
  }

  Widget _commentLine(RgColors c, Map<String, dynamic> m) {
    final user = (m['user'] is Map) ? Map<String, dynamic>.from(m['user']) : {};
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '${user['name'] ?? 'Guest'}  ', style: TextStyle(color: c.gold, fontWeight: FontWeight.w700, fontSize: 13)),
          TextSpan(text: (m['text'] ?? '').toString(), style: TextStyle(color: c.ink, fontSize: 13.5)),
        ]),
      ),
    );
  }

  /// "🌹 Rose" — the gift's emoji (from the payload, else derived) + its name.
  String _giftLabel(Map<String, dynamic> m) {
    final name = (m['gift'] ?? 'a gift').toString();
    final e = (m['emoji'] ?? '').toString();
    final emoji = e.isNotEmpty ? e : giftEmoji(name);
    return '$emoji $name';
  }

  Widget _giftLine(RgColors c, Map<String, dynamic> m) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [c.gold.withValues(alpha: 0.9), c.gold.withValues(alpha: 0.55)]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          const Icon(Icons.bolt, color: Color(0xFF1A1408), size: 16),
          const SizedBox(width: 6),
          Expanded(
            child: Text('${m['fromName'] ?? 'Someone'} sent ${_giftLabel(m)} · ₹${m['amountRupees'] ?? ''}',
                style: const TextStyle(color: Color(0xFF1A1408), fontWeight: FontWeight.w800, fontSize: 13)),
          ),
        ]),
      );

  Widget _pollCard(RgColors c, Map<String, dynamic> poll) {
    final options = (poll['options'] as List?) ?? [];
    final total = (poll['totalVotes'] as num?)?.toInt() ?? 0;
    final voted = _myVotedPollId == poll['id'];
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 12, 14, 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: c.violet.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12), border: Border.all(color: c.violet)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.poll_outlined, size: 16, color: c.violet), const SizedBox(width: 6),
          Text(L10n.of(context).aiPollLive, style: TextStyle(color: c.violet, fontWeight: FontWeight.w800, fontSize: 12)),
          const Spacer(),
          Text(L10n.of(context).totalVotes(total), style: TextStyle(color: c.muted, fontSize: 11)),
        ]),
        const SizedBox(height: 8),
        Text((poll['question'] ?? '').toString(), style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 13.5)),
        const SizedBox(height: 8),
        ...options.map((o) {
          final opt = Map<String, dynamic>.from(o as Map);
          final votes = (opt['votes'] as num?)?.toInt() ?? 0;
          final pct = total == 0 ? 0.0 : votes / total;
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: voted ? null : () => _vote(opt['id'].toString()),
              child: Stack(children: [
                Container(height: 32, decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(8))),
                FractionallySizedBox(widthFactor: pct, child: Container(height: 32, decoration: BoxDecoration(color: c.violet.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)))),
                Positioned.fill(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    if (voted) Padding(padding: const EdgeInsets.only(right: 6), child: Icon(Icons.check_circle, size: 14, color: c.violet)),
                    Expanded(child: Text((opt['text'] ?? '').toString(), style: TextStyle(color: c.ink, fontSize: 12.5))),
                    Text(voted ? '${(pct * 100).round()}%' : L10n.of(context).vote, style: TextStyle(color: voted ? c.ink : c.violet, fontWeight: FontWeight.w700, fontSize: 12)),
                  ]),
                )),
              ]),
            ),
          );
        }),
      ]),
    );
  }

  Widget _composer(RgColors c) => Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: c.line))),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: _commentCtrl,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendComment(),
              minLines: 1, maxLines: 3,
              decoration: InputDecoration(hintText: L10n.of(context).addAComment, isDense: true),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _sendComment,
            icon: Icon(Icons.send, color: c.red),
            tooltip: L10n.of(context).send,
          ),
          // Gift / superchat.
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: _astrologerUserId == null ? null : _openGifts,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: c.gold, shape: BoxShape.circle),
              child: const Icon(Icons.card_giftcard, color: Color(0xFF1A1408), size: 20),
            ),
          ),
        ]),
      );

  Widget _pill(IconData icon, String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: Colors.white, size: 13), const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
        ]),
      );
}

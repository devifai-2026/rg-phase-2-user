import 'dart:async';
import 'package:flutter/foundation.dart';

import '../api/session_api.dart';
import '../api/socket_service.dart';

/// Lifecycle phase of the user's active consultation.
enum SessionPhase { idle, ringing, ongoing, ended }

/// A live gift bubble surfaced in the chat room.
class GiftEvent {
  final String gift;
  final String? image;
  final String fromAlias;
  const GiftEvent({required this.gift, this.image, required this.fromAlias});
}

/// App-wide coordinator for the user's consultation session (chat/call/video).
/// Owns the current session, its messages, the running timer and the low-balance
/// state. The screens (Requesting / ChatRoom / Call) read from here and the
/// dialogs (low-balance, review) are driven by the exposed signals.
///
/// Wired to [SocketService] callbacks in main.dart so realtime events update
/// state regardless of which screen is mounted.
class SessionProvider extends ChangeNotifier {
  final SessionApi _api;
  SessionProvider(this._api);

  SessionPhase _phase = SessionPhase.idle;
  SessionPhase get phase => _phase;

  String? _sessionId;
  String? get sessionId => _sessionId;
  String _type = 'chat';
  String get type => _type;

  /// The astrologer USER id + display name for the session we're requesting.
  String? astrologerUserId;
  String? astrologerName;
  String? astrologerProfileId;
  String? astrologerAvatar;

  int ratePerMin = 0;
  RtcToken? rtcToken; // for media sessions, from request-accepted

  final List<ChatMsg> messages = [];

  // Timer driven from the session's startedAt (server-authoritative).
  DateTime? _startedAt;
  Timer? _ticker;
  int _elapsedSec = 0;
  int get elapsedSec => _elapsedSec;

  int? _minutesLeft; // from low-balance-warning / session-extended
  int? get minutesLeft => _minutesLeft;
  bool _lowBalance = false;
  bool get lowBalance => _lowBalance;

  // Terminal summary (duration + coins) for the review/summary popup.
  SessionEndSummary? _endSummary;
  SessionEndSummary? get endSummary => _endSummary;

  // One-shot signals the UI consumes (e.g. to pop a screen or show a dialog).
  String? _rejectionReason; // set on reject/missed/cancel
  String? get rejectionReason => _rejectionReason;

  bool get isActive => _phase == SessionPhase.ringing || _phase == SessionPhase.ongoing;

  String get clock {
    final m = (_elapsedSec ~/ 60).toString().padLeft(2, '0');
    final s = (_elapsedSec % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  // ── Outgoing: start / cancel / end ──

  /// Begin requesting a session. Moves to [SessionPhase.ringing].
  Future<SessionInfo> request({
    required String astrologerUserId,
    required String type,
    String? astrologerName,
    String? astrologerProfileId,
    String? astrologerAvatar,
  }) async {
    final info = await _api.requestSession(astrologerUserId, type);
    this.astrologerUserId = astrologerUserId;
    this.astrologerName = astrologerName;
    this.astrologerProfileId = astrologerProfileId;
    this.astrologerAvatar = astrologerAvatar;
    _sessionId = info.sessionId;
    _type = type;
    ratePerMin = info.ratePerMin;
    _phase = SessionPhase.ringing;
    _rejectionReason = null;
    _endSummary = null; // fresh request → drop any prior terminal state
    _startedAt = null;
    messages.clear();
    notifyListeners();
    return info;
  }

  /// Rehydrate an in-progress session after the app was killed/relaunched. Asks
  /// the backend for the user's live session (status accepted|ongoing) and, if
  /// one exists, restores enough state for the MainShell resume bar + the
  /// chat/call screen to re-enter the room. No-op when there's nothing live.
  /// Safe to call on every launch; never throws.
  Future<bool> resumeFromActive(SocketService socket) async {
    if (isActive) return true; // already tracking a session in-memory
    try {
      final res = await _api.active();
      if (res == null) return false;
      final s = res.session;
      _sessionId = s.sessionId;
      _type = s.type;
      ratePerMin = s.ratePerMin;
      rtcToken = res.token;
      _rejectionReason = null;
      _endSummary = null;
      _startedAt = s.startedAt;
      // Restore the right phase from the server status:
      //   'ringing'  → still waiting for the astrologer → re-show requesting UI.
      //   'accepted' → room open, timer not started yet.
      //   'ongoing'  → both joined, startedAt set, timer running.
      _phase = s.status == 'ringing' ? SessionPhase.ringing : SessionPhase.ongoing;
      // Rejoin the socket room so live events (accept/messages/timer/end) resume.
      socket.joinSession(s.sessionId);
      if (_phase == SessionPhase.ongoing) {
        if (_startedAt != null) _startTicker(); else syncStartedAt();
      }
      notifyListeners();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> cancel(SocketService socket) async {
    final id = _sessionId;
    if (id == null) return;
    socket.cancelSession(id);
    try { await _api.cancel(id); } catch (_) {/* socket path is primary */}
    _reset();
  }

  Future<void> end(SocketService socket) async {
    final id = _sessionId;
    if (id == null) return;
    socket.endSession(id);
    try { await _api.end(id); } catch (_) {/* socket path is primary */}
    // Don't reset yet — wait for session-ended to capture the summary.
  }

  // ── Incoming socket events (wired in main.dart) ──

  /// Astrologer accepted → the room opens. The TIMER does NOT start yet; it
  /// begins on `session-started` once both have joined the room.
  void onAccepted(Map<String, dynamic> d) {
    if (d['sessionId'] != _sessionId) return;
    _phase = SessionPhase.ongoing; // "ongoing" here = room open
    if (d['token'] is Map) {
      rtcToken = RtcToken.fromJson(Map<String, dynamic>.from(d['token'] as Map));
    }
    notifyListeners();
  }

  /// Both parties joined the room → server stamped startedAt. Start the clock
  /// from that exact server time so the user + astrologer timers are identical.
  bool get started => _startedAt != null;
  void onStarted(Map<String, dynamic> d) {
    if (d['sessionId'] != _sessionId) return;
    final started = d['startedAt']?.toString();
    _startedAt = started != null ? DateTime.tryParse(started)?.toLocal() : DateTime.now();
    _startTicker();
    notifyListeners();
  }

  void onRejected(Map<String, dynamic> d) => _endRinging(d, 'The astrologer declined the request.');
  void onMissed(Map<String, dynamic> d) => _endRinging(d, 'No answer. Please try again.');

  void _endRinging(Map<String, dynamic> d, String reason) {
    if (d['sessionId'] != _sessionId) return;
    _rejectionReason = reason;
    _phase = SessionPhase.ended;
    notifyListeners();
  }

  void onReceiveMessage(Map<String, dynamic> d) {
    if (d['sessionId'] != _sessionId) return;
    messages.add(ChatMsg.fromJson(d));
    notifyListeners();
  }

  void onLowBalance(Map<String, dynamic> d) {
    if (d['sessionId'] != _sessionId) return;
    _minutesLeft = (d['minutesLeft'] as num?)?.toInt();
    _lowBalance = true;
    notifyListeners();
  }

  void onExtended(Map<String, dynamic> d) {
    if (d['sessionId'] != _sessionId) return;
    _minutesLeft = (d['minutesLeft'] as num?)?.toInt();
    _lowBalance = false; // recharge cleared the warning
    notifyListeners();
  }

  GiftEvent? lastGift;
  void onGift(Map<String, dynamic> d) {
    if (d['sessionId'] != null && d['sessionId'] != _sessionId) return;
    final giftName = (d['gift'] ?? 'Gift').toString();
    lastGift = GiftEvent(
      gift: giftName,
      image: d['image']?.toString(),
      fromAlias: (d['fromAlias'] ?? 'Seeker').toString(),
    );
    // Surface the gift as an inline chat bubble so it shows in the conversation.
    messages.add(ChatMsg(
      id: 'gift-${DateTime.now().microsecondsSinceEpoch}',
      sessionId: _sessionId ?? '',
      kind: 'gift',
      message: giftName,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }

  void onEnded(Map<String, dynamic> d) {
    if (_sessionId != null && d['sessionId'] != _sessionId) return;
    _endSummary = SessionEndSummary.fromJson(d);
    _phase = SessionPhase.ended;
    _stopTicker();
    notifyListeners();
  }

  // ── Resume support (background/app-close survival) ──

  /// Re-sync the running clock from the session's startedAt (server truth).
  /// Called when a (possibly minimized/backgrounded) room is reopened so the
  /// timer matches the server exactly. Also (re)starts the ticker if needed.
  Future<void> syncStartedAt() async {
    final id = _sessionId;
    if (id == null) return;
    try {
      final info = await _api.detail(id);
      if (info.startedAt != null) {
        _startedAt = info.startedAt;
        if (_ticker == null) _startTicker(); else _tick();
        notifyListeners();
      }
    } catch (_) {/* keep local clock */}
  }

  /// Load prior messages (on room open / after a background gap).
  Future<void> loadMessages() async {
    final id = _sessionId;
    if (id == null) return;
    try {
      final prior = await _api.messages(id);
      messages
        ..clear()
        ..addAll(prior);
      notifyListeners();
    } catch (_) {/* history may have TTL'd out */}
  }

  // ── Timer ──
  void _startTicker() {
    _startedAt ??= DateTime.now();
    _ticker?.cancel();
    _tick();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    if (_startedAt == null) return;
    _elapsedSec = DateTime.now().difference(_startedAt!).inSeconds;
    if (_elapsedSec < 0) _elapsedSec = 0;
    notifyListeners();
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  /// Clear all session state after a fully-resolved session (post-popup).
  void clear() => _reset();

  void _reset() {
    _stopTicker();
    _phase = SessionPhase.idle;
    _sessionId = null;
    rtcToken = null;
    ratePerMin = 0;
    _elapsedSec = 0;
    _startedAt = null;
    _minutesLeft = null;
    _lowBalance = false;
    _rejectionReason = null;
    _endSummary = null; // clear so a new session can't see a stale summary
    lastGift = null;
    messages.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _stopTicker();
    super.dispose();
  }
}

/// Terminal session summary used by the end/review popup + history.
class SessionEndSummary {
  final String sessionId;
  final int durationSec;
  final int billedMinutes;
  final int totalAmount; // coins deducted
  final String? endReason;
  const SessionEndSummary({
    required this.sessionId,
    required this.durationSec,
    required this.billedMinutes,
    required this.totalAmount,
    this.endReason,
  });
  factory SessionEndSummary.fromJson(Map<String, dynamic> j) => SessionEndSummary(
        sessionId: (j['sessionId'] ?? '').toString(),
        durationSec: (j['durationSec'] as num?)?.toInt() ?? 0,
        billedMinutes: (j['billedMinutes'] as num?)?.toInt() ?? 0,
        totalAmount: (j['totalAmount'] as num?)?.toInt() ?? 0,
        endReason: j['endReason']?.toString(),
      );

  String get durationLabel {
    final m = durationSec ~/ 60;
    final s = durationSec % 60;
    return s == 0 ? '${m}m' : '${m}m ${s}s';
  }
}

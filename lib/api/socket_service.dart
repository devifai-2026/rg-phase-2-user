import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'api_config.dart';
import 'token_store.dart';

/// Real-time Socket.io connection. Connects to the host root with the access
/// token in `handshake.auth.token` (matches the backend). Auto-reconnects;
/// re-auths with a fresh token on reconnect. Exposes connection state +
/// streams of the core server→client events.
class SocketService extends ChangeNotifier {
  final TokenStore _tokens;
  SocketService(this._tokens);

  io.Socket? _socket;
  bool _connected = false;
  bool get connected => _connected;

  /// Raw socket for self-contained features (e.g. the live audience room) that
  /// attach/detach their own listeners. Null before the socket connects.
  io.Socket? get raw => _socket;

  // Heartbeat + accumulated activity since the last beat.
  Timer? _heartbeatTimer;
  int _pageViews = 0;
  int _searches = 0;
  String? _lastPage;
  String? _lastSearch;

  // Latest event payloads other parts of the app can listen to via callbacks.
  void Function(Map<String, dynamic>)? onIncomingRequest;
  void Function(Map<String, dynamic>)? onReceiveMessage;
  void Function(Map<String, dynamic>)? onWalletUpdated;
  void Function(Map<String, dynamic>)? onNewNotification;
  void Function(Map<String, dynamic>)? onSessionEnded;
  // ── Consultation session signalling (user side) ──
  void Function(Map<String, dynamic>)? onRequestAccepted;
  void Function(Map<String, dynamic>)? onSessionStarted; // both joined → timer/billing start
  void Function(Map<String, dynamic>)? onRequestRejected;
  void Function(Map<String, dynamic>)? onRequestMissed;
  void Function(Map<String, dynamic>)? onRequestCancelled;
  void Function(Map<String, dynamic>)? onLowBalanceWarning;
  void Function(Map<String, dynamic>)? onSessionExtended;
  void Function(Map<String, dynamic>)? onGiftReceived;
  void Function(Map<String, dynamic>)? onTyping;
  void Function(Map<String, dynamic>)? onStopTyping;
  void Function(Map<String, dynamic>)? onMessageDelivered;
  void Function(Map<String, dynamic>)? onMessagesRead;

  // Astrologer online/busy/offline changes — broadcast so MANY widgets (the
  // list screen + every home rail) can listen and patch the matching card live.
  final _astroStatus = StreamController<AstrologerStatus>.broadcast();
  Stream<AstrologerStatus> get astrologerStatus => _astroStatus.stream;

  // 3-second status poll: the screens register the profileIds currently on
  // screen; every 3s we ask the server for their CURRENT status and push the
  // results through the same `astrologerStatus` stream the cards already listen
  // to. This guarantees the user app self-corrects stale online/offline within
  // 3s even if a broadcast was missed (resume, reconnect, etc.).
  Timer? _statusPollTimer;
  final Set<String> _watchedProfileIds = {};

  /// Connect (idempotent). Call after login / on cold-start when a session exists.
  void connect() {
    final token = _tokens.accessToken;
    if (token == null || token.isEmpty) return;
    if (_socket != null) {
      // Refresh auth token + ensure connected.
      _socket!.auth = {'token': token};
      if (!_socket!.connected) _socket!.connect();
      return;
    }

    _socket = io.io(
      ApiConfig.socketUrl,
      io.OptionBuilder()
          // WEBSOCKET ONLY. On Android, socket_io_client's XHR-polling transport
          // hangs (long-poll GET times out → "Connecting…" forever). Websocket is
          // the reliable mobile transport: one direct handshake, no polling↔ws
          // upgrade churn. (Server allows both; we pin the client to websocket.)
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setAuth({'token': token})
          .enableReconnection()
          .build(),
    );

    final s = _socket!;
    s.onConnect((_) {
      _connected = true;
      _startHeartbeat();
      _startStatusPoll();
      notifyListeners();
    });
    s.onDisconnect((_) {
      _connected = false;
      _heartbeatTimer?.cancel();
      _statusPollTimer?.cancel();
      notifyListeners();
    });
    // On reconnect attempts, always send the freshest token (it may have rotated).
    s.onReconnectAttempt((_) => s.auth = {'token': _tokens.accessToken ?? ''});
    s.onConnectError((_) {/* surfaced via `connected` */});

    // Core server → client events (see FLUTTER_API.md §7).
    s.on('incoming-request', (d) => onIncomingRequest?.call(_map(d)));
    s.on('receive-message', (d) => onReceiveMessage?.call(_map(d)));
    s.on('wallet-updated', (d) => onWalletUpdated?.call(_map(d)));
    s.on('new-notification', (d) => onNewNotification?.call(_map(d)));
    s.on('session-ended', (d) => onSessionEnded?.call(_map(d)));
    // Consultation session lifecycle.
    s.on('request-accepted', (d) => onRequestAccepted?.call(_map(d)));
    s.on('session-started', (d) => onSessionStarted?.call(_map(d)));
    s.on('request-rejected', (d) => onRequestRejected?.call(_map(d)));
    s.on('request-missed', (d) => onRequestMissed?.call(_map(d)));
    s.on('request-cancelled', (d) => onRequestCancelled?.call(_map(d)));
    s.on('low-balance-warning', (d) => onLowBalanceWarning?.call(_map(d)));
    s.on('session-extended', (d) => onSessionExtended?.call(_map(d)));
    s.on('gift-received', (d) => onGiftReceived?.call(_map(d)));
    s.on('typing', (d) => onTyping?.call(_map(d)));
    s.on('stop-typing', (d) => onStopTyping?.call(_map(d)));
    s.on('message-delivered', (d) => onMessageDelivered?.call(_map(d)));
    s.on('messages-read', (d) => onMessagesRead?.call(_map(d)));
    s.on('astrologer-status', (d) {
      final m = _map(d);
      final id = (m['profileId'] ?? '').toString();
      if (id.isEmpty) return;
      _astroStatus.add(AstrologerStatus(
        profileId: id,
        isOnline: m['isOnline'] == true,
        currentCallStatus: (m['currentCallStatus'] ?? '').toString(),
        live: m['live'] == true,
        liveSessionId: m['liveSessionId']?.toString(),
      ));
    });

    s.connect();
  }

  // ── Heartbeat (ping/pong) carrying activity ──
  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _sendHeartbeat(); // immediate beat on connect
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 25), (_) => _sendHeartbeat());
  }

  void _sendHeartbeat() {
    if (_socket == null || !_connected) return;
    final payload = <String, dynamic>{
      if (_pageViews > 0) 'pageViews': _pageViews,
      if (_searches > 0) 'searches': _searches,
      if (_lastPage != null) 'lastPage': _lastPage,
      if (_lastSearch != null) 'lastSearch': _lastSearch,
    };
    _socket!.emitWithAck('heartbeat', payload, ack: (_) {/* pong */});
    // Reset accumulators (counts already sent).
    _pageViews = 0;
    _searches = 0;
  }

  // ── 3-second astrologer-status poll ──
  void _startStatusPoll() {
    _statusPollTimer?.cancel();
    _pollStatuses(); // immediate poll on connect
    _statusPollTimer = Timer.periodic(const Duration(seconds: 3), (_) => _pollStatuses());
  }

  void _pollStatuses() {
    if (_socket == null || !_connected || _watchedProfileIds.isEmpty) return;
    _socket!.emitWithAck(
      'get-astrologer-statuses',
      {'profileIds': _watchedProfileIds.toList()},
      ack: (resp) {
        final r = _map(resp);
        final list = r['statuses'];
        if (list is! List) return;
        for (final e in list) {
          final m = e is Map ? Map<String, dynamic>.from(e) : null;
          if (m == null) continue;
          final id = (m['profileId'] ?? '').toString();
          if (id.isEmpty) continue;
          _astroStatus.add(AstrologerStatus(
            profileId: id,
            isOnline: m['isOnline'] == true,
            currentCallStatus: (m['currentCallStatus'] ?? '').toString(),
            live: m['live'] == true,
            liveSessionId: m['liveSessionId']?.toString(),
          ));
        }
      },
    );
  }

  /// Screens register the astrologer profileIds they're showing so the 3s poll
  /// refreshes their status. Safe to call repeatedly; ids accumulate (cheap).
  void watchAstrologers(Iterable<String> profileIds) {
    _watchedProfileIds.addAll(profileIds.where((e) => e.isNotEmpty));
  }

  /// Record a screen open (counted + sent on next heartbeat).
  void trackPage(String route) {
    _pageViews++;
    _lastPage = route;
  }

  /// Record a search submit.
  void trackSearch(String query) {
    _searches++;
    _lastSearch = query;
  }

  /// Emit with optional ack callback.
  void emit(String event, [dynamic data, Function? ack]) {
    if (_socket == null) return;
    if (ack != null) {
      _socket!.emitWithAck(event, data, ack: ack);
    } else {
      _socket!.emit(event, data);
    }
  }

  // ── Consultation session emits (user side) ──
  /// Join a session's room (so session-scoped events like gift-received arrive).
  void joinSession(String sessionId) => emit('join-session', {'sessionId': sessionId});

  /// Cancel a still-ringing request the user owns.
  void cancelSession(String sessionId) => emit('cancel-session', {'sessionId': sessionId});

  /// End an ongoing session.
  void endSession(String sessionId) => emit('end-session', {'sessionId': sessionId});

  /// Send a chat message (text and/or image). [ack] receives the server ack
  /// (includes the persisted message + whether content was masked).
  void sendMessage(String sessionId, {String? message, String? mediaUrl, String? mediaType, Function? ack}) {
    emit('send-message', {
      'sessionId': sessionId,
      if (message != null) 'message': message,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
    }, ack);
  }

  /// Mark all messages in a session read (sends blue ticks to [to]).
  void markRead(String sessionId, String to) => emit('mark-read', {'sessionId': sessionId, 'to': to});

  /// Ack delivery of a single received message (single → double tick).
  void messageReceived(String messageId) => emit('message-received', {'messageId': messageId});

  /// Typing indicators.
  void typing(String sessionId, String to) => emit('typing', {'sessionId': sessionId, 'to': to});
  void stopTyping(String sessionId, String to) => emit('stop-typing', {'sessionId': sessionId, 'to': to});

  /// Disconnect + tear down (on logout).
  void disconnect() {
    _heartbeatTimer?.cancel();
    _statusPollTimer?.cancel();
    _socket?.dispose();
    _socket = null;
    _connected = false;
    notifyListeners();
  }

  /// Normalize a socket payload to a Map. socket_io_client sometimes delivers
  /// the handler args as a List (e.g. [data, ackId]) instead of the data object
  /// directly — so unwrap the first element before checking for a Map.
  Map<String, dynamic> _map(dynamic d) {
    var v = d;
    if (v is List) v = v.isNotEmpty ? v.first : null;
    return v is Map ? Map<String, dynamic>.from(v) : <String, dynamic>{};
  }
}

/// A live astrologer status change pushed over the socket.
class AstrologerStatus {
  final String profileId;
  final bool isOnline;
  final String currentCallStatus; // 'available' | 'busy' | 'offline'
  final bool live; // true while broadcasting a live session
  final String? liveSessionId; // the broadcast to join (when live)
  const AstrologerStatus({
    required this.profileId,
    required this.isOnline,
    required this.currentCallStatus,
    this.live = false,
    this.liveSessionId,
  });

  /// 'live' while broadcasting, else 'online' when free & online, 'busy' during a
  /// session, else 'offline' — matches the card's status string.
  String get cardStatus => live ? 'live' : (currentCallStatus == 'busy' ? 'busy' : (isOnline ? 'online' : 'offline'));
}

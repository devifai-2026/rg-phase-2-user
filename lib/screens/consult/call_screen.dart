import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/session_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../services/agora_session.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/secure_screen.dart';
import 'session_popups.dart';

/// Live audio/video consultation. Joins the Agora channel using the token from
/// `request-accepted`, shows the remote/local video (video) or an avatar
/// (audio), with mute/camera controls, a running timer and the live wallet.
/// Billing + low-balance warnings come from the backend via SessionProvider.
class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin, SecureScreenMixin {
  final _agora = AgoraSession();
  bool _lowBalanceShown = false;
  bool _endHandled = false;
  bool _ending = false; // first End tap → instant feedback, blocks repeat taps
  bool _leaving = false; // engine being released → stop painting video views
  bool _mock = false;

  // Drives the soft glow/pulse ring around the avatar while connecting.
  late final AnimationController _pulse;

  bool get _isVideo => context.read<SessionProvider>().type == 'video';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))
      ..repeat();
    final s = context.read<SessionProvider>();
    final socket = context.read<SocketService>();
    s.addListener(_onSession);
    // Record the user's presence in the room (both-joined handshake) so the
    // server starts the timer + billing and emits session-started. Without this
    // a call sticks in 'accepted' and shows "Connecting…" forever.
    if (s.sessionId != null) socket.joinSession(s.sessionId!);
    s.syncStartedAt();
    _joinAgora();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Minimizing (paused/inactive) keeps the call running in the background.
    // KILLING the app (detached) auto-ends the call/video session — unlike chat,
    // a live call shouldn't keep billing once the app is gone.
    if (state == AppLifecycleState.detached) {
      final s = context.read<SessionProvider>();
      final id = s.sessionId;
      if (id != null) { try { context.read<SocketService>().endSession(id); } catch (_) {} }
    }
    // Back from background: the OS may have dropped the socket — reconnect,
    // rejoin the session room, and re-anchor the clock to server truth.
    if (state == AppLifecycleState.resumed && mounted) {
      final s = context.read<SessionProvider>();
      final socket = context.read<SocketService>();
      socket.connect();
      if (s.sessionId != null) socket.joinSession(s.sessionId!);
      s.syncStartedAt();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pulse.dispose();
    _agora.errorNotifier.removeListener(_onAgoraError);
    try { context.read<SessionProvider>().removeListener(_onSession); } catch (_) {}
    // Only tear down Agora when the SESSION actually ended. If the screen is
    // just being minimized (popped while the call continues), keep the channel
    // alive so audio keeps flowing in the background.
    final stillLive = context.read<SessionProvider>().isActive;
    if (_endHandled || !stillLive) {
      _agora.leave();
      _agora.dispose();
    }
    super.dispose();
  }

  Future<void> _joinAgora() async {
    final s = context.read<SessionProvider>();
    final token = s.rtcToken;
    if (token == null) { setState(() => _mock = true); return; }
    // Surface a fatal media error (e.g. token rejected) so the user isn't left
    // in a silent call thinking it's connected. The timer still runs (billing is
    // backend-driven), but we warn that audio/video couldn't connect.
    _agora.errorNotifier.addListener(_onAgoraError);
    final ok = await _agora.join(token, video: _isVideo);
    if (mounted) setState(() => _mock = !ok);
  }

  void _onAgoraError() {
    final msg = _agora.errorNotifier.value;
    if (msg == null || !mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating));
  }

  void _onSession() {
    if (!mounted) return;
    final s = context.read<SessionProvider>();
    if (s.lowBalance && !_lowBalanceShown) {
      _lowBalanceShown = true;
      showLowBalanceSheet(context, s.minutesLeft);
    }
    if (!s.lowBalance) _lowBalanceShown = false;

    if (s.phase == SessionPhase.ended && !_endHandled) {
      _endHandled = true;
      _handleEnd(s);
    }
  }

  Future<void> _handleEnd(SessionProvider s) async {
    final summary = s.endSummary;
    final name = s.astrologerName;
    // Stop painting the AgoraVideoView widgets BEFORE releasing the engine —
    // rendering a video view against a released engine throws the red-screen
    // error on VIDEO end. Drop the views first, then tear the engine down.
    if (mounted) setState(() => _leaving = true);
    await _agora.leave();
    if (!mounted) return;
    // Return to the home shell regardless of how the call was entered — pop every
    // route above the first. A single pop() could strand the user on an
    // intermediate screen. Also covers the balance-ran-out auto-end.
    Navigator.of(context).popUntil((r) => r.isFirst);
    if (summary != null) await showSessionEndDialog(context, summary, astrologerName: name);
    s.clear();
  }

  Future<void> _end() async {
    // Guard against double-taps: the end round-trip (socket + API + the
    // session-ended event that actually tears down the UI) can take a moment.
    // Flip to an "ending" state on the FIRST tap so the button shows immediate
    // feedback and ignores further taps — previously it looked unresponsive and
    // users mashed it. _endHandled is set when session-ended finally arrives.
    if (_ending || _endHandled) return;
    setState(() { _ending = true; _leaving = true; });
    await context.read<SessionProvider>().end(context.read<SocketService>());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final s = context.watch<SessionProvider>();
    final wallet = context.watch<WalletProvider>();
    final showVideo = _isVideo && !_mock && !_leaving && _agora.engine != null && _agora.remoteUid != null;

    // Back MINIMIZES the call (audio keeps running; Resume bar on Home brings it
    // back). Ending is explicit via the red End button. App-kill auto-ends
    // (see didChangeAppLifecycleState).
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Remote video / audio backdrop.
            Positioned.fill(child: _remoteView(c, s)),

            // Top scrim so header text stays legible over live video.
            if (showVideo)
              const Positioned(
                top: 0, left: 0, right: 0, height: 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Color(0xB3000000), Color(0x00000000)],
                    ),
                  ),
                ),
              ),

            // Local preview (video only).
            if (_isVideo && !_mock && !_leaving && _agora.engine != null)
              Positioned(
                top: 54, right: 16, width: 112, height: 156,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.35), width: 1.5),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 18, offset: const Offset(0, 6))],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: AgoraVideoView(
                      controller: VideoViewController(
                        rtcEngine: _agora.engine!,
                        canvas: const VideoCanvas(uid: 0),
                      ),
                    ),
                  ),
                ),
              ),

            // Header: name, call-type/timer, wallet.
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      s.astrologerName ?? L10n.of(context).astrologer,
                      style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800, letterSpacing: 0.2),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    _typePill(c, s),
                  ])),
                  const SizedBox(width: 12),
                  _walletPill(c, wallet),
                ]),
              ),
            ),

            // Bottom scrim behind controls.
            const Positioned(
              left: 0, right: 0, bottom: 0, height: 220,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter, end: Alignment.topCenter,
                      colors: [Color(0xCC000000), Color(0x00000000)],
                    ),
                  ),
                ),
              ),
            ),

            // Controls.
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: SafeArea(
                child: Padding(
                  // SafeArea already insets for the system nav; keep the extra
                  // lift small. spaceEvenly + FittedBox (instead of fixed 16px
                  // gaps) so all five video controls fit 360dp-wide screens —
                  // the end button used to clip off-screen.
                  padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _ctrl(Icons.mic, Icons.mic_off, _agora.muted, () async { await _agora.toggleMute(); setState(() {}); }),
                          // Speaker / earpiece toggle (audio + video).
                          _ctrl(Icons.volume_up, Icons.hearing, !_agora.speakerOn, () async { await _agora.toggleSpeaker(); setState(() {}); }),
                          if (_isVideo) ...[
                            _ctrl(Icons.videocam, Icons.videocam_off, _agora.cameraOff, () async { await _agora.toggleCamera(); setState(() {}); }),
                            _ctrl(Icons.cameraswitch, Icons.cameraswitch, false, () => _agora.switchCamera()),
                          ],
                          GestureDetector(
                            onTap: _ending ? null : _end,
                            child: Container(
                              height: 66, width: 66,
                              decoration: BoxDecoration(color: _ending ? c.red.withValues(alpha: 0.5) : c.red, shape: BoxShape.circle, boxShadow: [BoxShadow(color: c.red.withValues(alpha: 0.45), blurRadius: 20, spreadRadius: 1)]),
                              child: _ending
                                  ? const Padding(padding: EdgeInsets.all(21), child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                                  : const Icon(Icons.call_end, color: Colors.white, size: 28),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Live call-type + LIVE/Connecting indicator under the name.
  Widget _typePill(RgColors c, SessionProvider s) {
    final live = s.started;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 7, height: 7, decoration: BoxDecoration(color: live ? c.green : c.gold, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(
          live ? L10n.of(context).sTypeTouppercaseLive(s.type.toUpperCase()) : L10n.of(context).connecting2,
          style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w700, letterSpacing: 0.6),
        ),
      ]),
    );
  }

  // Premium gold coin pill showing the live wallet balance.
  Widget _walletPill(RgColors c, WalletProvider wallet) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [c.gold.withValues(alpha: 0.30), c.gold.withValues(alpha: 0.16)]),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: c.gold.withValues(alpha: 0.55)),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.monetization_on, size: 16, color: c.gold),
          const SizedBox(width: 5),
          Text('${wallet.balance}', style: TextStyle(color: c.gold, fontWeight: FontWeight.w900, fontSize: 14)),
        ]),
      );

  Widget _remoteView(RgColors c, SessionProvider s) {
    if (_isVideo && !_mock && !_leaving && _agora.engine != null && _agora.remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _agora.engine!,
          canvas: VideoCanvas(uid: _agora.remoteUid),
          connection: RtcConnection(channelId: s.sessionId),
        ),
      );
    }
    // Audio call, mock mode, or waiting for the remote → premium centered layout.
    final live = s.started;
    final initial = (s.astrologerName?.isNotEmpty == true ? s.astrologerName![0].toUpperCase() : '★');
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0, -0.45),
          radius: 1.1,
          colors: [c.red.withValues(alpha: 0.22), c.ground, Colors.black],
          stops: const [0.0, 0.55, 1.0],
        ),
      ),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Animated pulse/glow ring while connecting; settles once live.
          AnimatedBuilder(
            animation: _pulse,
            builder: (context, child) {
              final t = _pulse.value;
              final outer = live ? 1.0 : 1.0 + 0.18 * t;
              final fade = live ? 0.0 : (1.0 - t);
              return SizedBox(
                width: 200, height: 200,
                child: Stack(alignment: Alignment.center, children: [
                  if (!live)
                    Transform.scale(
                      scale: outer,
                      child: Container(
                        width: 160, height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: c.gold.withValues(alpha: 0.5 * fade), width: 2),
                        ),
                      ),
                    ),
                  child!,
                ]),
              );
            },
            child: Container(
              width: 138, height: 138,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                  colors: [c.gold.withValues(alpha: 0.38), c.gold.withValues(alpha: 0.14)],
                ),
                border: Border.all(color: c.gold.withValues(alpha: 0.55), width: 2),
                boxShadow: [BoxShadow(color: c.gold.withValues(alpha: 0.30), blurRadius: 36, spreadRadius: 4)],
              ),
              alignment: Alignment.center,
              child: Text(initial, style: TextStyle(color: c.gold, fontSize: 56, fontWeight: FontWeight.w800)),
            ),
          ),
          const SizedBox(height: 26),
          Text(
            s.astrologerName ?? L10n.of(context).astrologer,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 0.3),
            maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          // Call-type + LIVE indicator.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(color: live ? c.green : c.gold, shape: BoxShape.circle)),
              const SizedBox(width: 7),
              Text(
                live ? L10n.of(context).sTypeTouppercaseLive(s.type.toUpperCase()) : L10n.of(context).connecting2,
                style: const TextStyle(color: Colors.white70, fontSize: 12.5, fontWeight: FontWeight.w700, letterSpacing: 0.8),
              ),
            ]),
          ),
          const SizedBox(height: 20),
          // Big readable running timer.
          Text(
            live ? s.clock : '--:--',
            style: TextStyle(
              color: live ? Colors.white : Colors.white38,
              fontSize: 46,
              fontWeight: FontWeight.w300,
              letterSpacing: 2.5,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _ctrl(IconData on, IconData off, bool active, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 58, width: 58,
          decoration: BoxDecoration(
            color: active ? Colors.white.withValues(alpha: 0.28) : Colors.white.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.30)),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 12)],
          ),
          child: Icon(active ? off : on, color: Colors.white, size: 24),
        ),
      );
}

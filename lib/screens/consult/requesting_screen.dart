import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/session_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import 'chat_room_screen.dart';
import 'call_screen.dart';

/// "Connecting…" screen shown while the astrologer's phone rings. The user can
/// cancel here. On accept we replace this with the chat or call screen; on
/// reject/miss/cancel we pop back with a reason. Mirrors the 60s ring window.
class RequestingScreen extends StatefulWidget {
  const RequestingScreen({super.key});

  @override
  State<RequestingScreen> createState() => _RequestingScreenState();
}

class _RequestingScreenState extends State<RequestingScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  // This screen is popped from exactly one place. Both the cancel tap AND the
  // session-phase listener could otherwise each pop it (cancel() resets the
  // provider → notifyListeners → _onSession sees idle → pop), causing a DOUBLE
  // pop and a Navigator framework assertion. This latch makes navigation away
  // happen at most once.
  bool _navigatedAway = false;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat(reverse: true);
    // React to phase changes driven by the SessionProvider (socket events).
    context.read<SessionProvider>().addListener(_onSession);
  }

  @override
  void dispose() {
    _pulse.dispose();
    // Listener may already be removed if we navigated away; guard with try.
    try { context.read<SessionProvider>().removeListener(_onSession); } catch (_) {}
    super.dispose();
  }

  void _onSession() {
    final s = context.read<SessionProvider>();
    if (!mounted || _navigatedAway) return;
    if (s.phase == SessionPhase.ongoing) {
      // Accepted → go to the right live screen.
      _navigatedAway = true;
      final next = s.type == 'chat' ? const ChatRoomScreen() : const CallScreen();
      Navigator.of(context).pushReplacement(slideRoute(next));
    } else if (s.phase == SessionPhase.ended || s.phase == SessionPhase.idle) {
      // Rejected / missed / cancelled.
      _navigatedAway = true;
      final reason = s.rejectionReason;
      Navigator.of(context).pop();
      if (reason != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(reason), behavior: SnackBarBehavior.floating));
      }
      s.clear();
    }
  }

  Future<void> _cancel() async {
    // Just fire the cancel — the provider reset triggers _onSession, which pops
    // this screen exactly once (guarded by _navigatedAway). Popping here too
    // caused the double-pop Navigator assertion.
    if (_navigatedAway) return;
    await context.read<SessionProvider>().cancel(context.read<SocketService>());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final s = context.watch<SessionProvider>();
    return Scaffold(
      backgroundColor: c.ground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              AnimatedBuilder(
                animation: _pulse,
                builder: (_, child) => Container(
                  padding: EdgeInsets.all(14 + _pulse.value * 12),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: c.gold.withValues(alpha: 0.12 + _pulse.value * 0.08)),
                  child: child,
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: c.gold.withValues(alpha: 0.22),
                  child: Text(
                    (s.astrologerName?.isNotEmpty == true ? s.astrologerName![0] : '★'),
                    style: TextStyle(color: c.gold, fontSize: 44, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(s.astrologerName ?? L10n.of(context).astrologer, style: TextStyle(color: c.ink, fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(L10n.of(context).connectingYourSTypeConsultation(s.type), style: TextStyle(color: c.muted, fontSize: 14)),
              const SizedBox(height: 6),
              Text(L10n.of(context).ringingTheAstrologer, style: TextStyle(color: c.gold, fontSize: 13, fontWeight: FontWeight.w600)),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _cancel,
                  icon: const Icon(Icons.close),
                  label: Text(L10n.of(context).cancelRequest),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: c.red,
                    side: BorderSide(color: c.red),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

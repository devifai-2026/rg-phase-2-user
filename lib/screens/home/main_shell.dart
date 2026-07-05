import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../api/socket_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/session_provider.dart';
import '../../theme/rg_colors.dart';
import '../auth/signup_bonus_dialog.dart';
import '../astrologers/astrologer_list_screen.dart';
import '../consult/chat_room_screen.dart';
import '../consult/call_screen.dart';
import '../consult/requesting_screen.dart';
import '../consult/consultation_history_screen.dart';
import '../live/live_tab.dart';
import 'app_drawer.dart';
import 'home_tab.dart';

/// Post-onboarding app shell: side drawer + 5-tab bottom nav
/// (Home · AI Astro · Live · Ask · History) with a full-width Call/Chat bar
/// pinned directly above the nav bar (Home only).
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> with WidgetsBindingObserver {
  int _index = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static const _tabRoutes = ['home', 'ai-astro', 'live', 'ask', 'history'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<SocketService>().trackPage(_tabRoutes[_index]);
      // One-time welcome-bonus celebration for a brand-new user who was actually
      // credited a signup bonus. Only fires when signupBonus > 0; cleared after.
      final auth = context.read<AuthProvider>();
      if (auth.signupBonus > 0) {
        final amount = auth.signupBonus;
        auth.clearSignupBonus();
        SignupBonusDialog.show(context, amount);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // On returning to the foreground: the OS may have dropped the websocket while
    // backgrounded, so reconnect (idempotent) to restore live status broadcasts,
    // and force the home rails to re-fetch — otherwise a reopened app shows stale
    // online/offline (e.g. an astrologer who is actually online reading offline).
    if (state == AppLifecycleState.resumed) {
      context.read<SocketService>().connect();
      homeRefreshTick.value++;
    }
  }

  void _onTab(int i) {
    setState(() => _index = i);
    context.read<SocketService>().trackPage(_tabRoutes[i]);
  }

  /// Call/Chat floating buttons → the astrologer directory (same list as the
  /// "Call & Chat" See-all: full list with search, categories, filters).
  void _openAstrologers(String title) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AstrologerListScreen(title: title)));

  /// Reopen the minimized consultation. A still-ringing request reopens the
  /// REQUESTING screen (waiting for the astrologer); a live one reopens the
  /// chat/call room.
  void _resumeSession(SessionProvider s) {
    final Widget screen = s.phase == SessionPhase.ringing
        ? const RequestingScreen()
        : (s.type == 'chat' ? const ChatRoomScreen() : const CallScreen());
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final session = context.watch<SessionProvider>();

    // Back at the home root exits the app — confirm first so a stray back gesture
    // doesn't drop the user out. Cancel (Stay) is emphasized to keep them in.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final leave = await _confirmExit(context);
        if (leave == true) SystemNavigator.pop();
      },
      child: _buildShell(context, session),
    );
  }

  Future<bool?> _confirmExit(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: c.card,
        title: Text(t.exitAppTitle, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        content: Text(t.exitAppBody, style: TextStyle(color: c.muted)),
        actions: [
          // Exit = de-emphasized text button.
          TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(t.exitAppConfirm, style: TextStyle(color: c.muted))),
          // Stay = emphasized filled button (nudge the user to remain).
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: c.red),
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.stay, style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }

  Widget _buildShell(BuildContext context, SessionProvider session) {
    final c = context.rg;
    final tabs = [
      HomeTab(onMenu: () => _scaffoldKey.currentState?.openDrawer()),
      const AstrologerListScreen(aiMode: true), // AI Astro → AI list (chat-only)
      const LiveTab(), // Live → astrologers broadcasting now
      const AstrologerListScreen(), // Ask → human astrologer list
      const ConsultationHistoryScreen(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: c.ground,
      drawer: const AppDrawer(),
      // Plain child swap — no AnimatedSwitcher. The AnimatedSwitcher wraps its
      // child in a Stack, and that Stack sat in the failing layout chain for the
      // Live tab: a vertical ListView under the Stack received unbounded width,
      // so the card's Join ElevatedButton got an Infinity constraint and the
      // page rendered black ("RenderBox was not laid out"). A direct child gives
      // each tab the Scaffold body's tight constraints. (Tab-switch fade/slide
      // is dropped; can be reintroduced later with a transition that doesn't
      // interpose a Stack, e.g. per-tab FadeTransition inside the tab itself.)
      body: KeyedSubtree(key: ValueKey(_index), child: tabs[_index]),

      // Bottom area = (resume bar if a session is live) + pinned Call/Chat bar
      // (Home only) + the nav bar.
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // A live (minimized) session → a tappable resume bar with the timer.
          if (session.isActive)
            _ResumeBar(
              type: session.type,
              label: session.started ? L10n.of(context).resumeSessionClock(session.clock) : L10n.of(context).resumeSession,
              onTap: () => _resumeSession(session),
            ),
          if (_index == 0 && !session.isActive)
            _CallChatBar(
              onCall: () => _openAstrologers(L10n.of(context).call),
              onChat: () => _openAstrologers(L10n.of(context).chat),
            ),
          _NavBar(index: _index, onTap: _onTab),
        ],
      ),
    );
  }
}

/// Full-width "Resume" bar shown above the nav when a consultation is live but
/// minimized — tapping reopens the room. Carries the live timer.
class _ResumeBar extends StatelessWidget {
  final String type;
  final String label;
  final VoidCallback onTap;
  const _ResumeBar({required this.type, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Material(
      color: c.ground,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          decoration: BoxDecoration(color: c.gold, borderRadius: BorderRadius.circular(14)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(type == 'chat' ? Icons.chat_bubble : (type == 'video' ? Icons.videocam : Icons.call), color: const Color(0xFF1A1408), size: 18),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Color(0xFF1A1408), fontWeight: FontWeight.w800, fontSize: 15)),
          ]),
        ),
      ),
    );
  }
}

/// Full-width green Call + blue Chat pair, like the reference app.
class _CallChatBar extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onChat;
  const _CallChatBar({required this.onCall, required this.onChat});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Container(
      // Match the nav-bar surface so the bottom reads as one cohesive area
      // (not a black strip behind the buttons).
      decoration: BoxDecoration(
        color: c.ground2,
        border: Border(top: BorderSide(color: c.line)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Row(
        children: [
          // Brand palette: Call = crimson (primary), Chat = copper (secondary).
          Expanded(child: _pill(label: L10n.of(context).call, icon: Icons.call, color: c.red, fg: Colors.white, onTap: onCall)),
          const SizedBox(width: 12),
          Expanded(child: _pill(label: L10n.of(context).chat, icon: Icons.chat_bubble, color: c.gold, fg: const Color(0xFF1A1408), onTap: onChat)),
        ],
      ),
    );
  }

  Widget _pill({required String label, required IconData icon, required Color color, required Color fg, required VoidCallback onTap}) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: fg, size: 20),
              const SizedBox(width: 10),
              Text(label, style: TextStyle(color: fg, fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const _NavBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: c.ground2,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) => TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: states.contains(WidgetState.selected) ? c.red : c.muted,
            )),
        iconTheme: WidgetStateProperty.resolveWith((states) => IconThemeData(
              color: states.contains(WidgetState.selected) ? c.red : c.muted,
            )),
      ),
      child: NavigationBar(
        height: 62,
        selectedIndex: index,
        onDestinationSelected: onTap,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: L10n.of(context).home),
          NavigationDestination(icon: const Icon(Icons.auto_awesome_outlined), selectedIcon: const Icon(Icons.auto_awesome), label: L10n.of(context).aiAstro),
          NavigationDestination(icon: const Icon(Icons.live_tv_outlined), selectedIcon: const Icon(Icons.live_tv), label: L10n.of(context).live2),
          NavigationDestination(icon: const Icon(Icons.chat_bubble_outline), selectedIcon: const Icon(Icons.chat_bubble), label: L10n.of(context).ask),
          NavigationDestination(icon: const Icon(Icons.history), selectedIcon: const Icon(Icons.history), label: L10n.of(context).history),
        ],
      ),
    );
  }
}

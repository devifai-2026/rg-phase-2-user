import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/ai_api.dart';
import '../../api/api_client.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/shared_product_card.dart';

/// One turn in the AI conversation.
class _Turn {
  final bool mine;
  final String text;
  final List<AiMantra> mantras;
  final List<dynamic> products; // SharedProduct
  final bool pending;
  const _Turn({required this.mine, required this.text, this.mantras = const [], this.products = const [], this.pending = false});
}

/// AI astrologer chat.
///
/// Mirrors the human consultation room (ChatRoomScreen) so the two feel like one
/// product, with three deliberate differences:
///  - NO image attach and NO gift. An AI cannot receive either, and the gift entry
///    exists in two places in the human screen (input row + AppBar menu), so both
///    are simply absent here.
///  - Language chips before the first message. Opening the chat is free and the
///    meter starts on the first message, so choosing a language costs nothing.
///  - Mantra cards. The AI suggests free remedies, which have no equivalent in the
///    human chat's message types.
class AiChatScreen extends StatefulWidget {
  final AiPersona? persona;

  /// Optional life area, when opened from a topic entry point.
  final String? topic;
  const AiChatScreen({super.key, this.persona, this.topic});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> with WidgetsBindingObserver {
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final List<_Turn> _turns = [];

  AiChatStart? _session;
  String? _lang;              // null until the seeker picks
  bool _starting = true;
  bool _sending = false;
  bool _ended = false;
  String? _error;
  int _minutesLeft = 0;
  int _billedMinutes = 0;

  AiApi get _api => context.read<AiApi>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Default to the app language, but let the seeker override with a chip.
    _lang = context.read<SettingsProvider>().effectiveLangCode;
    _open();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Best-effort: release any unspent reservation. The server's idle timer is the
    // real guarantee, so a failure here is harmless.
    final id = _session?.aiSessionId;
    if (id != null && !_ended) _api.endChat(id);
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Backgrounding the app is not "still consulting". End the meter early rather
    // than relying on the idle sweep, so the seeker is not billed while away.
    if (state == AppLifecycleState.paused && _session != null && !_ended) {
      _api.endChat(_session!.aiSessionId);
      if (mounted) setState(() => _ended = true);
    }
  }

  Future<void> _open() async {
    try {
      final s = await _api.startChat(personaId: widget.persona?.id, topic: widget.topic, lang: _lang);
      if (!mounted) return;
      setState(() {
        _session = s;
        _minutesLeft = s.minutesAffordable;
        _starting = false;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() { _error = e.message; _starting = false; });
    } catch (_) {
      if (mounted) setState(() { _error = L10n.of(context).somethingWentWrong; _starting = false; });
    }
  }

  void _jumpToEnd() {
    if (_scroll.hasClients) {
      _scroll.animateTo(_scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    }
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending || _ended || _session == null) return;
    _input.clear();
    setState(() {
      _turns.add(_Turn(mine: true, text: text));
      _turns.add(const _Turn(mine: false, text: '', pending: true));
      _sending = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToEnd());

    try {
      final r = await _api.sendMessage(_session!.aiSessionId, text);
      if (!mounted) return;
      setState(() {
        _turns.removeLast(); // the pending placeholder
        _turns.add(_Turn(mine: false, text: r.reply, mantras: r.mantras, products: r.products));
        _minutesLeft = r.minutesLeft;
        _billedMinutes = r.billedMinutes;
        _ended = r.ended;
        _sending = false;
      });
      // The wallet moved: refresh the home balance pill.
      context.read<WalletProvider>().refresh();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _turns.removeLast();
        _sending = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      if (!mounted) return;
      setState(() { _turns.removeLast(); _sending = false; });
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToEnd());
    }
  }

  Future<void> _confirmEnd() async {
    final c = context.rg;
    final t = L10n.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: c.card,
        title: Text(t.endConsultation, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        content: Text(t.thisWillEndTheChatAnd, style: TextStyle(color: c.muted)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.keepChatting)),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: Text(t.end)),
        ],
      ),
    );
    if (ok == true && _session != null) {
      await _api.endChat(_session!.aiSessionId);
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final name = widget.persona?.name ?? t.aiAstrologers;
    final rate = _session?.ratePerMin ?? widget.persona?.chatRatePerMin ?? 0;

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        titleSpacing: 0,
        // NOTE: no gift action and no PopupMenuButton. The human chat screen has
        // both; an AI can receive neither.
        title: Row(children: [
          Container(
            height: 36, width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [c.violet, c.indigo]),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: c.ink, fontSize: 15, fontWeight: FontWeight.w700)),
                Row(children: [
                  Icon(Icons.bolt, size: 11, color: c.muted),
                  const SizedBox(width: 2),
                  // Cost transparency: the rate is always visible, and once the
                  // meter runs so are the minutes billed and left.
                  Text(
                    rate > 0
                        ? (_billedMinutes > 0
                            ? '₹$rate/min · ${t.minLeftMinutes('$_minutesLeft')}'
                            : '₹$rate/min')
                        : t.free,
                    style: TextStyle(color: c.muted, fontSize: 11),
                  ),
                ]),
              ],
            ),
          ),
        ]),
        actions: [
          if (!_ended && _session != null)
            IconButton(
              tooltip: t.end,
              onPressed: _confirmEnd,
              icon: Icon(Icons.call_end, color: c.red),
            ),
        ],
      ),
      body: SafeArea(
        child: _starting
            ? Center(child: CircularProgressIndicator(color: c.violet))
            : _error != null
                ? _errorState(c, t)
                : Column(children: [
                    Expanded(child: _body(c, t)),
                    if (_ended) _endedBar(c, t) else _inputBar(c, t),
                  ]),
      ),
    );
  }

  Widget _errorState(RgColors c, L10n t) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.error_outline, color: c.muted, size: 40),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: c.muted)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () { setState(() { _error = null; _starting = true; }); _open(); },
              child: Text(t.retry),
            ),
          ]),
        ),
      );

  Widget _body(RgColors c, L10n t) {
    if (_turns.isEmpty) return _greeting(c, t);
    return ListView.builder(
      controller: _scroll,
      padding: const EdgeInsets.all(16),
      itemCount: _turns.length,
      itemBuilder: (_, i) => _bubble(c, _turns[i]),
    );
  }

  /// Pre-chat state: a warm greeting plus the language chips.
  ///
  /// The chips live HERE rather than in a settings screen because the seeker's
  /// chat language is a per-conversation choice, and because the meter has not
  /// started yet, so picking one is free.
  Widget _greeting(RgColors c, L10n t) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
      children: [
        Center(
          child: Container(
            height: 64, width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [c.violet, c.indigo]),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 16),
        Text(t.aiGreetingTitle, textAlign: TextAlign.center,
            style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        Text(t.aiGreetingBody, textAlign: TextAlign.center,
            style: TextStyle(color: c.muted, fontSize: 13, height: 1.4)),
        const SizedBox(height: 24),
        Text(t.aiPickLanguage, style: TextStyle(color: c.ink, fontSize: 13, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final loc in SettingsProvider.supportedLocales)
              _langChip(c, loc.languageCode, SettingsProvider.languageNames[loc.languageCode] ?? loc.languageCode),
          ],
        ),
        const SizedBox(height: 20),
        if ((_session?.ratePerMin ?? 0) > 0)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: c.aiSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: c.violet.withValues(alpha: 0.35)),
            ),
            // State the billing contract plainly BEFORE the seeker starts. The
            // meter begins on the first message, not on opening this screen.
            child: Row(children: [
              Icon(Icons.info_outline, size: 16, color: c.violet),
              const SizedBox(width: 8),
              Expanded(
                child: Text(t.aiBillingNote('${_session!.ratePerMin}'),
                    style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.35)),
              ),
            ]),
          ),
      ],
    );
  }

  Widget _langChip(RgColors c, String code, String label) {
    final selected = _lang == code;
    return InkWell(
      onTap: () => setState(() => _lang = code),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? c.violet.withValues(alpha: 0.16) : c.ground2,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? c.violet : c.line, width: selected ? 1.4 : 1),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (selected) ...[Icon(Icons.check, size: 13, color: c.violet), const SizedBox(width: 5)],
          Text(label, style: TextStyle(
            color: selected ? c.violet : c.ink,
            fontSize: 12.5,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          )),
        ]),
      ),
    );
  }

  Widget _bubble(RgColors c, _Turn turn) {
    if (turn.pending) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: c.line),
          ),
          child: SizedBox(
            height: 14, width: 14,
            child: CircularProgressIndicator(strokeWidth: 1.8, color: c.violet),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: turn.mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: turn.mine ? c.gold : c.ground2,
            borderRadius: BorderRadius.circular(14),
            border: turn.mine ? null : Border.all(color: c.line),
          ),
          child: Text(
            turn.text,
            style: TextStyle(
              color: turn.mine ? const Color(0xFF1A1408) : c.ink,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
        // Free remedies, in the app's established "this is AI" visual language.
        for (final m in turn.mantras) _mantraCard(c, m),
        for (final p in turn.products)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SharedProductCard(product: p, mine: false),
          ),
      ],
    );
  }

  Widget _mantraCard(RgColors c, AiMantra m) {
    final t = L10n.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.82),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.aiSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.violet.withValues(alpha: 0.35)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.self_improvement, size: 14, color: c.violet),
          const SizedBox(width: 6),
          Text(t.aiRemedy, style: TextStyle(color: c.violet, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.3)),
        ]),
        const SizedBox(height: 8),
        SelectableText(m.text, style: TextStyle(color: c.ink, fontSize: 14, fontWeight: FontWeight.w600, height: 1.4)),
        if (m.detail.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(m.detail, style: TextStyle(color: c.gold, fontSize: 11.5, fontWeight: FontWeight.w600)),
        ],
        if (m.reason != null && m.reason!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(m.reason!, style: TextStyle(color: c.muted, fontSize: 11.5, height: 1.3)),
        ],
      ]),
    );
  }

  Widget _endedBar(RgColors c, L10n t) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            _billedMinutes > 0 ? t.aiEndedBilled('$_billedMinutes') : t.aiEnded,
            style: TextStyle(color: c.muted, fontSize: 12.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(t.done),
            ),
          ),
        ]),
      );

  Widget _inputBar(RgColors c, L10n t) => Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 12),
        decoration: BoxDecoration(color: c.ground2, border: Border(top: BorderSide(color: c.line))),
        // NOTE: no image button and no gift button. See the class doc.
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: _input,
              minLines: 1,
              maxLines: 4,
              maxLength: 2000,
              enabled: !_sending,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _send(),
              style: TextStyle(color: c.ink),
              decoration: InputDecoration(
                counterText: '',
                hintText: t.askYourQuestion,
                hintStyle: TextStyle(color: c.muted),
                filled: true,
                fillColor: c.ground,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: c.line)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: c.line)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: c.violet)),
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: _sending ? null : _send,
            icon: _sending
                ? SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: c.violet))
                : Icon(Icons.send, color: c.violet),
          ),
        ]),
      );
}

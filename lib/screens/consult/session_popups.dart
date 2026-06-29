import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/session_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/session_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import '../wallet/wallet_screen.dart';

/// Bottom sheet shown on a `low-balance-warning` — "~N min left, recharge to
/// continue". Opening recharge does NOT end the session; on a successful
/// recharge the backend extends the lock and emits `session-extended`.
Future<void> showLowBalanceSheet(BuildContext context, int? minutesLeft) {
  final c = context.rg;
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    builder: (sheetCtx) => Container(
      decoration: BoxDecoration(
        color: c.ground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        border: Border.all(color: c.line),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 18, 20, 18 + MediaQuery.of(sheetCtx).padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_balance_wallet_outlined, color: c.red, size: 40),
            const SizedBox(height: 12),
            Text(
              minutesLeft != null && minutesLeft > 0
                  ? L10n.of(context).aboutMinutesleftMinLeft(minutesLeft)
                  : L10n.of(context).lowBalance,
              style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              L10n.of(context).rechargeNowToKeepYourConsultation,
              textAlign: TextAlign.center,
              style: TextStyle(color: c.muted, fontSize: 13.5, height: 1.35),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(sheetCtx).pop();
                  Navigator.of(context).push(slideRoute(const WalletScreen()));
                },
                icon: const Icon(Icons.add),
                label: Text(L10n.of(context).recharge),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(sheetCtx).pop(),
              child: Text(L10n.of(context).notNow, style: TextStyle(color: c.muted)),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Post-session review/summary dialog. Shows duration + coins deducted, then —
/// depending on the backend `reviewable` state — lets the user rate the
/// astrologer (1-5 stars + comment, only the FIRST time they review that
/// astrologer) and/or rate the call quality (1-5, audio/video only, per call).
/// Skippable. Returns when dismissed.
Future<void> showSessionEndDialog(BuildContext context, SessionEndSummary summary, {String? astrologerName}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => _SessionEndDialog(summary: summary, astrologerName: astrologerName),
  );
}

class _SessionEndDialog extends StatefulWidget {
  final SessionEndSummary summary;
  final String? astrologerName;
  const _SessionEndDialog({required this.summary, this.astrologerName});
  @override
  State<_SessionEndDialog> createState() => _SessionEndDialogState();
}

class _SessionEndDialogState extends State<_SessionEndDialog> {
  int _rating = 0;       // astrologer review (1-5)
  int _callQuality = 0;  // call-quality (1-5, audio/video)
  final _comment = TextEditingController();
  bool _submitting = false;

  // Which blocks to show — resolved from the backend on open. Until loaded we
  // show only the summary + a spinner where the rating blocks will go.
  ReviewableState? _state;
  bool _loadingState = true;

  bool get _showAstrologer => _state?.canReviewAstrologer ?? false;
  bool get _showCallQuality => _state?.canRateCallQuality ?? false;
  // Submit enabled once the user has supplied input for every block shown.
  bool get _canSubmit =>
      (!_showAstrologer || _rating > 0) &&
      (!_showCallQuality || _callQuality > 0) &&
      (_showAstrologer || _showCallQuality);

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    try {
      final s = await context.read<SessionApi>().reviewable(widget.summary.sessionId);
      if (!mounted) return;
      setState(() { _state = s; _loadingState = false; });
    } catch (_) {
      // On failure, fall back to the legacy behaviour (ask astrologer rating) so
      // the user can still leave feedback.
      if (!mounted) return;
      setState(() {
        _state = const ReviewableState(canReviewAstrologer: true, canRateCallQuality: false, serviceType: '');
        _loadingState = false;
      });
    }
  }

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_canSubmit || _submitting) return;
    setState(() => _submitting = true);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final t = L10n.of(context);
    try {
      await context.read<SessionApi>().review(
            widget.summary.sessionId,
            rating: _showAstrologer ? _rating : null,
            comment: _showAstrologer ? _comment.text : null,
            callQuality: _showCallQuality ? _callQuality : null,
          );
      if (!mounted) return;
      navigator.pop();
      messenger.showSnackBar(SnackBar(content: Text(t.thanksForYourFeedback)));
    } catch (_) {
      if (!mounted) return;
      setState(() => _submitting = false);
      messenger.showSnackBar(SnackBar(content: Text(t.couldNotSubmitPleaseTryAgain)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final s = widget.summary;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [c.ground2, c.ground],
          ),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: c.line),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.45), blurRadius: 36, offset: const Offset(0, 18))],
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Crest.
                  Container(
                    height: 72, width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [c.gold.withValues(alpha: 0.28), c.gold.withValues(alpha: 0.06)]),
                      border: Border.all(color: c.gold.withValues(alpha: 0.5), width: 1.4),
                    ),
                    child: Icon(Icons.auto_awesome, color: c.gold, size: 36),
                  ),
                  const SizedBox(height: 14),
                  Text(L10n.of(context).consultationEnded, style: TextStyle(color: c.ink, fontSize: 20, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(L10n.of(context).hopeYouGotTheClarityYou, textAlign: TextAlign.center, style: TextStyle(color: c.muted, fontSize: 13)),
                  const SizedBox(height: 18),

                  // Summary: duration + coins deducted.
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: c.ground.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _stat(c, Icons.timer_outlined, s.durationLabel, L10n.of(context).duration),
                        Container(width: 1, height: 34, color: c.line),
                        _stat(c, Icons.monetization_on_outlined, '${s.totalAmount}', L10n.of(context).coinsUsed, highlight: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // While resolving what to ask, show a small spinner in place of
                  // the rating blocks.
                  if (_loadingState)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2, color: c.gold)),
                    ),

                  // ── Astrologer review (only the first time you review them) ──
                  if (!_loadingState && _showAstrologer) ...[
                    Text('Rate ${widget.astrologerName ?? 'the astrologer'}', style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14.5)),
                    const SizedBox(height: 8),
                    _stars(c, _rating, (v) => setState(() => _rating = v)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _comment,
                      maxLines: 3,
                      minLines: 1,
                      maxLength: 1000,
                      style: TextStyle(color: c.ink),
                      decoration: InputDecoration(
                        hintText: L10n.of(context).shareYourExperienceOptional,
                        hintStyle: TextStyle(color: c.muted),
                        filled: true,
                        fillColor: c.ground2,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
                        counterText: '',
                      ),
                    ),
                  ],

                  // ── Call quality (audio/video, once per call) ──
                  if (!_loadingState && _showCallQuality) ...[
                    if (_showAstrologer) const SizedBox(height: 16),
                    Text(L10n.of(context).howWasTheCallQuality, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14.5)),
                    const SizedBox(height: 8),
                    _stars(c, _callQuality, (v) => setState(() => _callQuality = v)),
                  ],

                  const SizedBox(height: 18),
                  Row(children: [
                    Expanded(
                      child: TextButton(
                        onPressed: _submitting ? null : () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13)),
                        child: Text(L10n.of(context).skip, style: TextStyle(color: c.muted, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                        ),
                        onPressed: (!_canSubmit || _submitting) ? null : _submit,
                        child: _submitting
                            ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                            : Text(L10n.of(context).submit, style: const TextStyle(fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            // Close (X) — dismiss without reviewing.
            Positioned(
              top: 8, right: 8,
              child: IconButton(
                onPressed: _submitting ? null : () => Navigator.of(context).pop(),
                icon: Icon(Icons.close_rounded, color: c.muted, size: 22),
                tooltip: L10n.of(context).close,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(RgColors c, IconData icon, String value, String label, {bool highlight = false}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: highlight ? c.gold : c.muted, size: 22),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(color: highlight ? c.gold : c.ink, fontWeight: FontWeight.w800, fontSize: 16.5)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: c.muted, fontSize: 10.5)),
        ],
      );

  /// A 1-5 star picker. `value` is the current rating; `onPick` sets it.
  Widget _stars(RgColors c, int value, ValueChanged<int> onPick) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (i) {
          final on = i < value;
          return IconButton(
            onPressed: () => onPick(i + 1),
            icon: Icon(on ? Icons.star_rounded : Icons.star_border_rounded, color: c.gold, size: 34),
            padding: const EdgeInsets.symmetric(horizontal: 2),
            constraints: const BoxConstraints(),
          );
        }),
      );
}

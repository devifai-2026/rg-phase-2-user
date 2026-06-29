import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../api/gift_api.dart';
import '../../providers/wallet_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/cached_image.dart';
import '../wallet/wallet_screen.dart';
import '../../widgets/slide_route.dart';

/// Send a real gift to an astrologer: loads the catalog from GET /gifts, lets
/// the user pick one + a quantity, then sends via POST /gifts/send (debits the
/// wallet). [astrologerUserId] is the receiver (the astrologer's USER id); when
/// null the sheet is read-only (no real target — e.g. a static/demo card).
Future<void> showGiftSheet(BuildContext context, String astrologerName, {String? astrologerUserId, String? sessionId, String? liveSessionId}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _GiftSheet(astrologerName: astrologerName, astrologerUserId: astrologerUserId, sessionId: sessionId, liveSessionId: liveSessionId),
  );
}

/// Map a gift name to a distinct emoji (the admin catalog items have no image).
String _giftEmoji(String name) {
  final n = name.toLowerCase();
  if (n.contains('rose') || n.contains('flower')) return '🌹';
  if (n.contains('diya') || n.contains('lamp') || n.contains('candle')) return '🪔';
  if (n.contains('garland') || n.contains('mala')) return '💐';
  if (n.contains('lotus')) return '🪷';
  if (n.contains('coconut')) return '🥥';
  if (n.contains('sweet') || n.contains('laddu') || n.contains('mithai')) return '🍬';
  if (n.contains('heart') || n.contains('love')) return '❤️';
  if (n.contains('star')) return '⭐';
  if (n.contains('crown')) return '👑';
  if (n.contains('gold') || n.contains('coin')) return '🪙';
  return '🎁';
}

class _GiftSheet extends StatefulWidget {
  final String astrologerName;
  final String? astrologerUserId;
  final String? sessionId; // when sent inside a live chat → links the gift + shows a live bubble
  final String? liveSessionId; // when sent inside a live broadcast → superchat
  const _GiftSheet({required this.astrologerName, this.astrologerUserId, this.sessionId, this.liveSessionId});
  @override
  State<_GiftSheet> createState() => _GiftSheetState();
}

class _GiftSheetState extends State<_GiftSheet> {
  List<Gift>? _gifts;
  String? _error;
  int _selected = 0;
  int _qty = 1;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _loadCatalog();
  }

  Future<void> _loadCatalog() async {
    try {
      final list = await context.read<GiftApi>().catalog();
      if (mounted) setState(() => _gifts = list);
    } catch (_) {
      if (mounted) setState(() => _error = L10n.of(context).couldNotLoadGifts);
    }
  }

  void _setQty(int v) => setState(() => _qty = v.clamp(1, 100));

  Future<void> _send() async {
    final gifts = _gifts;
    if (gifts == null || gifts.isEmpty || _sending) return;
    final gift = gifts[_selected];
    final receiver = widget.astrologerUserId;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    if (receiver == null) {
      messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).giftingUnavailableForThisAstrologer)));
      return;
    }
    final giftApi = context.read<GiftApi>();
    final wallet = context.read<WalletProvider>();
    final navigatorForRecharge = navigator;

    // Pre-send token/balance check: total ₹ cost vs the live wallet balance.
    final totalCost = gift.rupeeCost * _qty;
    if (totalCost > wallet.balance) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(L10n.of(context).needTotalcostYourBalanceIsWallet(totalCost, wallet.balance)),
          action: SnackBarAction(label: L10n.of(context).recharge, onPressed: () => navigatorForRecharge.push(slideRoute(const WalletScreen()))),
        ));
      return;
    }
    setState(() => _sending = true);
    try {
      // Backend sends one gift per call; loop for the chosen quantity.
      // Pass sessionId when sent inside a live chat so it links to the session
      // and surfaces as a live gift bubble to both sides.
      for (var i = 0; i < _qty; i++) {
        await giftApi.send(giftId: gift.id, receiverUserId: receiver, sessionId: widget.sessionId, liveSessionId: widget.liveSessionId);
      }
      await wallet.refresh(); // reflect the debit
      if (!mounted) return;
      navigator.pop();
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(L10n.of(context).sentQtyGiftNameToWidget(_qty, gift.name, widget.astrologerName))));
    } catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      final msg = e.toString().toLowerCase();
      final lowBalance = msg.contains('balance') || msg.contains('insufficient');
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(lowBalance ? L10n.of(context).notEnoughBalanceAddMoneyTo : L10n.of(context).couldNotSendTheGiftPlease),
          action: lowBalance
              ? SnackBarAction(label: L10n.of(context).recharge, onPressed: () => navigator.push(slideRoute(const WalletScreen())))
              : null,
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final gifts = _gifts;
    final gift = (gifts != null && gifts.isNotEmpty) ? gifts[_selected] : null;
    final total = gift != null ? gift.tokenCost * _qty : 0;

    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: c.ground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        border: Border.all(color: c.line),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2))),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
            child: Row(children: [
              Icon(Icons.card_giftcard, color: c.gold, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(L10n.of(context).sendAGiftToWidgetAstrologername(widget.astrologerName), style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800))),
            ]),
          ),
          // Live wallet balance + quick recharge.
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 4),
            child: Row(children: [
              Icon(Icons.account_balance_wallet_outlined, color: c.muted, size: 15),
              const SizedBox(width: 6),
              Text(L10n.of(context).balanceContextWatchWalletproviderBalance(context.watch<WalletProvider>().balance),
                  style: TextStyle(color: c.muted, fontSize: 12.5, fontWeight: FontWeight.w600)),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.of(context).push(slideRoute(const WalletScreen())),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: c.gold.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(20), border: Border.all(color: c.gold.withValues(alpha: 0.5))),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.add, color: c.gold, size: 14),
                    const SizedBox(width: 3),
                    Text(L10n.of(context).recharge, style: TextStyle(color: c.gold, fontSize: 11.5, fontWeight: FontWeight.w800)),
                  ]),
                ),
              ),
            ]),
          ),

          // Catalog states: loading / error / grid.
          if (gifts == null && _error == null)
            const Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator())
          else if (_error != null)
            Padding(padding: const EdgeInsets.all(32), child: Text(_error!, style: TextStyle(color: c.muted)))
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gifts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.82,
                ),
                itemBuilder: (_, i) {
                  final g = gifts[i];
                  final on = i == _selected;
                  return GestureDetector(
                    onTap: () => setState(() => _selected = i),
                    child: Container(
                      decoration: BoxDecoration(
                        color: on ? c.redSoft : c.ground2,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: on ? c.red : c.line, width: on ? 1.4 : 1),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SizedBox(
                          height: 30, width: 30,
                          child: (g.image != null && g.image!.isNotEmpty)
                              ? CachedImage(url: g.image, fit: BoxFit.contain, fallbackIcon: Icons.card_giftcard)
                              // No image on the catalog item → a distinct emoji per gift name.
                              : Center(child: Text(_giftEmoji(g.name), style: const TextStyle(fontSize: 22))),
                        ),
                        const SizedBox(height: 4),
                        Text(g.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: c.ink, fontSize: 10.5, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 1),
                        Text(L10n.of(context).gTokencostTk(g.tokenCost), style: TextStyle(color: c.gold, fontSize: 9.5, fontWeight: FontWeight.w700)),
                      ]),
                    ),
                  );
                },
              ),
            ),

          // Quantity stepper (1–100).
          if (gift != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
              child: Row(children: [
                Text(L10n.of(context).quantity, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600, fontSize: 13)),
                const Spacer(),
                _stepBtn(c, Icons.remove, () => _setQty(_qty - 1)),
                SizedBox(
                  width: 52,
                  child: Text('$_qty', textAlign: TextAlign.center, style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w800)),
                ),
                _stepBtn(c, Icons.add, () => _setQty(_qty + 1)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerRight, child: Text(L10n.of(context).min1Max100, style: TextStyle(color: c.muted, fontSize: 10.5))),
            ),
          ],

          // Send.
          Padding(
            padding: EdgeInsets.fromLTRB(20, 14, 20, 16 + MediaQuery.of(context).padding.bottom),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (gift == null || _sending) ? null : _send,
                child: _sending
                    ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : Text(gift == null ? L10n.of(context).send : L10n.of(context).sendTotalTokens(total)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepBtn(RgColors c, IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 34, width: 34,
        decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.line)),
        child: Icon(icon, color: c.ink, size: 18),
      ),
    );
  }
}

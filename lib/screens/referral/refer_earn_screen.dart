import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/app_config_service.dart';
import '../../api/referral_api.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/rg_colors.dart';

/// Premium "Refer & Earn" screen — hero, referral code with copy/share, the
/// reward explainer, friends-invited count, and (for new users) apply-a-code.
class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  ReferralInfo? _info;
  bool _loading = true;
  final _codeCtrl = TextEditingController();
  bool _applying = false;
  String? _applyError, _applyOk;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() { _codeCtrl.dispose(); super.dispose(); }

  Future<void> _load() async {
    try {
      final info = await context.read<ReferralApi>().get();
      if (mounted) setState(() { _info = info; _loading = false; });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  String get _shareText {
    final i = _info!;
    return 'Join me on Astro App ✨ Use my code ${i.code} on your first recharge and we BOTH get ₹${i.reward}! Talk to expert astrologers, book poojas & more.\nhttps://astroapp.example';
  }

  Future<void> _applyCode() async {
    final code = _codeCtrl.text.trim().toUpperCase();
    if (code.isEmpty) return;
    final t = L10n.of(context);
    setState(() { _applying = true; _applyError = null; _applyOk = null; });
    try {
      await context.read<ReferralApi>().apply(code);
      if (!mounted) return;
      setState(() { _applyOk = t.appliedYouBothEarnOnYour; });
      _load();
    } catch (e) {
      if (mounted) setState(() => _applyError = e.toString().replaceAll(RegExp(r'^.*Exception: '), ''));
    } finally {
      if (mounted) setState(() => _applying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final i = _info;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: c.ground, elevation: 0,
        title: Text(L10n.of(context).referEarn, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 19))),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: c.red))
          : i == null
              ? Center(child: Text(L10n.of(context).couldNotLoadTryAgain, style: TextStyle(color: c.muted)))
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                  children: [
                    // ── Hero ──
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 26, 20, 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: LinearGradient(colors: [c.red, c.redDeep], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        boxShadow: [BoxShadow(color: c.red.withValues(alpha: 0.3), blurRadius: 18, offset: const Offset(0, 8))],
                      ),
                      child: Column(children: [
                        const Icon(Icons.card_giftcard, color: Colors.white, size: 44),
                        const SizedBox(height: 12),
                        Text(L10n.of(context).shareEarnIReward(i.reward), textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24)),
                        const SizedBox(height: 6),
                        Text(L10n.of(context).youGetIRewardOnYour(i.reward, i.reward),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 13.5, height: 1.45)),
                      ]),
                    ),
                    const SizedBox(height: 18),

                    // ── Referral code ──
                    Text(L10n.of(context).yourReferralCode, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 14, 10, 14),
                      decoration: BoxDecoration(
                        color: c.ground2, borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: c.gold.withValues(alpha: 0.6), width: 1.4),
                      ),
                      child: Row(children: [
                        Expanded(child: Text(i.code,
                            style: TextStyle(color: c.ink, fontWeight: FontWeight.w900, fontSize: 22, letterSpacing: 2))),
                        IconButton(
                          icon: Icon(Icons.copy_rounded, color: c.gold, size: 20),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: i.code));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.of(context).codeCopied), behavior: SnackBarBehavior.floating));
                          },
                        ),
                      ]),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => Share.share(_shareText, subject: L10n.of(context).earnIRewardOnRudraganga(i.reward, context.read<AppConfigService>().appName)),
                        icon: const Icon(Icons.share, size: 18),
                        label: Text(L10n.of(context).shareEarn),
                        style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(52)),
                      ),
                    ),

                    // ── Friends invited ──
                    if (i.referralCount > 0) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: c.green.withValues(alpha: 0.10), borderRadius: BorderRadius.circular(14)),
                        child: Row(children: [
                          Icon(Icons.groups, color: c.green, size: 22),
                          const SizedBox(width: 10),
                          Expanded(child: Text('${i.referralCount} friend${i.referralCount == 1 ? '' : 's'} recharged using your code 🎉',
                              style: TextStyle(color: c.green, fontWeight: FontWeight.w700, fontSize: 13.5))),
                        ]),
                      ),
                    ],

                    // ── How it works ──
                    const SizedBox(height: 22),
                    Text(L10n.of(context).howItWorks, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                    const SizedBox(height: 10),
                    _step(c, '1', Icons.ios_share, L10n.of(context).shareYourCode, L10n.of(context).sendYourCodeToFriendsVia),
                    _step(c, '2', Icons.person_add_alt, L10n.of(context).friendSignsUp, L10n.of(context).theyEnterYourCodeInRefer),
                    _step(c, '3', Icons.account_balance_wallet, L10n.of(context).bothEarnIReward(i.reward), L10n.of(context).onTheirFirstWalletRechargeYou(i.reward)),

                    // ── Apply a code (new users only) ──
                    if (i.canApplyCode) ...[
                      const SizedBox(height: 22),
                      Text(L10n.of(context).haveAFriendSCode, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 15)),
                      const SizedBox(height: 8),
                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Expanded(child: TextField(
                          controller: _codeCtrl,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(hintText: L10n.of(context).enterReferralCode, isDense: true, errorText: _applyError),
                        )),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _applying ? null : _applyCode,
                          // The global elevatedButtonTheme sets minimumSize: Size.fromHeight(54)
                          // (minWidth = infinity), which blows up inside a Row. Pin a finite size.
                          style: ElevatedButton.styleFrom(minimumSize: const Size(88, 46)),
                          child: _applying ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white)) : Text(L10n.of(context).apply),
                        ),
                      ]),
                      if (_applyOk != null) Padding(padding: const EdgeInsets.only(top: 8), child: Text(_applyOk!, style: TextStyle(color: c.green, fontSize: 12.5, fontWeight: FontWeight.w600))),
                    ] else if (i.hasAppliedCode) ...[
                      const SizedBox(height: 18),
                      Row(children: [Icon(Icons.check_circle, color: c.green, size: 18), const SizedBox(width: 6), Text(L10n.of(context).aReferralCodeIsAppliedTo, style: TextStyle(color: c.muted, fontSize: 12.5))]),
                    ],
                  ],
                ),
    );
  }

  Widget _step(RgColors c, String n, IconData icon, String title, String body) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 36, width: 36, alignment: Alignment.center,
            decoration: BoxDecoration(color: c.redSoft, shape: BoxShape.circle),
            child: Icon(icon, color: c.red, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: c.ink, fontWeight: FontWeight.w700, fontSize: 14)),
            const SizedBox(height: 2),
            Text(body, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.4)),
          ])),
        ]),
      );
}

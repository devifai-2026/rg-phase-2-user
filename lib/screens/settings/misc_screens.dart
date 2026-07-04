import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/app_config_service.dart';
import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../services/local_notifs.dart';
import '../../theme/cover_assets.dart';
import '../../theme/rg_colors.dart';

// ─────────────────────────── Feedback ───────────────────────────
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final u = context.read<AuthProvider>().user;
    _name.text = u?.name ?? '';
    _phone.text = (u?.phone ?? '').replaceFirst('91', '');
    _email.text = u?.email ?? '';
  }

  @override
  void dispose() { _name.dispose(); _email.dispose(); _phone.dispose(); _message.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    final api = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final t = L10n.of(context);
    try {
      await api.submitFeedback(fullName: _name.text.trim(), email: _email.text.trim(), phone: _phone.text.trim(), message: _message.text.trim());
      LocalNotifs.pingAfterDelay(t.feedbackReceived, t.thanksOurTeamWillLookInto);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).feedbackSubmitted)));
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally { if (mounted) setState(() => _saving = false); }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(L10n.of(context).feedback, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _field(_name, L10n.of(context).fullName, cap: TextCapitalization.words),
            _field(_email, L10n.of(context).email, kb: TextInputType.emailAddress),
            _field(_phone, L10n.of(context).phoneNumber, kb: TextInputType.phone, formatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)]),
            _field(_message, L10n.of(context).message, lines: 4, required: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saving ? null : _submit,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
              child: _saving ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : Text(L10n.of(context).submit),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {int lines = 1, bool required = false, TextInputType? kb, TextCapitalization cap = TextCapitalization.none, List<TextInputFormatter>? formatters}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: ctrl, maxLines: lines, keyboardType: kb, textCapitalization: cap, inputFormatters: formatters,
        decoration: InputDecoration(labelText: required ? '$label *' : label),
        validator: required ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null : null,
      ),
    );
  }
}

// ──────────────────── Astrologer Registration ────────────────────
class AstrologerRegisterScreen extends StatefulWidget {
  const AstrologerRegisterScreen({super.key});
  @override
  State<AstrologerRegisterScreen> createState() => _AstrologerRegisterScreenState();
}

class _AstrologerRegisterScreenState extends State<AstrologerRegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _bio = TextEditingController();
  bool _saving = false;

  @override
  void dispose() { _name.dispose(); _phone.dispose(); _email.dispose(); _bio.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    final api = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final t = L10n.of(context);
    try {
      await api.applyAsAstrologer(name: _name.text.trim(), phone: _phone.text.trim(), email: _email.text.trim(), bio: _bio.text.trim());
      LocalNotifs.pingAfterDelay(t.applicationReceived, t.ourTeamWillReachOutAbout);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).applicationSubmitted)));
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally { if (mounted) setState(() => _saving = false); }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(L10n.of(context).astrologerRegistration, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(L10n.of(context).joinRudragangaAsAnAstrologer(context.read<AppConfigService>().appName), style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(L10n.of(context).tellUsAboutYourselfOurTeam, style: TextStyle(color: c.muted, fontSize: 13)),
            const SizedBox(height: 18),
            _f(_name, L10n.of(context).fullName, req: true),
            _f(_phone, L10n.of(context).phoneNumber, req: true, kb: TextInputType.phone, fmt: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)], validate: (v) => v!.trim().length != 10 ? L10n.of(context).enter10Digits : null),
            _f(_email, L10n.of(context).email, kb: TextInputType.emailAddress),
            _f(_bio, L10n.of(context).aboutYouBioExpertiseExperience, lines: 4),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(52), side: BorderSide(color: c.line)),
                child: Text(L10n.of(context).cancel, style: TextStyle(color: c.ink)),
              )),
              const SizedBox(width: 12),
              Expanded(child: ElevatedButton(
                onPressed: _saving ? null : _submit,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                child: _saving ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : Text(L10n.of(context).submit),
              )),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _f(TextEditingController ctrl, String label, {int lines = 1, bool req = false, TextInputType? kb, List<TextInputFormatter>? fmt, String? Function(String?)? validate}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: ctrl, maxLines: lines, keyboardType: kb, inputFormatters: fmt,
        textCapitalization: lines > 1 ? TextCapitalization.sentences : TextCapitalization.none,
        decoration: InputDecoration(labelText: req ? '$label *' : label),
        validator: validate ?? (req ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null : null),
      ),
    );
  }
}

// ──────────────────────────── About Us ────────────────────────────
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200, pinned: true, backgroundColor: c.ground,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(L10n.of(context).aboutUs, style: const TextStyle(fontWeight: FontWeight.w800)),
              background: Stack(fit: StackFit.expand, children: [
                Image.network(CoverAssets.covers.first, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: c.redDeep)),
                const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black54]))),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(delegate: SliverChildListDelegate([
              Text(context.read<AppConfigService>().appName, style: TextStyle(color: c.ink, fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(L10n.of(context).astrologyWellness, style: TextStyle(color: c.gold, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              Text(
                L10n.of(context).rudragangaConnectsYouWithTrustedVedic(context.read<AppConfigService>().appName) +
                    L10n.of(context).marriageFinanceHealthAndLifeS +
                    L10n.of(context).getYourFreeKundliDailyHoroscope +
                    L10n.of(context).ourMissionIsToMakeAuthentic +
                    L10n.of(context).inYourOwnLanguage,
                style: TextStyle(color: c.muted, fontSize: 14, height: 1.6),
              ),
              const SizedBox(height: 20),
              _row(c, Icons.verified_outlined, L10n.of(context).verifiedExperiencedAstrologers),
              _row(c, Icons.lock_outline, L10n.of(context).privateSecureConsultations),
              _row(c, Icons.translate, L10n.of(context).availableIn6IndianLanguages),
              const SizedBox(height: 24),
              Center(child: Text(L10n.of(context).v100MadeWithDevotion, style: TextStyle(color: c.muted, fontSize: 12))),
            ])),
          ),
        ],
      ),
    );
  }

  Widget _row(RgColors c, IconData icon, String t) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(children: [Icon(icon, color: c.gold, size: 20), const SizedBox(width: 12), Expanded(child: Text(t, style: TextStyle(color: c.ink, fontSize: 14)))]),
      );
}

// ─────────────────────── Rate app dialog ───────────────────────
Future<void> showRateDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const _RateDialog(),
  );
}

class _RateDialog extends StatefulWidget {
  const _RateDialog();
  @override
  State<_RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<_RateDialog> {
  int _stars = 0;
  final _review = TextEditingController();
  bool _saving = false;

  @override
  void dispose() { _review.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (_stars == 0) return;
    setState(() => _saving = true);
    final api = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);
    final thanksMsg = L10n.of(context).thanksForYourRating;
    final ratedTitle = L10n.of(context).thanksForRatingUs;
    final ratedBody = L10n.of(context).yourFeedbackHelpsRudragangaGrow(context.read<AppConfigService>().appName);
    try {
      await api.rateApp(rating: _stars, review: _review.text.trim());
      LocalNotifs.pingAfterDelay(ratedTitle, ratedBody);
      nav.pop();
      messenger.showSnackBar(SnackBar(content: Text(thanksMsg)));
    } on ApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally { if (mounted) setState(() => _saving = false); }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return AlertDialog(
      backgroundColor: c.ground2,
      title: Text(L10n.of(context).rateRudraganga(context.read<AppConfigService>().appName), style: TextStyle(color: c.ink)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(L10n.of(context).howIsYourExperience, style: TextStyle(color: c.muted, fontSize: 13)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) => IconButton(
                  onPressed: () => setState(() => _stars = i + 1),
                  icon: Icon(i < _stars ? Icons.star_rounded : Icons.star_border_rounded, color: c.gold, size: 34),
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  constraints: const BoxConstraints(),
                )),
          ),
          const SizedBox(height: 12),
          TextField(controller: _review, maxLines: 3, maxLength: 1000, decoration: InputDecoration(hintText: L10n.of(context).writeAReviewOptional)),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(L10n.of(context).notNow, style: TextStyle(color: c.muted))),
        ElevatedButton(
          onPressed: (_saving || _stars == 0) ? null : _submit,
          child: _saving ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Text(L10n.of(context).submit),
        ),
      ],
    );
  }
}

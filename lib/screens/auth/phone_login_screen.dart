import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../api/api_client.dart';
import '../../api/app_config_service.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/language_button.dart';
import '../../widgets/rg_logo.dart';
import '../legal/legal_screen.dart';
import 'otp_verify_screen.dart';

/// Sign in / sign up with a phone number. The same screen serves both — the
/// backend creates the account on first verify, so there is no separate signup.
class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneFocus = FocusNode();
  String? _serverError;
  bool _accepted = false; // must accept Terms & Privacy before OTP

  @override
  void initState() {
    super.initState();
    // Offer the SIM / Google-account numbers via the native Phone Number Hint
    // sheet right after the screen settles. No permission prompt; Android-only
    // (no-op elsewhere). The user can pick one or dismiss to type manually.
    WidgetsBinding.instance.addPostFrameCallback((_) => _requestPhoneHint());
  }

  Future<void> _requestPhoneHint() async {
    try {
      final res = await SmartAuth.instance.requestPhoneNumberHint();
      if (!mounted) return;
      if (res.hasData) {
        final ten = _normalizeTo10(res.data!);
        if (ten != null) {
          _controller.text = ten;
          setState(() => _serverError = null);
        }
      }
    } catch (_) {/* hint is optional — ignore and let the user type */}
    // Whether picked, dismissed, or unsupported → focus the field so the user
    // can type/edit immediately.
    if (mounted) _phoneFocus.requestFocus();
  }

  /// Reduce a hinted number (e.g. "+919999911111", "919999911111",
  /// "09999911111") to the bare 10-digit Indian local number, or null.
  String? _normalizeTo10(String raw) {
    var d = raw.replaceAll(RegExp(r'\D'), ''); // keep digits only
    if (d.length > 10 && d.startsWith('91')) d = d.substring(d.length - 10);
    if (d.length == 11 && d.startsWith('0')) d = d.substring(1);
    if (d.length >= 10) d = d.substring(d.length - 10);
    return d.length == 10 ? d : null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _serverError = null);
    if (!_accepted) return; // guard: button is disabled, but double-check
    if (!_formKey.currentState!.validate()) return;
    final phone = _controller.text.trim();
    final auth = context.read<AuthProvider>();
    final t = L10n.of(context);
    try {
      await auth.requestOtp(phone);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.otpSent)));
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => OtpVerifyScreen(phone10: phone),
      ));
    } on ApiException catch (e) {
      setState(() => _serverError = e.statusCode == null ? t.errNetwork : e.message);
    } catch (_) {
      setState(() => _serverError = t.errGeneric);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final auth = context.watch<AuthProvider>();
    final appCfg = context.watch<AppConfigService>();
    final brand = appCfg.appName;

    return Scaffold(
      backgroundColor: c.ground,
      // Let the body resize when the keyboard opens so we can scroll the button
      // into view above it.
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [LanguageButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        // SafeArea keeps content clear of the status bar AND the bottom system
        // nav bar (gesture pill / 3-button) on phones that have one.
        // LayoutBuilder + ConstrainedBox(minHeight) + IntrinsicHeight lets the
        // content fill the screen when the keyboard is closed (logo floats up
        // top, button settles lower) yet become fully scrollable the moment the
        // keyboard opens — so no field/button is ever trapped behind it.
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            // Add the keyboard inset to the bottom padding so the button clears
            // the keyboard when it scrolls into view.
            padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + MediaQuery.of(context).viewInsets.bottom),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
              child: IntrinsicHeight(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Center(child: RgLogo(size: 84, brandName: brand, logoUrl: appCfg.logoUrl)),
                const SizedBox(height: 36),
                Text(t.authWelcomeTitle,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: c.ink)),
                const SizedBox(height: 8),
                Text(t.authWelcomeSubtitle, style: TextStyle(fontSize: 15, color: c.muted, height: 1.4)),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _controller,
                  focusNode: _phoneFocus,
                  keyboardType: TextInputType.phone,
                  // No autofocus: the number-hint sheet shows first, then we
                  // focus the field when it's dismissed (see _requestPhoneHint).
                  maxLength: 10,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => auth.busy ? null : _submit(),
                  style: TextStyle(color: c.ink, fontSize: 18, letterSpacing: 1.5),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                    labelText: t.phoneLabel,
                    hintText: t.phoneHint,
                    counterText: '',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: Align(
                        widthFactor: 1,
                        child: Text(t.phoneCountryCode,
                            style: TextStyle(color: c.ink, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 0),
                  ),
                  validator: (v) {
                    final digits = (v ?? '').trim();
                    if (digits.length != 10) return t.errInvalidPhone;
                    return null;
                  },
                ),
                if (_serverError != null) ...[
                  const SizedBox(height: 8),
                  Text(_serverError!, style: const TextStyle(color: Color(0xFFE0584A), fontSize: 13)),
                ],
                // Flexible gap: pushes the Terms + button toward the bottom when
                // there's spare height, and collapses to 0 when the keyboard is up.
                const Spacer(),
                // Accept Terms & Privacy — required before requesting an OTP.
                const SizedBox(height: 20),
                _AcceptTerms(
                  value: _accepted,
                  onChanged: (v) => setState(() => _accepted = v),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  // Disabled until the user accepts the Terms & Privacy Policy.
                  onPressed: (auth.busy || !_accepted) ? null : _submit,
                  child: auth.busy
                      ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                      : Text(t.sendOtpButton),
                ),
              ],
            ),
          ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Checkbox + "I agree to the Terms of Service and Privacy Policy" line, where
/// the two policy names are tappable links that open their in-app pages. The
/// whole text row also toggles the checkbox for an easy tap target.
class _AcceptTerms extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _AcceptTerms({required this.value, required this.onChanged});

  @override
  State<_AcceptTerms> createState() => _AcceptTermsState();
}

class _AcceptTermsState extends State<_AcceptTerms> {
  // Recognizers must persist for the life of the widget (not rebuilt inline).
  late final TapGestureRecognizer _termsTap;
  late final TapGestureRecognizer _privacyTap;

  @override
  void initState() {
    super.initState();
    _termsTap = TapGestureRecognizer()
      ..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TermsScreen()));
    _privacyTap = TapGestureRecognizer()
      ..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PrivacyScreen()));
  }

  @override
  void dispose() {
    _termsTap.dispose();
    _privacyTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final linkStyle = TextStyle(color: c.red, fontWeight: FontWeight.w700, fontSize: 13, decoration: TextDecoration.underline);
    final baseStyle = TextStyle(color: c.muted, fontSize: 13, height: 1.4);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: widget.value,
            onChanged: (v) => widget.onChanged(v ?? false),
            activeColor: c.red,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text.rich(
              TextSpan(
                children: [
                  // Tapping the plain words toggles the box; the links open pages.
                  TextSpan(
                    text: '${t.acceptPrefix} ',
                    recognizer: TapGestureRecognizer()..onTap = () => widget.onChanged(!widget.value),
                  ),
                  TextSpan(text: t.termsOfService, style: linkStyle, recognizer: _termsTap),
                  TextSpan(text: ' ${t.acceptAnd} '),
                  TextSpan(text: t.privacyPolicy, style: linkStyle, recognizer: _privacyTap),
                ],
              ),
              style: baseStyle,
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../services/media_permission.dart';
import '../../theme/rg_colors.dart';
import '../home/main_shell.dart';
import '../onboarding/onboarding_screen.dart';
import '../onboarding/permissions_screen.dart';
import '../../widgets/slide_route.dart';

/// Enter the 6-digit OTP (dev = 123456). On success the AuthProvider holds the
/// session and we replace the stack with Home.
class OtpVerifyScreen extends StatefulWidget {
  final String phone10;
  const OtpVerifyScreen({super.key, required this.phone10});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _serverError;

  int _resendIn = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  void _startResendCountdown() {
    _resendIn = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _resendIn--);
      if (_resendIn <= 0) t.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  /// True when every required permission is already granted (so a returning
  /// user doesn't see the permissions screen again).
  Future<bool> _allPermissionsGranted() async {
    final photos = await MediaPermission.photos(); // version-correct gallery perm
    for (final p in [Permission.notification, Permission.microphone, Permission.camera, photos, Permission.locationWhenInUse]) {
      final s = await p.status;
      if (!(s.isGranted || s.isLimited)) return false;
    }
    return true;
  }

  Future<void> _verify() async {
    setState(() => _serverError = null);
    if (!_formKey.currentState!.validate()) return;
    final auth = context.read<AuthProvider>();
    final t = L10n.of(context);
    try {
      final user = await auth.verifyOtp(widget.phone10, _controller.text.trim());
      if (!mounted) return;
      final needsOnboarding = auth.wasNewUser || !user.profileCompleted;
      // Returning user who already granted every permission → skip the perms
      // screen entirely and go straight to onboarding/Home.
      if (!auth.wasNewUser && await _allPermissionsGranted()) {
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          slideRoute(needsOnboarding ? const OnboardingScreen() : const MainShell()),
          (route) => false,
        );
        return;
      }
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        slideRoute(PermissionsScreen(goOnboardingNext: needsOnboarding)),
        (route) => false,
      );
    } on ApiException catch (e) {
      setState(() => _serverError = e.statusCode == null ? t.errNetwork : e.message);
    } catch (_) {
      setState(() => _serverError = t.errGeneric);
    }
  }

  Future<void> _resend() async {
    final auth = context.read<AuthProvider>();
    final t = L10n.of(context);
    try {
      await auth.requestOtp(widget.phone10);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.otpSent)));
      _startResendCountdown();
    } on ApiException catch (e) {
      setState(() => _serverError = e.statusCode == null ? t.errNetwork : e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final auth = context.watch<AuthProvider>();
    final prettyPhone = '${t.phoneCountryCode} ${widget.phone10}';

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        // Guards top status bar + bottom system nav; content scrolls vertically.
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(t.otpTitle,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: c.ink)),
                const SizedBox(height: 8),
                Text(t.otpSubtitle(prettyPhone),
                    style: TextStyle(fontSize: 15, color: c.muted, height: 1.4)),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: c.ink, fontSize: 26, letterSpacing: 12, fontWeight: FontWeight.w700),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)],
                  decoration: InputDecoration(labelText: t.otpLabel, counterText: ''),
                  validator: (v) => (v ?? '').trim().length != 6 ? t.errInvalidOtp : null,
                  onChanged: (v) {
                    if (v.length == 6) _verify();
                  },
                ),
                if (_serverError != null) ...[
                  const SizedBox(height: 8),
                  Text(_serverError!, style: const TextStyle(color: Color(0xFFE0584A), fontSize: 13)),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: auth.busy ? null : _verify,
                  child: auth.busy
                      ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                      : Text(t.verifyButton),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(t.changeNumber, style: TextStyle(color: c.muted)),
                    ),
                    _resendIn > 0
                        ? Text(t.resendOtpIn(_resendIn), style: TextStyle(color: c.muted, fontSize: 13))
                        : TextButton(onPressed: _resend, child: Text(t.resendOtp)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/language_button.dart';
import '../auth/phone_login_screen.dart';
import '../common/coming_soon_screen.dart';
import '../profile/my_profile_screen.dart';
import '../shop/orders_screen.dart';
import '../settings/preferences_screen.dart';
import '../settings/notif_settings_screen.dart';
import '../settings/misc_screens.dart';
import '../referral/refer_earn_screen.dart';

/// App version shown in the drawer footer. Keep in sync with pubspec.yaml.
const String _appVersion = '1.0.0';

/// Side drawer opened from the Home hamburger — profile header + menu list,
/// modelled on the reference app.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final auth = context.watch<AuthProvider>();
    final user = auth.user;
    final name = (user?.name?.trim().isNotEmpty ?? false) ? user!.name! : (user?.phone ?? L10n.of(context).guest);

    void soon(String title, [IconData icon = Icons.auto_awesome]) {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ComingSoonScreen(title: title, icon: icon)));
    }
    void push(Widget screen) {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    }

    return Drawer(
      backgroundColor: c.ground,
      child: SafeArea(
        child: Column(
          children: [
            // Profile header (tap → My Profile).
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyProfileScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: c.ground2,
                      backgroundImage: user?.avatar != null ? NetworkImage(user!.avatar!) : null,
                      child: user?.avatar == null ? Icon(Icons.person, color: c.muted, size: 30) : null,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: c.ink, fontSize: 16, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 2),
                          Text(L10n.of(context).viewProfile, style: TextStyle(color: c.red, fontSize: 12.5, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: c.muted),
                  ],
                ),
              ),
            ),
            Divider(height: 1, color: c.line),

            // Menu list.
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 6),
                children: [
                  _item(c, Icons.receipt_long_outlined, 'Your Orders', () => push(const OrdersScreen())),
                  _item(c, Icons.tune, 'Set Preferences', () => push(const PreferencesScreen())),
                  _item(c, Icons.notifications_none_rounded, 'Notification Setting', () => push(const NotifSettingsScreen())),
                  _item(c, Icons.translate, L10n.of(context).changeLanguage, () {
                    Navigator.of(context).pop();
                    showLanguageSheet(context);
                  }),
                  _item(c, Icons.feedback_outlined, 'Feedback', () => push(const FeedbackScreen())),
                  _item(c, Icons.star_outline, 'Rate Astro App', () {
                    Navigator.of(context).pop();
                    showRateDialog(context);
                  }),
                  _item(c, Icons.groups_outlined, 'About Us', () => push(const AboutUsScreen())),
                  _item(c, Icons.app_registration, 'Astrologer Registration', () => push(const AstrologerRegisterScreen())),
                  _item(c, Icons.grid_view_rounded, L10n.of(context).chooseYourKundli, () => soon(L10n.of(context).chooseYourKundli, Icons.grid_view_rounded)),
                  _item(c, Icons.card_giftcard_outlined, 'Refer & Earn', () => push(const ReferEarnScreen())),
                  _item(c, Icons.person_outline, 'My Profile', () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyProfileScreen()));
                  }),
                ],
              ),
            ),
            Divider(height: 1, color: c.line),
            _item(c, Icons.logout, L10n.of(context).logout, () => _confirmLogout(context, c), danger: true),
            const SizedBox(height: 6),
            _madeByFooter(c),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// App version + "Made by DevifAI ❤️" at the extreme bottom. DevifAI opens
  /// the company site in the browser.
  Widget _madeByFooter(RgColors c) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text('v$_appVersion', style: TextStyle(color: c.muted, fontSize: 11)),
          const SizedBox(height: 2),
          GestureDetector(
            onTap: () async {
              final uri = Uri.parse('https://www.devifai.in');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: c.muted, fontSize: 11.5),
                children: [
                  const TextSpan(text: 'Made by '),
                  TextSpan(text: 'DevifAI', style: TextStyle(color: c.red, fontWeight: FontWeight.w700)),
                  const TextSpan(text: ' with ❤️'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(RgColors c, IconData icon, String label, VoidCallback onTap, {bool danger = false}) {
    final color = danger ? c.red : c.ink;
    return ListTile(
      dense: true,
      leading: Icon(icon, color: danger ? c.red : c.muted, size: 22),
      title: Text(label, style: TextStyle(color: color, fontSize: 14.5, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  /// Friendly "stay with us" confirmation before logging out.
  Future<void> _confirmLogout(BuildContext context, RgColors c) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: c.ground2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(children: [
          Icon(Icons.favorite, color: c.red, size: 22),
          const SizedBox(width: 10),
          Expanded(child: Text(L10n.of(context).leavingSoSoon, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 18))),
        ]),
        content: Text(
          L10n.of(context).yourWalletReadingsAndSavedDetails,
          style: TextStyle(color: c.muted, fontSize: 14, height: 1.5),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        actions: [
          // Primary action keeps the user in (retention-first).
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(ctx, false),
              style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(48)),
              child: Text(L10n.of(context).stayLoggedIn, style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(L10n.of(context).logOutAnyway, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600))),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await context.read<AuthProvider>().logout();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
      (r) => false,
    );
  }
}

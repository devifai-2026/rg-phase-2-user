import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../services/local_notifs.dart';
import '../../theme/rg_colors.dart';

/// Notification Settings — frequency + topic subscriptions. Saves to DB.
class NotifSettingsScreen extends StatefulWidget {
  const NotifSettingsScreen({super.key});
  @override
  State<NotifSettingsScreen> createState() => _NotifSettingsScreenState();
}

class _NotifSettingsScreenState extends State<NotifSettingsScreen> {
  String _freq = 'once_a_day';
  final Set<String> _topics = {'follow'};
  bool _saving = false;

  static const _freqOpts = {
    'once_a_day': 'Once in a day',
    'twice_a_day': 'Twice in a day',
    'all': 'As many times as it comes',
    'never': 'Never',
  };
  static const _topicOpts = {
    'cricket': 'Cricket', 'share_market': 'Share Market', 'bollywood': 'Bollywood',
    'magazine': 'New Magazine', 'follow': 'Follow', 'festivals': 'Festivals', 'horoscope': 'Daily Horoscope',
  };

  Future<void> _save() async {
    setState(() => _saving = true);
    final profileApi = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final t = L10n.of(context);
    try {
      await profileApi.saveNotificationSettings(frequency: _freq, topics: _topics.toList());
      LocalNotifs.pingAfterDelay(t.notificationsUpdated, t.youLlHearFromUsBased);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(L10n.of(context).saved)));
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  // Localized labels keyed off the option key (the const maps drive order).
  String _freqLabel(String key) => switch (key) {
        'once_a_day' => L10n.of(context).onceInADay,
        'twice_a_day' => L10n.of(context).twiceInADay,
        'all' => L10n.of(context).asManyTimesAsItComes,
        'never' => L10n.of(context).never,
        _ => key,
      };

  String _topicLabel(String key) => switch (key) {
        'cricket' => L10n.of(context).cricket,
        'share_market' => L10n.of(context).shareMarket,
        'bollywood' => L10n.of(context).bollywood,
        'magazine' => L10n.of(context).newMagazine,
        'follow' => L10n.of(context).follow,
        'festivals' => L10n.of(context).festivals,
        'horoscope' => L10n.of(context).dailyHoroscope,
        _ => key,
      };

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(L10n.of(context).notificationSetting, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(L10n.of(context).howOften, style: TextStyle(color: c.muted, fontWeight: FontWeight.w700, fontSize: 13)),
          const SizedBox(height: 4),
          ..._freqOpts.entries.map((e) => RadioListTile<String>(
                value: e.key, groupValue: _freq, onChanged: (v) => setState(() => _freq = v!),
                title: Text(_freqLabel(e.key), style: TextStyle(color: c.ink, fontSize: 14.5)),
                activeColor: c.red, contentPadding: EdgeInsets.zero, dense: true,
              )),
          const SizedBox(height: 16),
          Text(L10n.of(context).topicsYouCareAbout, style: TextStyle(color: c.muted, fontWeight: FontWeight.w700, fontSize: 13)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _topicOpts.entries.map((e) {
              final on = _topics.contains(e.key);
              return GestureDetector(
                onTap: () => setState(() => on ? _topics.remove(e.key) : _topics.add(e.key)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                  decoration: BoxDecoration(
                    color: on ? c.redSoft : c.ground2,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: on ? c.red : c.line),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    if (on) ...[Icon(Icons.check, size: 14, color: c.red), const SizedBox(width: 5)],
                    Text(_topicLabel(e.key), style: TextStyle(color: on ? c.red : c.muted, fontWeight: FontWeight.w600, fontSize: 13)),
                  ]),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 28),
          Row(children: [
            Expanded(child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50), side: BorderSide(color: c.line)),
              child: Text(L10n.of(context).cancel, style: TextStyle(color: c.ink)),
            )),
            const SizedBox(width: 12),
            Expanded(child: ElevatedButton(
              onPressed: _saving ? null : _save,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _saving ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : Text(L10n.of(context).ok),
            )),
          ]),
        ],
      ),
    );
  }
}

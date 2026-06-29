import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_provider.dart';
import '../../services/local_notifs.dart';
import '../../theme/rg_colors.dart';

/// Set Preferences — chart style, month system, theme, language, ayanamsa.
/// Saves to DB; theme + language also apply to the app immediately.
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _chartStyle = 'north';
  String _monthSystem = 'amanta';
  String _themeMode = 'system';
  String _language = 'en';
  String _ayanamsa = 'lahiri';

  late final Map<String, dynamic> _initial;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final s = context.read<SettingsProvider>();
    _themeMode = s.themeMode.name;
    _language = s.locale?.languageCode ?? 'en';
    _initial = _snapshot();
  }

  Map<String, dynamic> _snapshot() => {
        'chartStyle': _chartStyle, 'monthSystem': _monthSystem,
        'themeMode': _themeMode, 'language': _language, 'ayanamsa': _ayanamsa,
      };
  bool get _dirty => _snapshot().toString() != _initial.toString();

  void _reset() => setState(() {
        _chartStyle = _initial['chartStyle']; _monthSystem = _initial['monthSystem'];
        _themeMode = _initial['themeMode']; _language = _initial['language']; _ayanamsa = _initial['ayanamsa'];
      });

  Future<void> _save() async {
    setState(() => _saving = true);
    final settings = context.read<SettingsProvider>();
    final profileApi = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final allSet = L10n.of(context).allSet;
    final chartsMsg = L10n.of(context).yourChartsWillNowFollowYour;
    try {
      await profileApi.savePreferences(_snapshot());
      // Apply theme + language to the running app.
      settings.setThemeMode(switch (_themeMode) { 'light' => ThemeMode.light, 'dark' => ThemeMode.dark, _ => ThemeMode.system });
      settings.setLocale(Locale(_language));
      LocalNotifs.pingAfterDelay(allSet, chartsMsg);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(allSet)));
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(title: Text(L10n.of(context).setPreferences, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _radioGroup(c, L10n.of(context).chartStyle, _chartStyle, {'north': L10n.of(context).northIndian, 'south': L10n.of(context).southIndian}, (v) => setState(() => _chartStyle = v)),
          _radioGroup(c, L10n.of(context).monthSystem, _monthSystem, {'amanta': L10n.of(context).amanta, 'purnimanta': L10n.of(context).purnimanta}, (v) => setState(() => _monthSystem = v)),
          _radioGroup(c, L10n.of(context).darkMode, _themeMode, {'off': L10n.of(context).off, 'on': L10n.of(context).onLabel, 'system': L10n.of(context).useDeviceSettings}.map((k, val) => MapEntry(k == 'off' ? 'light' : k == 'on' ? 'dark' : 'system', val)), (v) => setState(() => _themeMode = v)),
          _dropdown(c, 'Language', _language, SettingsProvider.languageNames, (v) => setState(() => _language = v)),
          _dropdown(c, L10n.of(context).ayanamsa, _ayanamsa, {
            'lahiri': L10n.of(context).nCLahiri, 'kp_new': L10n.of(context).kpNew, 'kp_old': L10n.of(context).kpOld, 'raman': L10n.of(context).raman, 'kp_khullar': L10n.of(context).kpKhullar,
          }, (v) => setState(() => _ayanamsa = v)),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(child: OutlinedButton(
              onPressed: _dirty ? _reset : null,
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50), side: BorderSide(color: c.line)),
              child: Text(L10n.of(context).reset, style: TextStyle(color: _dirty ? c.ink : c.muted)),
            )),
            const SizedBox(width: 12),
            Expanded(child: ElevatedButton(
              onPressed: (_saving || !_dirty) ? null : _save,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _saving ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : Text(L10n.of(context).save),
            )),
          ]),
        ],
      ),
    );
  }

  Widget _radioGroup(RgColors c, String label, String value, Map<String, String> opts, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(color: c.muted, fontWeight: FontWeight.w700, fontSize: 13)),
        const SizedBox(height: 4),
        ...opts.entries.map((e) => RadioListTile<String>(
              value: e.key, groupValue: value, onChanged: (v) => onChanged(v!),
              title: Text(e.value, style: TextStyle(color: c.ink, fontSize: 14.5)),
              activeColor: c.red, contentPadding: EdgeInsets.zero, dense: true,
            )),
      ]),
    );
  }

  Widget _dropdown(RgColors c, String label, String value, Map<String, String> opts, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(color: c.muted, fontWeight: FontWeight.w700, fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: opts.containsKey(value) ? value : opts.keys.first,
              isExpanded: true, dropdownColor: c.ground2, icon: Icon(Icons.expand_more, color: c.muted),
              style: TextStyle(color: c.ink, fontSize: 15),
              items: opts.entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
              onChanged: (v) { if (v != null) onChanged(v); },
            ),
          ),
        ),
      ]),
    );
  }
}

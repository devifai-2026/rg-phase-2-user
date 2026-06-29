import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';
import '../../theme/rg_colors.dart';
import '../home/main_shell.dart';

/// Post-OTP profile setup. Everything is optional; the user can skip. Compact,
/// single-scroll, premium layout. Place-of-birth uses a free debounced
/// autocomplete; DOB/TOB use native pickers (iOS + Android). Saved via
/// PUT /auth/me, photo via /users/upload.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _name = TextEditingController();
  final _pob = TextEditingController();

  String? _avatarUrl;
  File? _localPhoto;
  bool _uploadingPhoto = false;

  String? _gender; // male|female|other
  DateTime? _dob;
  TimeOfDay? _tob;
  bool _timeKnown = true;

  double? _lat, _lng;
  List<PlaceSuggestion> _placeResults = [];
  Timer? _placeDebounce;
  bool _searchingPlace = false;

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    // Prefill from any existing values.
    final u = context.read<AuthProvider>().user;
    if (u != null) {
      _name.text = u.name ?? '';
      _avatarUrl = u.avatar;
      _gender = u.gender;
      _dob = u.birthDetails.dob;
      _timeKnown = u.birthDetails.timeKnown;
      _pob.text = u.birthDetails.place ?? '';
      _lat = u.birthDetails.lat;
      _lng = u.birthDetails.lng;
      if (u.birthDetails.time != null && u.birthDetails.time!.contains(':')) {
        final parts = u.birthDetails.time!.split(':');
        _tob = TimeOfDay(hour: int.tryParse(parts[0]) ?? 0, minute: int.tryParse(parts[1]) ?? 0);
      }
    }
  }

  @override
  void dispose() {
    _placeDebounce?.cancel();
    _name.dispose();
    _pob.dispose();
    super.dispose();
  }

  // ── Photo ──
  Future<void> _pickPhoto() async {
    // Capture context-derived refs up front so we don't touch context after awaits.
    final profileApi = context.read<ProfileApi>();
    final messenger = ScaffoldMessenger.of(context);
    final errMsg = L10n.of(context).errGeneric;

    final picker = ImagePicker();
    final x = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1024, imageQuality: 85);
    if (x == null) return;
    setState(() {
      _localPhoto = File(x.path);
      _uploadingPhoto = true;
    });
    try {
      final url = await profileApi.uploadImage(File(x.path));
      if (mounted) setState(() => _avatarUrl = url);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(errMsg)));
    } finally {
      if (mounted) setState(() => _uploadingPhoto = false);
    }
  }

  // ── Place autocomplete (debounced) ──
  void _onPobChanged(String q) {
    _placeDebounce?.cancel();
    // City lat/lng is cleared once the text diverges from a picked result.
    _lat = null;
    _lng = null;
    if (q.trim().length < 2) {
      setState(() => _placeResults = []);
      return;
    }
    _placeDebounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() => _searchingPlace = true);
      try {
        final res = await context.read<ProfileApi>().searchPlaces(q);
        if (mounted) setState(() => _placeResults = res);
      } catch (_) {
        if (mounted) setState(() => _placeResults = []);
      } finally {
        if (mounted) setState(() => _searchingPlace = false);
      }
    });
  }

  void _selectPlace(PlaceSuggestion p) {
    setState(() {
      _pob.text = p.name;
      _lat = p.lat;
      _lng = p.lng;
      _placeResults = [];
    });
    FocusScope.of(context).unfocus();
  }

  // ── Pickers ──
  Future<void> _pickDob() async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 25, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: L10n.of(context).onbDob,
    );
    if (picked != null) setState(() => _dob = picked);
  }

  Future<void> _pickTob() async {
    FocusScope.of(context).unfocus();
    final picked = await showTimePicker(
      context: context,
      initialTime: _tob ?? const TimeOfDay(hour: 9, minute: 0),
      helpText: L10n.of(context).onbTob,
    );
    if (picked != null) setState(() => _tob = picked);
  }

  // ── Save / skip ──
  Map<String, dynamic> _buildBody({required bool completed}) {
    final lang = context.read<SettingsProvider>().locale?.languageCode;
    final birth = <String, dynamic>{'timeKnown': _timeKnown};
    if (_dob != null) birth['dob'] = _dob!.toIso8601String();
    if (_timeKnown && _tob != null) {
      birth['time'] = '${_tob!.hour.toString().padLeft(2, '0')}:${_tob!.minute.toString().padLeft(2, '0')}';
    } else {
      birth['time'] = null;
    }
    if (_pob.text.trim().isNotEmpty) birth['place'] = _pob.text.trim();
    if (_lat != null) birth['lat'] = _lat;
    if (_lng != null) birth['lng'] = _lng;

    return {
      if (_name.text.trim().isNotEmpty) 'name': _name.text.trim(),
      if (_gender != null) 'gender': _gender,
      if (_avatarUrl != null) 'avatar': _avatarUrl,
      if (lang != null) 'language': lang,
      'birthDetails': birth,
      'profileCompleted': completed,
    };
  }

  Future<void> _save({required bool completed}) async {
    setState(() => _saving = true);
    final t = L10n.of(context);
    try {
      await context.read<AuthProvider>().updateProfile(_buildBody(completed: completed));
      if (!mounted) return;
      if (completed) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.onbSaved)));
      }
      _goHome();
    } on ApiException catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _goHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);

    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: _saving ? null : () => _save(completed: false),
            child: Text(t.onbSkip, style: TextStyle(color: c.muted, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 24 + MediaQuery.of(context).viewInsets.bottom),
          child: _Entrance(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.onbTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: c.ink)),
                const SizedBox(height: 8),
                Text(t.onbSubtitle, style: TextStyle(fontSize: 14, color: c.muted, height: 1.45)),
                const SizedBox(height: 24),

                // Photo + name row (compact).
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _PhotoPicker(
                      avatarUrl: _avatarUrl,
                      localPhoto: _localPhoto,
                      uploading: _uploadingPhoto,
                      onTap: _pickPhoto,
                      fallback: (_name.text.isNotEmpty ? _name.text[0] : 'र'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _name,
                        textCapitalization: TextCapitalization.words,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(labelText: t.onbName),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                _Label(t.onbGender),
                const SizedBox(height: 8),
                _GenderSelector(value: _gender, onChanged: (g) => setState(() => _gender = g)),
                const SizedBox(height: 22),

                // DOB + TOB row.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _PickerField(
                        label: t.onbDob,
                        icon: Icons.calendar_today_outlined,
                        value: _dob == null ? null : _fmtDate(_dob!),
                        placeholder: t.onbSelectDate,
                        onTap: _pickDob,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _PickerField(
                        label: t.onbTob,
                        icon: Icons.access_time,
                        enabled: _timeKnown,
                        value: (!_timeKnown || _tob == null) ? null : _tob!.format(context),
                        placeholder: t.onbSelectTime,
                        onTap: _pickTob,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // "Don't know time of birth" toggle.
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => setState(() => _timeKnown = !_timeKnown),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 22, width: 22,
                          child: Checkbox(
                            value: !_timeKnown,
                            onChanged: (v) => setState(() => _timeKnown = !(v ?? false)),
                            activeColor: c.red,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(t.onbDontKnowTime, style: TextStyle(color: c.muted, fontSize: 13.5)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Place of birth (autocomplete).
                _Label(t.onbPob),
                const SizedBox(height: 8),
                TextField(
                  controller: _pob,
                  onChanged: _onPobChanged,
                  decoration: InputDecoration(
                    hintText: t.onbPobHint,
                    prefixIcon: Icon(Icons.place_outlined, color: c.muted, size: 20),
                    suffixIcon: _searchingPlace
                        ? Padding(
                            padding: const EdgeInsets.all(14),
                            child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2, color: c.red)),
                          )
                        : null,
                  ),
                ),
                if (_placeResults.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: c.ground2,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: c.line),
                    ),
                    child: Column(
                      children: _placeResults.take(5).map((p) {
                        return ListTile(
                          dense: true,
                          leading: Icon(Icons.location_on_outlined, size: 18, color: c.gold),
                          title: Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13, color: c.ink)),
                          onTap: () => _selectPlace(p),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 22),

                // Language dropdown.
                _Label(t.onbLanguage),
                const SizedBox(height: 8),
                _LanguageDropdown(),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saving ? null : () => _save(completed: true),
                    child: _saving
                        ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                        : Text(t.onbFinish),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _fmtDate(DateTime d) => '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}

// ── Small private widgets ──

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(color: context.rg.muted, fontWeight: FontWeight.w600, fontSize: 13));
}

class _PhotoPicker extends StatelessWidget {
  final String? avatarUrl;
  final File? localPhoto;
  final bool uploading;
  final VoidCallback onTap;
  final String fallback;
  const _PhotoPicker({required this.avatarUrl, required this.localPhoto, required this.uploading, required this.onTap, required this.fallback});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    ImageProvider? img;
    if (localPhoto != null) {
      img = FileImage(localPhoto!);
    } else if (avatarUrl != null) {
      img = NetworkImage(avatarUrl!);
    }
    return GestureDetector(
      onTap: uploading ? null : onTap,
      child: Stack(
        children: [
          Container(
            height: 72, width: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: c.ground2,
              border: Border.all(color: c.line),
              image: img != null ? DecorationImage(image: img, fit: BoxFit.cover) : null,
            ),
            child: img == null
                ? Center(child: Text(fallback, style: TextStyle(fontSize: 28, color: c.muted, fontWeight: FontWeight.w700)))
                : null,
          ),
          Positioned(
            right: 0, bottom: 0,
            child: Container(
              height: 24, width: 24,
              decoration: BoxDecoration(color: c.red, shape: BoxShape.circle, border: Border.all(color: c.ground, width: 2)),
              child: uploading
                  ? const Padding(padding: EdgeInsets.all(5), child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.camera_alt, size: 13, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;
  const _GenderSelector({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    final opts = [('male', t.genderMale), ('female', t.genderFemale), ('other', t.genderOther)];
    return Row(
      children: opts.map((o) {
        final selected = value == o.$1;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => onChanged(o.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? c.redSoft : c.ground2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: selected ? c.red : c.line, width: selected ? 1.4 : 1),
                ),
                child: Text(o.$2,
                    style: TextStyle(
                        color: selected ? c.red : c.ink,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        fontSize: 14)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PickerField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? value;
  final String placeholder;
  final VoidCallback onTap;
  final bool enabled;
  const _PickerField({
    required this.label,
    required this.icon,
    required this.value,
    required this.placeholder,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        const SizedBox(height: 8),
        Opacity(
          opacity: enabled ? 1 : 0.4,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: enabled ? onTap : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              decoration: BoxDecoration(
                color: c.ground2,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: c.line),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 18, color: c.muted),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      value ?? placeholder,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: value == null ? c.muted : c.ink, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final settings = context.watch<SettingsProvider>();
    final current = settings.locale?.languageCode ?? 'en';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: c.ground2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.line),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: current,
          isExpanded: true,
          dropdownColor: c.ground2,
          icon: Icon(Icons.expand_more, color: c.muted),
          style: TextStyle(color: c.ink, fontSize: 15),
          items: SettingsProvider.supportedLocales.map((loc) {
            return DropdownMenuItem(
              value: loc.languageCode,
              child: Text(SettingsProvider.languageNames[loc.languageCode] ?? loc.languageCode),
            );
          }).toList(),
          onChanged: (code) {
            if (code != null) context.read<SettingsProvider>().setLocale(Locale(code));
          },
        ),
      ),
    );
  }
}

/// Subtle fade + rise entrance for the whole form.
class _Entrance extends StatefulWidget {
  final Widget child;
  const _Entrance({required this.child});
  @override
  State<_Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<_Entrance> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..forward();
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: Tween(begin: const Offset(0, 0.04), end: Offset.zero).animate(fade),
        child: widget.child,
      ),
    );
  }
}

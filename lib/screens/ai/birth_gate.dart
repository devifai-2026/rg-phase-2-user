import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/profile_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';

/// What a reading needs to run.
class BirthGateResult {
  final String dob;        // DD/MM/YYYY
  final String? tob;       // HH:mm, null when the seeker does not know it
  final double? lat;
  final double? lng;
  final String place;
  const BirthGateResult({required this.dob, this.tob, this.lat, this.lng, this.place = ''});
  bool get timeKnown => tob != null && tob!.isNotEmpty;
}

/// Collects the birth details a reading needs, asking as little as possible.
///
/// Three rules, all from how seekers actually behave:
///  - DOB is MANDATORY. Without it there is no chart and nothing honest to say.
///  - TOB is OPTIONAL by default (a lot of people genuinely do not know it), but
///    [requireTob] makes it mandatory for readings that depend on house cusps,
///    such as Brihat Kundli.
///  - Saved details are CONFIRMED, not silently reused and not re-asked. A seeker
///    who has already given their birth data sees it once with an Edit affordance,
///    which is faster than a form and safer than assuming.
///
/// Returns null if the seeker backs out.
Future<BirthGateResult?> showBirthGate(
  BuildContext context, {
  required String title,
  bool requireTob = false,
}) {
  return showModalBottomSheet<BirthGateResult>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _BirthGateSheet(title: title, requireTob: requireTob),
  );
}

class _BirthGateSheet extends StatefulWidget {
  final String title;
  final bool requireTob;
  const _BirthGateSheet({required this.title, required this.requireTob});

  @override
  State<_BirthGateSheet> createState() => _BirthGateSheetState();
}

class _BirthGateSheetState extends State<_BirthGateSheet> {
  DateTime? _dob;
  TimeOfDay? _tob;
  final _placeCtrl = TextEditingController();
  double? _lat;
  double? _lng;

  /// True while showing the saved details for confirmation; false once the
  /// seeker taps Edit, or when there was nothing saved to begin with.
  bool _confirming = false;
  bool _saving = false;
  List<PlaceSuggestion> _places = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _placeCtrl.dispose();
    super.dispose();
  }

  void _loadSaved() {
    final u = context.read<AuthProvider>().user;
    final b = u?.birthDetails;
    if (b == null || b.dob == null) return; // nothing saved → straight to the form
    _dob = b.dob;
    if (b.timeKnown && (b.time ?? '').contains(':')) {
      final parts = b.time!.split(':');
      _tob = TimeOfDay(hour: int.tryParse(parts[0]) ?? 0, minute: int.tryParse(parts[1]) ?? 0);
    }
    _placeCtrl.text = b.place ?? '';
    _lat = b.lat;
    _lng = b.lng;
    // Only offer confirmation if what we have actually satisfies this reading.
    _confirming = !(widget.requireTob && _tob == null);
  }

  String get _dobText => _dob == null
      ? ''
      : '${_dob!.day.toString().padLeft(2, '0')}/${_dob!.month.toString().padLeft(2, '0')}/${_dob!.year}';

  String get _tobText => _tob == null
      ? ''
      : '${_tob!.hour.toString().padLeft(2, '0')}:${_tob!.minute.toString().padLeft(2, '0')}';

  bool get _canSubmit => _dob != null && (!widget.requireTob || _tob != null);

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 25),
      firstDate: DateTime(1920),
      lastDate: now,
    );
    if (d != null) setState(() => _dob = d);
  }

  Future<void> _pickTob() async {
    final t = await showTimePicker(
      context: context,
      initialTime: _tob ?? const TimeOfDay(hour: 6, minute: 30),
    );
    if (t != null) setState(() => _tob = t);
  }

  void _onPlaceQuery(String q) {
    _debounce?.cancel();
    if (q.trim().length < 2) { setState(() => _places = []); return; }
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      try {
        final r = await context.read<ProfileApi>().searchPlaces(q.trim());
        if (mounted) setState(() => _places = r);
      } catch (_) {
        if (mounted) setState(() => _places = []);
      }
    });
  }

  /// Persist to the profile so the seeker is asked at most once, then return.
  Future<void> _submit() async {
    if (!_canSubmit || _saving) return;
    setState(() => _saving = true);
    final auth = context.read<AuthProvider>();
    final result = BirthGateResult(
      dob: _dobText,
      tob: _tob == null ? null : _tobText,
      lat: _lat,
      lng: _lng,
      place: _placeCtrl.text.trim(),
    );
    try {
      await auth.updateProfile({
        'birthDetails': {
          'dob': _dob!.toIso8601String(),
          'timeKnown': _tob != null,
          if (_tob != null) 'time': _tobText,
          if (_placeCtrl.text.trim().isNotEmpty) 'place': _placeCtrl.text.trim(),
          if (_lat != null) 'lat': _lat,
          if (_lng != null) 'lng': _lng,
        },
      });
    } catch (_) {
      // Saving is a convenience, not a precondition: the reading can still run
      // from the values we are about to return.
    }
    if (mounted) Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.88),
        decoration: BoxDecoration(
          color: c.ground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(2)))),
          const SizedBox(height: 16),
          Flexible(child: SingleChildScrollView(child: _confirming ? _confirmView(c, t) : _formView(c, t))),
        ]),
      ),
    );
  }

  /// The fast path: we already know their details, so just confirm.
  Widget _confirmView(RgColors c, L10n t) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t.confirmBirthDetails, style: TextStyle(color: c.ink, fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      Text(t.confirmBirthDetailsBody, style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.4)),
      const SizedBox(height: 18),
      _row(c, Icons.cake_outlined, t.dateOfBirth, _dobText),
      _row(c, Icons.schedule, t.timeOfBirth, _tobText.isEmpty ? t.notKnown : _tobText),
      if (_placeCtrl.text.trim().isNotEmpty)
        _row(c, Icons.place_outlined, t.placeOfBirth, _placeCtrl.text.trim()),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => setState(() => _confirming = false),
            child: Text(t.edit),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: _saving ? null : _submit,
            child: _saving
                ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : Text(t.continueLabel),
          ),
        ),
      ]),
    ]);
  }

  Widget _row(RgColors c, IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(children: [
          Icon(icon, size: 17, color: c.gold),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(color: c.muted, fontSize: 12.5)),
          const Spacer(),
          Text(value, style: TextStyle(color: c.ink, fontSize: 13.5, fontWeight: FontWeight.w700)),
        ]),
      );

  Widget _formView(RgColors c, L10n t) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.title, style: TextStyle(color: c.ink, fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      Text(
        widget.requireTob ? t.birthDetailsNeedTimeBody : t.birthDetailsNeededBody,
        style: TextStyle(color: c.muted, fontSize: 12.5, height: 1.4),
      ),
      const SizedBox(height: 18),

      // DOB — always required.
      _field(c, Icons.cake_outlined, '${t.dateOfBirth} *', _dobText.isEmpty ? t.selectDate : _dobText, _pickDob,
          filled: _dob != null),
      const SizedBox(height: 10),

      // TOB — optional unless this reading depends on house cusps.
      _field(
        c,
        Icons.schedule,
        widget.requireTob ? '${t.timeOfBirth} *' : '${t.timeOfBirth} (${t.optional})',
        _tobText.isEmpty ? t.selectTime : _tobText,
        _pickTob,
        filled: _tob != null,
      ),
      if (!widget.requireTob && _tob == null) ...[
        const SizedBox(height: 6),
        Text(t.tobSharpensReading, style: TextStyle(color: c.muted, fontSize: 11, height: 1.3)),
      ],
      const SizedBox(height: 10),

      TextField(
        controller: _placeCtrl,
        onChanged: _onPlaceQuery,
        style: TextStyle(color: c.ink),
        decoration: InputDecoration(
          labelText: '${t.placeOfBirth} (${t.optional})',
          labelStyle: TextStyle(color: c.muted),
          prefixIcon: Icon(Icons.place_outlined, size: 18, color: c.gold),
          filled: true,
          fillColor: c.ground2,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
        ),
      ),
      for (final p in _places.take(5))
        ListTile(
          dense: true,
          leading: Icon(Icons.location_on_outlined, size: 17, color: c.muted),
          title: Text(p.name, style: TextStyle(color: c.ink, fontSize: 13)),
          onTap: () {
            setState(() {
              _placeCtrl.text = p.name;
              _lat = p.lat;
              _lng = p.lng;
              _places = [];
            });
            FocusScope.of(context).unfocus();
          },
        ),

      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          // Disabled until the mandatory fields are in, so the button never
          // silently does nothing.
          onPressed: (_canSubmit && !_saving) ? _submit : null,
          child: _saving
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : Text(t.getMyReading),
        ),
      ),
    ]);
  }

  Widget _field(RgColors c, IconData icon, String label, String value, VoidCallback onTap, {bool filled = false}) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: c.ground2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: filled ? c.gold.withValues(alpha: 0.5) : c.line),
          ),
          child: Row(children: [
            Icon(icon, size: 18, color: c.gold),
            const SizedBox(width: 10),
            Text(label, style: TextStyle(color: c.muted, fontSize: 12.5)),
            const Spacer(),
            Text(value, style: TextStyle(color: filled ? c.ink : c.muted, fontSize: 13.5, fontWeight: FontWeight.w700)),
          ]),
        ),
      );
}

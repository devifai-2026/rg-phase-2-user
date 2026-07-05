import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/profile_api.dart';
import '../l10n/app_localizations.dart';
import '../theme/rg_colors.dart';

/// Collected birth details from [BirthDetailsForm]. dob is DD/MM/YYYY, tob HH:mm
/// (24h) — the exact formats VedicAstro wants; lat/lon come from place search.
class BirthDetails {
  final String? name;
  final String dob; // DD/MM/YYYY
  final String tob; // HH:mm
  final double? lat;
  final double? lon;
  final String place;
  const BirthDetails({this.name, required this.dob, required this.tob, this.lat, this.lon, this.place = ''});
  bool get isComplete => dob.isNotEmpty && tob.isNotEmpty;
}

/// Reusable birth-details capture: optional name, date-of-birth, time-of-birth,
/// and birthplace (searched via /geo/places → lat/lon). Shared by Matching,
/// Manglik, and Birth-chart so the form is built once and behaves identically.
class BirthDetailsForm extends StatefulWidget {
  final String title;
  final bool showName;
  final String? initialName;
  final ValueChanged<BirthDetails> onChanged;
  const BirthDetailsForm({super.key, required this.title, this.showName = false, this.initialName, required this.onChanged});

  @override
  State<BirthDetailsForm> createState() => _BirthDetailsFormState();
}

class _BirthDetailsFormState extends State<BirthDetailsForm> {
  late final TextEditingController _name;
  final _placeCtrl = TextEditingController();
  DateTime? _dob;
  TimeOfDay? _tob;
  double? _lat;
  double? _lon;
  List<PlaceSuggestion> _places = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initialName ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    _placeCtrl.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  String get _dobStr => _dob == null ? '' : '${_two(_dob!.day)}/${_two(_dob!.month)}/${_dob!.year}';
  String get _tobStr => _tob == null ? '' : '${_two(_tob!.hour)}:${_two(_tob!.minute)}';
  static String _two(int n) => n.toString().padLeft(2, '0');

  void _emit() => widget.onChanged(BirthDetails(
        name: widget.showName ? _name.text.trim() : null,
        dob: _dobStr, tob: _tobStr, lat: _lat, lon: _lon, place: _placeCtrl.text.trim(),
      ));

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 25),
      firstDate: DateTime(1920),
      lastDate: now,
    );
    if (picked != null) { setState(() => _dob = picked); _emit(); }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _tob ?? const TimeOfDay(hour: 6, minute: 30));
    if (picked != null) { setState(() => _tob = picked); _emit(); }
  }

  void _onPlaceQuery(String q) {
    _debounce?.cancel();
    if (q.trim().length < 2) { setState(() => _places = []); return; }
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      try {
        final res = await context.read<ProfileApi>().searchPlaces(q.trim());
        if (mounted) setState(() => _places = res);
      } catch (_) { if (mounted) setState(() => _places = []); }
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final t = L10n.of(context);
    InputDecoration dec(String label, IconData icon) => InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: c.muted, size: 20),
          isDense: true,
          filled: true, fillColor: c.ground2,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.line)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c.gold)),
        );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.line)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(color: c.gold, fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 0.4)),
          const SizedBox(height: 12),
          if (widget.showName) ...[
            TextField(controller: _name, textCapitalization: TextCapitalization.words,
                onChanged: (_) => _emit(), style: TextStyle(color: c.ink), decoration: dec(t.yourName, Icons.badge_outlined)),
            const SizedBox(height: 10),
          ],
          Row(children: [
            Expanded(child: InkWell(onTap: _pickDate, child: IgnorePointer(
              child: TextField(
                controller: TextEditingController(text: _dobStr),
                enabled: false,
                style: TextStyle(color: c.ink),
                decoration: dec(t.dateOfBirth, Icons.calendar_today_outlined),
              ),
            ))),
            const SizedBox(width: 10),
            Expanded(child: InkWell(onTap: _pickTime, child: IgnorePointer(
              child: TextField(
                controller: TextEditingController(text: _tobStr),
                enabled: false,
                style: TextStyle(color: c.ink),
                decoration: dec(t.timeOfBirth, Icons.access_time),
              ),
            ))),
          ]),
          const SizedBox(height: 10),
          TextField(
            controller: _placeCtrl,
            onChanged: _onPlaceQuery,
            style: TextStyle(color: c.ink),
            decoration: dec(t.birthPlace, Icons.place_outlined),
          ),
          if (_places.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.line)),
              child: Column(
                children: _places.take(5).map((p) => ListTile(
                      dense: true,
                      title: Text(p.name, style: TextStyle(color: c.ink, fontSize: 13)),
                      onTap: () {
                        setState(() {
                          _placeCtrl.text = p.name;
                          _lat = p.lat; _lon = p.lng;
                          _places = [];
                        });
                        FocusScope.of(context).unfocus();
                        _emit();
                      },
                    )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

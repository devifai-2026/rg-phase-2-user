import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_client.dart';
import '../../api/pooja_api.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../theme/rg_colors.dart';
import '../../widgets/slide_route.dart';
import '../wallet/wallet_screen.dart';

/// Booking form for a pooja. Name + phone are prefilled from the logged-in user.
/// If the pooja has a maxPersons capacity, the user can add up to that many
/// family-member names. On submit we create the booking, then open the PayU
/// checkout page in the browser.
class PoojaBookingScreen extends StatefulWidget {
  final Pooja pooja;
  const PoojaBookingScreen({super.key, required this.pooja});
  @override
  State<PoojaBookingScreen> createState() => _PoojaBookingScreenState();
}

class _PoojaBookingScreenState extends State<PoojaBookingScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _notes = TextEditingController();
  // One controller per family-member slot (grows up to maxPersons).
  final List<TextEditingController> _members = [];
  DateTime? _preferredDate;
  bool _submitting = false;
  // Locked when prefilled from the profile (can't be edited here).
  bool _nameLocked = false;
  bool _phoneLocked = false;

  @override
  void initState() {
    super.initState();
    final u = context.read<AuthProvider>().user;
    final name = u?.name ?? '';
    _name.text = name;
    _nameLocked = name.trim().isNotEmpty; // disable if the profile already has a name
    // Phone is stored as 91XXXXXXXXXX; show only the 10-digit local part (the
    // "91" prefix is shown as a disabled adornment). Phone always comes from DB.
    final p = u?.phone ?? '';
    _phone.text = p.startsWith('91') && p.length > 10 ? p.substring(p.length - 10) : p;
    _phoneLocked = _phone.text.trim().isNotEmpty;
  }

  // The "Add member" button is enabled only when the last opened box is filled,
  // so boxes open one at a time (fill #1 → then #2 becomes addable).
  bool get _canAddMember =>
      _members.length < _maxPersons && (_members.isEmpty || _members.last.text.trim().isNotEmpty);

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _notes.dispose();
    for (final m in _members) { m.dispose(); }
    super.dispose();
  }

  int get _maxPersons => widget.pooja.maxPersons;

  void _addMember() {
    if (_members.length >= _maxPersons) return;
    setState(() => _members.add(TextEditingController()));
  }

  void _removeMember(int i) {
    setState(() => _members.removeAt(i).dispose());
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(context: context, firstDate: now, lastDate: DateTime(now.year + 1), initialDate: _preferredDate ?? now);
    if (d != null) setState(() => _preferredDate = d);
  }

  Future<void> _submit() async {
    final t = L10n.of(context);
    if (_name.text.trim().isEmpty) { _toast(t.nameIsRequired); return; }
    if (_phone.text.trim().length < 10) { _toast(t.enterAValidPhone); return; }
    final members = _members.map((m) => m.text.trim()).where((s) => s.isNotEmpty).toList();

    setState(() => _submitting = true);
    try {
      // Wallet-only: the booking is paid by deducting from the wallet server-side.
      // No PayU here — a 402 means insufficient balance (prompt to recharge).
      await context.read<PoojaApi>().book(
        poojaTypeId: widget.pooja.id,
        contactName: _name.text.trim(),
        contactPhone: _phone.text.trim(),
        familyMembers: members,
        preferredDate: _preferredDate,
        specialInstructions: _notes.text.trim(),
      );
      if (mounted) { _toast(t.bookingConfirmed); Navigator.of(context).pop(); }
    } on ApiException catch (e) {
      if (e.statusCode == 402) {
        if (mounted) _showInsufficientBalance();
      } else {
        _toast(e.message.contains('allows up to') ? e.message : (e.message.isNotEmpty ? e.message : t.bookingFailed));
      }
    } catch (_) {
      _toast(t.bookingFailedPleaseTryAgain);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  /// Insufficient wallet balance → explain + offer to go recharge.
  void _showInsufficientBalance() {
    final c = context.rg;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: c.ground2,
        title: Text(L10n.of(context).addMoneyToContinue, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800)),
        content: Text(
          L10n.of(context).thisPoojaCostsWidgetPoojaBaseprice(widget.pooja.basePrice),
          style: TextStyle(color: c.muted, height: 1.4),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(L10n.of(context).cancel, style: TextStyle(color: c.muted))),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.of(context).push(slideRoute(const WalletScreen()));
            },
            child: Text(L10n.of(context).addMoney),
          ),
        ],
      ),
    );
  }

  void _toast(String m) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    return Scaffold(
      backgroundColor: c.ground,
      appBar: AppBar(backgroundColor: c.ground, elevation: 0, title: Text(L10n.of(context).bookWidgetPoojaName(widget.pooja.name), style: TextStyle(color: c.ink, fontWeight: FontWeight.w800), maxLines: 1, overflow: TextOverflow.ellipsis)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _label(c, L10n.of(context).yourDetails),
          TextField(
            controller: _name,
            enabled: !_nameLocked,
            decoration: InputDecoration(
              labelText: L10n.of(context).name,
              helperText: _nameLocked ? L10n.of(context).fromYourProfile : null,
              suffixIcon: _nameLocked ? Icon(Icons.lock_outline, size: 18, color: c.muted) : null,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _phone,
            enabled: !_phoneLocked,
            keyboardType: TextInputType.phone, maxLength: 10,
            decoration: InputDecoration(
              labelText: L10n.of(context).phone,
              counterText: '',
              // Hardcoded, disabled country code — the number comes from the DB.
              prefixText: '+91 ',
              prefixStyle: TextStyle(color: c.muted, fontWeight: FontWeight.w600),
              helperText: _phoneLocked ? L10n.of(context).fromYourProfile : null,
              suffixIcon: _phoneLocked ? Icon(Icons.lock_outline, size: 18, color: c.muted) : null,
            ),
          ),
          const SizedBox(height: 18),

          // Family members — only when the pooja supports more than 0 persons.
          if (_maxPersons > 0) ...[
            Row(children: [
              Expanded(child: _label(c, L10n.of(context).familyMembers)),
              Text('${_members.length}/$_maxPersons', style: TextStyle(color: c.muted, fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
            Text(L10n.of(context).addThePeopleThisPoojaIs(_maxPersons),
                style: TextStyle(color: c.muted, fontSize: 12)),
            const SizedBox(height: 10),
            ..._members.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(children: [
                    Expanded(child: TextField(
                      controller: e.value,
                      autofocus: e.key == _members.length - 1, // focus the newest box
                      // Rebuild so the "Add member" button enables once filled.
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(labelText: L10n.of(context).memberEKey1Name(e.key + 1), isDense: true),
                    )),
                    IconButton(onPressed: () => _removeMember(e.key), icon: Icon(Icons.close, color: c.muted)),
                  ]),
                )),
            if (_members.length < _maxPersons)
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  // Disabled until the last box is filled → boxes open one at a time.
                  onPressed: _canAddMember ? _addMember : null,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(_members.isEmpty ? L10n.of(context).addMember : L10n.of(context).addAnother),
                ),
              ),
            const SizedBox(height: 18),
          ],

          _label(c, L10n.of(context).preferredDateOptional),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: _pickDate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              decoration: BoxDecoration(color: c.ground2, borderRadius: BorderRadius.circular(12), border: Border.all(color: c.line)),
              child: Row(children: [
                Icon(Icons.calendar_month_outlined, color: c.muted, size: 18),
                const SizedBox(width: 10),
                Text(_preferredDate == null ? L10n.of(context).anyDate : '${_preferredDate!.day}/${_preferredDate!.month}/${_preferredDate!.year}',
                    style: TextStyle(color: _preferredDate == null ? c.muted : c.ink)),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          TextField(controller: _notes, maxLines: 2, decoration: InputDecoration(labelText: L10n.of(context).specialInstructionsOptional)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
            onPressed: _submitting ? null : _submit,
            child: _submitting
                ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                : Text(widget.pooja.isFree ? L10n.of(context).bookNowFree : L10n.of(context).payWidgetPoojaBasepriceBook(widget.pooja.basePrice), style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
      ),
    );
  }

  Widget _label(RgColors c, String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(t, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 14)),
      );
}

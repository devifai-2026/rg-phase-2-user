import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../api/api_client.dart';
import '../../../api/shop_api.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/rg_colors.dart';

/// Bottom-sheet form to add a new delivery address. Pops `true` on success so
/// the caller can refresh its address list.
class AddressFormSheet extends StatefulWidget {
  const AddressFormSheet({super.key});

  @override
  State<AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends State<AddressFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _line1 = TextEditingController();
  final _line2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _pincode = TextEditingController();

  String _label = 'home';
  bool _makeDefault = true;
  bool _saving = false;

  @override
  void dispose() {
    for (final ctrl in [_name, _phone, _line1, _line2, _city, _state, _pincode]) {
      ctrl.dispose();
    }
    super.dispose();
  }

  String? _required(String? v) => (v == null || v.trim().isEmpty) ? L10n.of(context).requiredLabel : null;

  String? _pincodeV(String? v) {
    if (v == null || v.trim().isEmpty) return L10n.of(context).requiredLabel;
    if (!RegExp(r'^\d{6}$').hasMatch(v.trim())) return L10n.of(context).s6DigitPin;
    return null;
  }

  Future<void> _save() async {
    if (_saving) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _saving = true);
    try {
      await context.read<ShopApi>().addAddress({
        'label': _label,
        if (_name.text.trim().isNotEmpty) 'name': _name.text.trim(),
        if (_phone.text.trim().isNotEmpty) 'phone': _phone.text.trim(),
        'line1': _line1.text.trim(),
        if (_line2.text.trim().isNotEmpty) 'line2': _line2.text.trim(),
        'city': _city.text.trim(),
        'state': _state.text.trim(),
        'pincode': _pincode.text.trim(),
        'isDefault': _makeDefault,
      });
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      final msg = e is ApiException ? e.message : e.toString().replaceAll('Exception: ', '');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating));
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rg;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(color: c.ground, borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
          child: Form(
            key: _formKey,
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
              children: [
                Center(child: Container(height: 4, width: 44, decoration: BoxDecoration(color: c.line, borderRadius: BorderRadius.circular(4)))),
                const SizedBox(height: 16),
                Text(L10n.of(context).addDeliveryAddress, style: TextStyle(color: c.ink, fontWeight: FontWeight.w800, fontSize: 18)),
                const SizedBox(height: 16),

                // Label chips
                Row(children: [
                  for (final opt in const ['home', 'work', 'other'])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(opt[0].toUpperCase() + opt.substring(1)),
                        selected: _label == opt,
                        onSelected: (_) => setState(() => _label = opt),
                      ),
                    ),
                ]),
                const SizedBox(height: 14),

                _field(_name, L10n.of(context).fullName),
                _field(_phone, 'Phone', keyboard: TextInputType.phone, inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)]),
                _field(_line1, L10n.of(context).addressLine1, validator: _required),
                _field(_line2, L10n.of(context).addressLine2),
                Row(children: [
                  Expanded(child: _field(_city, L10n.of(context).city, validator: _required)),
                  const SizedBox(width: 12),
                  Expanded(child: _field(_state, L10n.of(context).state, validator: _required)),
                ]),
                _field(_pincode, L10n.of(context).pinCode, keyboard: TextInputType.number, validator: _pincodeV, inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)]),

                const SizedBox(height: 4),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _makeDefault,
                  onChanged: (v) => setState(() => _makeDefault = v ?? false),
                  title: Text(L10n.of(context).setAsDefaultAddress, style: TextStyle(color: c.ink, fontSize: 14)),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _saving ? null : _save,
                  style: ElevatedButton.styleFrom(backgroundColor: c.red, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(52)),
                  child: _saving
                      ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                      : Text(L10n.of(context).saveAddress, style: const TextStyle(fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController ctrl,
    String label, {
    TextInputType? keyboard,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextFormField(
          controller: ctrl,
          keyboardType: keyboard,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(labelText: label, isDense: true),
        ),
      );
}

import 'api_client.dart';

/// A saved delivery address (User.addresses sub-doc).
class Address {
  final String id;
  final String label; // home | work | other
  final String? name;
  final String? phone;
  final String line1;
  final String? line2;
  final String city;
  final String state;
  final String pincode;
  final bool isDefault;

  const Address({
    required this.id, this.label = 'home', this.name, this.phone,
    required this.line1, this.line2, required this.city, required this.state,
    required this.pincode, this.isDefault = false,
  });

  String get oneLine => [line1, line2, city, state, pincode].where((s) => (s ?? '').toString().trim().isNotEmpty).join(', ');

  factory Address.fromJson(Map<String, dynamic> j) => Address(
        id: (j['_id'] ?? j['id']).toString(),
        label: (j['label'] ?? 'home').toString(),
        name: j['name']?.toString(),
        phone: j['phone']?.toString(),
        line1: (j['line1'] ?? '').toString(),
        line2: j['line2']?.toString(),
        city: (j['city'] ?? '').toString(),
        state: (j['state'] ?? '').toString(),
        pincode: (j['pincode'] ?? '').toString(),
        isDefault: j['isDefault'] == true,
      );
}

/// Address book + order placement (wallet checkout) + order history.
class ShopApi {
  final ApiClient _api;
  ShopApi(this._api);

  // ── Address book ──
  Future<List<Address>> addresses() async {
    final data = await _api.get('/users/addresses');
    final raw = (data is List) ? data : const [];
    return raw.map((e) => Address.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Address>> addAddress(Map<String, dynamic> body) async {
    final data = await _api.post('/users/addresses', body: body);
    // Endpoint returns the full updated address list (or the single new one).
    return _asAddressList(data);
  }

  Future<List<Address>> updateAddress(String id, Map<String, dynamic> body) async =>
      _asAddressList(await _api.put('/users/addresses/$id', body: body));

  Future<List<Address>> deleteAddress(String id) async =>
      _asAddressList(await _api.delete('/users/addresses/$id'));

  Future<List<Address>> setDefault(String id) async =>
      _asAddressList(await _api.patch('/users/addresses/$id/default'));

  List<Address> _asAddressList(dynamic data) {
    if (data is List) return data.map((e) => Address.fromJson(e as Map<String, dynamic>)).toList();
    if (data is Map && data['addresses'] is List) {
      return (data['addresses'] as List).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList();
    }
    return const [];
  }

  // ── Wallet checkout: pay the whole cart from the wallet ──
  /// Returns the created order id. Throws ApiException(402) if balance is short.
  Future<String> checkoutWallet({String? addressId, Map<String, dynamic>? address, List<Map<String, dynamic>>? items, String? couponCode}) async {
    final body = <String, dynamic>{
      if (addressId != null) 'addressId': addressId,
      if (address != null) 'address': address,
      if (items != null) 'items': items,
      if (couponCode != null && couponCode.isNotEmpty) 'couponCode': couponCode,
    };
    final data = await _api.post('/orders/checkout-wallet', body: body);
    final order = (data is Map) ? data['order'] : null;
    return (order is Map ? (order['_id'] ?? order['id']) : '').toString();
  }

  Future<List<Map<String, dynamic>>> myOrders() async {
    final data = await _api.get('/orders');
    final raw = (data is List) ? data : const [];
    return raw.cast<Map<String, dynamic>>();
  }
}

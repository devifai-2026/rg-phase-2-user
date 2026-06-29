import 'api_client.dart';

/// One ordered line (price snapshot at order time).
class OrderItem {
  final String name;
  final int price;
  final int qty;
  final String? productId;
  const OrderItem({required this.name, required this.price, required this.qty, this.productId});

  int get lineTotal => price * qty;

  factory OrderItem.fromJson(Map<String, dynamic> j) => OrderItem(
        name: (j['nameSnapshot'] ?? j['name'] ?? '').toString(),
        price: (j['priceSnapshot'] as num?)?.toInt() ?? (j['price'] as num?)?.toInt() ?? 0,
        qty: (j['qty'] as num?)?.toInt() ?? 1,
        productId: (j['product'] is Map ? j['product']['_id'] : j['product'])?.toString(),
      );
}

/// One activity-timeline entry.
class OrderEvent {
  final String label;
  final String? note;
  final DateTime? at;
  const OrderEvent({required this.label, this.note, this.at});

  factory OrderEvent.fromJson(Map<String, dynamic> j) => OrderEvent(
        label: (j['label'] ?? j['status'] ?? '').toString(),
        note: j['note']?.toString(),
        at: DateTime.tryParse((j['at'] ?? '').toString())?.toLocal(),
      );
}

class OrderAddress {
  final String? name, phone, line1, line2, city, state, pincode;
  const OrderAddress({this.name, this.phone, this.line1, this.line2, this.city, this.state, this.pincode});

  String get oneLine =>
      [line1, line2, city, state, pincode].where((s) => (s ?? '').trim().isNotEmpty).join(', ');

  factory OrderAddress.fromJson(Map<String, dynamic>? j) => OrderAddress(
        name: j?['name']?.toString(),
        phone: j?['phone']?.toString(),
        line1: j?['line1']?.toString(),
        line2: j?['line2']?.toString(),
        city: j?['city']?.toString(),
        state: j?['state']?.toString(),
        pincode: j?['pincode']?.toString(),
      );
}

class Order {
  final String id;
  final List<OrderItem> items;
  final OrderAddress address;
  final int subtotal;
  final int discount;
  final int total;
  final String? couponCode;
  final String status; // confirmed | packed | shipped | out_for_delivery | delivered | cancelled
  final String paymentStatus; // pending | paid | failed
  final DateTime? createdAt;
  final List<OrderEvent> timeline;

  const Order({
    required this.id,
    this.items = const [],
    this.address = const OrderAddress(),
    this.subtotal = 0,
    this.discount = 0,
    this.total = 0,
    this.couponCode,
    this.status = 'confirmed',
    this.paymentStatus = 'paid',
    this.createdAt,
    this.timeline = const [],
  });

  int get itemCount => items.fold(0, (s, i) => s + i.qty);

  factory Order.fromJson(Map<String, dynamic> j) => Order(
        id: (j['_id'] ?? j['id']).toString(),
        items: (j['items'] as List?)?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
        address: OrderAddress.fromJson(j['address'] as Map<String, dynamic>?),
        subtotal: (j['subtotal'] as num?)?.toInt() ?? 0,
        discount: (j['discount'] as num?)?.toInt() ?? 0,
        total: (j['total'] as num?)?.toInt() ?? 0,
        couponCode: j['couponCode']?.toString(),
        status: (j['status'] ?? 'confirmed').toString(),
        paymentStatus: (j['paymentStatus'] ?? 'paid').toString(),
        createdAt: DateTime.tryParse((j['createdAt'] ?? '').toString())?.toLocal(),
        timeline: (j['timeline'] as List?)?.map((e) => OrderEvent.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      );
}

/// Minimal invoice view for the app (number + downloadable PDF url).
class OrderInvoice {
  final String invoiceNo;
  final String? pdfUrl;
  final String pdfStatus; // pending | ready | failed
  const OrderInvoice({required this.invoiceNo, this.pdfUrl, this.pdfStatus = 'pending'});

  bool get ready => pdfStatus == 'ready' && (pdfUrl?.isNotEmpty ?? false);

  factory OrderInvoice.fromJson(Map<String, dynamic> j) => OrderInvoice(
        invoiceNo: (j['invoiceNo'] ?? '').toString(),
        pdfUrl: (j['pdfUrl'] as String?)?.trim().isEmpty ?? true ? null : j['pdfUrl'].toString(),
        pdfStatus: (j['pdfStatus'] ?? 'pending').toString(),
      );
}

class OrderApi {
  final ApiClient _api;
  OrderApi(this._api);

  /// The signed-in user's orders, newest first.
  Future<List<Order>> myOrders() async {
    final data = await _api.get('/orders');
    final raw = (data is List) ? data : const [];
    return raw.map((e) => Order.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// A single order (full detail incl. timeline).
  Future<Order> getOrder(String id) async =>
      Order.fromJson(await _api.get('/orders/$id') as Map<String, dynamic>);

  /// The order's invoice (PDF url when ready). Throws ApiException(404) if the
  /// order isn't paid yet.
  Future<OrderInvoice> invoice(String orderId) async =>
      OrderInvoice.fromJson(await _api.get('/orders/$orderId/invoice') as Map<String, dynamic>);

  /// Raise a "Need help" request for an order.
  Future<void> requestSupport(String orderId, {required String category, required String message, String? contactPhone}) async {
    await _api.post('/orders/$orderId/support', body: {
      'category': category,
      'message': message,
      if (contactPhone != null && contactPhone.isNotEmpty) 'contactPhone': contactPhone,
    });
  }
}

/// Help-request categories shown in the "Need help" modal. Keep keys in sync
/// with the backend OrderSupport enum.
const orderSupportCategories = <String, String>{
  'delivery': 'Delivery issue',
  'damaged': 'Damaged item',
  'wrong_item': 'Wrong item received',
  'missing_item': 'Missing item',
  'payment': 'Payment / refund',
  'cancel': 'Cancel my order',
  'other': 'Something else',
};

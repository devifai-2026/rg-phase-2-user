import 'api_client.dart';

/// One computed charge line for the bill.
class ChargeLine {
  final String key;
  final String label;
  final int amount;
  const ChargeLine({required this.key, required this.label, required this.amount});
}

/// Admin-configured store charges (delivery / GST / shipping / platform).
/// Everything defaults off → no extra lines until an admin enables them.
class StoreCharges {
  final Charge delivery, gst, shipping, platform;
  final int freeDeliveryAbove;

  const StoreCharges({
    required this.delivery, required this.gst, required this.shipping, required this.platform,
    this.freeDeliveryAbove = 0,
  });

  static const empty = StoreCharges(
    delivery: Charge.off, gst: Charge.off, shipping: Charge.off, platform: Charge.off,
  );

  /// Compute the enabled charge lines for an item subtotal (mirrors the server).
  List<ChargeLine> computeFor(int subtotal) {
    final lines = <ChargeLine>[];
    void add(String key, Charge ch) {
      if (!ch.enabled || ch.value <= 0) return;
      var amount = ch.type == 'percent' ? ((subtotal * ch.value) / 100).round() : ch.value.round();
      if (key == 'delivery' && freeDeliveryAbove > 0 && subtotal >= freeDeliveryAbove) amount = 0;
      if (amount <= 0) return;
      lines.add(ChargeLine(key: key, label: ch.label, amount: amount));
    }
    add('delivery', delivery);
    add('shipping', shipping);
    add('platform', platform);
    add('gst', gst);
    return lines;
  }

  factory StoreCharges.fromJson(Map<String, dynamic> j) => StoreCharges(
        delivery: Charge.fromJson(j['delivery'], 'Delivery fee'),
        gst: Charge.fromJson(j['gst'], 'GST'),
        shipping: Charge.fromJson(j['shipping'], 'Shipping charge'),
        platform: Charge.fromJson(j['platform'], 'Platform fee'),
        freeDeliveryAbove: (j['freeDeliveryAbove'] as num?)?.toInt() ?? 0,
      );
}

class Charge {
  final String label;
  final bool enabled;
  final String type; // flat | percent
  final double value;
  const Charge({this.label = '', this.enabled = false, this.type = 'flat', this.value = 0});
  static const off = Charge();

  factory Charge.fromJson(dynamic j, String fallbackLabel) {
    if (j is! Map) return Charge(label: fallbackLabel);
    return Charge(
      label: (j['label'] ?? fallbackLabel).toString(),
      enabled: j['enabled'] == true,
      type: (j['type'] ?? 'flat').toString(),
      value: (j['value'] as num?)?.toDouble() ?? 0,
    );
  }
}

class StoreChargesApi {
  final ApiClient _api;
  StoreChargesApi(this._api);

  Future<StoreCharges> get() async {
    try {
      final data = await _api.get('/store-charges');
      return StoreCharges.fromJson(data as Map<String, dynamic>);
    } catch (_) {
      return StoreCharges.empty; // no charges on failure
    }
  }
}

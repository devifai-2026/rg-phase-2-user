import 'api_client.dart';

/// One numerology category (destiny / personality / attitude / character / soul /
/// agenda / purpose) from VedicAstroAPI.
class NumerologyItem {
  final String key;      // category key (e.g. 'destiny')
  final String title;    // display title (e.g. 'Destiny', 'Soul Urge')
  final String number;   // the number (may be a master number like '22')
  final bool master;     // true for master numbers (11/22/33)
  final String meaning;
  final String description;
  const NumerologyItem({
    required this.key, required this.title, required this.number,
    this.master = false, this.meaning = '', this.description = '',
  });

  factory NumerologyItem.fromJson(String key, Map<String, dynamic> j) => NumerologyItem(
        key: key,
        title: (j['title'] ?? key).toString(),
        number: (j['number'] ?? '').toString(),
        master: j['master'] == true,
        meaning: (j['meaning'] ?? '').toString(),
        description: (j['description'] ?? '').toString(),
      );
}

class NumerologyResult {
  final String name;
  final List<NumerologyItem> items;
  const NumerologyResult({required this.name, required this.items});
}

class NumerologyApi {
  final ApiClient _api;
  NumerologyApi(this._api);

  // Provider category order (matches the response; determines display order).
  static const _order = ['destiny', 'personality', 'attitude', 'character', 'soul', 'agenda', 'purpose'];

  /// Run numerology for [name] (+ optional [date] DD/MM/YYYY, [lang] override).
  /// Instant. [lang] lets the screen re-run in another language (like horoscope).
  Future<NumerologyResult> run({required String name, String? date, String? lang}) async {
    final data = await _api.post('/numerology', body: {
      'name': name,
      if (date != null && date.isNotEmpty) 'date': date,
      if (lang != null && lang.isNotEmpty) 'lang': lang,
    });
    final map = Map<String, dynamic>.from(data as Map);
    final items = <NumerologyItem>[];
    for (final k in _order) {
      if (map[k] is Map) items.add(NumerologyItem.fromJson(k, Map<String, dynamic>.from(map[k])));
    }
    // Include any categories the provider adds beyond the known order.
    for (final e in map.entries) {
      if (!_order.contains(e.key) && e.value is Map) {
        items.add(NumerologyItem.fromJson(e.key, Map<String, dynamic>.from(e.value)));
      }
    }
    return NumerologyResult(name: name, items: items);
  }
}

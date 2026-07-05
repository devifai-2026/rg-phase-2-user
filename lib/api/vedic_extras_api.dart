import 'api_client.dart';
import '../widgets/birth_details_form.dart';

/// Aggregate marriage-matching result (raw provider fields kept as-is; the UI
/// reads what it needs). Instant, VedicAstro-backed.
class MatchResult {
  final Map<String, dynamic> raw;
  const MatchResult(this.raw);
  int get score => (raw['score'] as num?)?.toInt() ?? 0;
  String get ashtakoot => (raw['ashtakoot_score'] ?? '').toString();
  String get dashkoot => (raw['dashkoot_score'] ?? '').toString();
  String get summary => (raw['bot_response'] ?? raw['extended_response'] ?? '').toString();
  String get extended => (raw['extended_response'] ?? '').toString();
}

/// Manglik dosha result.
class ManglikResult {
  final Map<String, dynamic> raw;
  const ManglikResult(this.raw);
  double get score => (raw['score'] as num?)?.toDouble() ?? 0;
  bool get byMars => raw['manglik_by_mars'] == true;
  bool get bySaturn => raw['manglik_by_saturn'] == true;
  bool get byRahuKetu => raw['manglik_by_rahuketu'] == true;
  bool get isManglik => byMars || bySaturn || byRahuKetu;
  String get summary => (raw['bot_response'] ?? '').toString();
  List<String> get factors => ((raw['factors'] as List?) ?? const []).map((e) => e.toString()).toList();
  List<String> get aspects => ((raw['aspects'] as List?) ?? const []).map((e) => e.toString()).toList();
}

class VedicExtrasApi {
  final ApiClient _api;
  VedicExtrasApi(this._api);

  Map<String, dynamic> _birth(BirthDetails b) => {
        'dob': b.dob, 'tob': b.tob,
        if (b.lat != null) 'lat': b.lat, if (b.lon != null) 'lon': b.lon,
      };

  /// Aggregate marriage match between two births. Instant.
  Future<MatchResult> match({required BirthDetails girl, required BirthDetails boy, String? lang}) async {
    final data = await _api.post('/matching', body: {
      'girl': _birth(girl), 'boy': _birth(boy),
      if (lang != null && lang.isNotEmpty) 'lang': lang,
    });
    return MatchResult(Map<String, dynamic>.from(data as Map));
  }

  /// Manglik dosha for one birth. Instant.
  Future<ManglikResult> manglik({required BirthDetails birth, String? lang}) async {
    final data = await _api.post('/dosha/manglik', body: {
      ..._birth(birth),
      if (lang != null && lang.isNotEmpty) 'lang': lang,
    });
    return ManglikResult(Map<String, dynamic>.from(data as Map));
  }
}

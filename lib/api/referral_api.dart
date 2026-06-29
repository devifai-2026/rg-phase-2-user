import 'api_client.dart';

/// My referral status (code + reward + how many friends rewarded).
class ReferralInfo {
  final String code;
  final int reward;
  final int referralCount;
  final bool hasAppliedCode;
  final bool canApplyCode;

  const ReferralInfo({
    required this.code, required this.reward, this.referralCount = 0,
    this.hasAppliedCode = false, this.canApplyCode = false,
  });

  factory ReferralInfo.fromJson(Map<String, dynamic> j) => ReferralInfo(
        code: (j['code'] ?? '').toString(),
        reward: (j['reward'] as num?)?.toInt() ?? 50,
        referralCount: (j['referralCount'] as num?)?.toInt() ?? 0,
        hasAppliedCode: j['hasAppliedCode'] == true,
        canApplyCode: j['canApplyCode'] == true,
      );
}

class ReferralApi {
  final ApiClient _api;
  ReferralApi(this._api);

  Future<ReferralInfo> get() async =>
      ReferralInfo.fromJson(await _api.get('/users/referral') as Map<String, dynamic>);

  /// Apply a friend's code. Throws ApiException if invalid/not allowed.
  Future<void> apply(String code) async =>
      _api.post('/users/referral/apply', body: {'code': code});
}

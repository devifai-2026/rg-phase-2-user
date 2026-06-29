import 'package:flutter/foundation.dart';

import '../api/wallet_api.dart';

/// Holds the live wallet balance app-wide so the Home top bar, Wallet screen,
/// and anything else stay in sync. Refreshed on login/app-resume and updated
/// instantly from the `wallet-updated` socket event (recharge, pooja debit…).
class WalletProvider extends ChangeNotifier {
  final WalletApi _api;
  WalletProvider(this._api);

  int _balance = 0;
  bool _loaded = false;
  int get balance => _balance;
  bool get loaded => _loaded;

  void setBalance(int v) {
    if (v == _balance && _loaded) return;
    _balance = v;
    _loaded = true;
    notifyListeners();
  }

  /// Fetch the balance from the server (best-effort).
  Future<void> refresh() async {
    try { setBalance(await _api.balance()); } catch (_) {/* keep current */}
  }

  /// Apply a `wallet-updated` socket payload, e.g. { balance: 4998 }.
  void applySocket(Map<String, dynamic> data) {
    final b = (data['balance'] as num?)?.toInt();
    if (b != null) setBalance(b);
  }

  void reset() {
    _balance = 0;
    _loaded = false;
    notifyListeners();
  }
}

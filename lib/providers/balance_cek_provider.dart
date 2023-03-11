import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/balance_cek_model.dart';
import 'package:qrcode_pay/services/balance_cek_service.dart';

class BalanceCekProvider extends ChangeNotifier {
  late BalanceCekModel _balanceCek = BalanceCekModel();

  BalanceCekModel get balanceCek => _balanceCek;

  // Balance set
  set balanceCek(BalanceCekModel balanceCek) {
    _balanceCek = balanceCek;
    notifyListeners();
  }

  // Note: CekBalance
  Future<bool> cekBalance() async {
    try {
      BalanceCekModel balanceCek = await BalanceCekService().cekBalance();
      _balanceCek = balanceCek;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

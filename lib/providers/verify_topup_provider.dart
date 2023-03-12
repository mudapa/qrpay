import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/verify_topup_model.dart';
import 'package:qrcode_pay/services/verify_topup_service.dart';

class VerifyTopupProvider extends ChangeNotifier {
  late VerifyTopupModel _verifyTopUp;

  VerifyTopupModel get verifyTopUp => _verifyTopUp;

  // VerifyTopUp set
  set verifyTopUp(VerifyTopupModel verifyTopUp) {
    _verifyTopUp = verifyTopUp;
    notifyListeners();
  }

  // Note: VerifyTopUp
  Future<bool> verifyTopup({
    required String topupCode,
  }) async {
    try {
      VerifyTopupModel verifyTopUp = await VerifyTopupService().verifyTopup(
        topupCode: topupCode,
      );
      _verifyTopUp = verifyTopUp;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

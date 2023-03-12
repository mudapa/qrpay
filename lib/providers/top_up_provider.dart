import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/top_up_model.dart';
import 'package:qrcode_pay/services/top_up_service.dart';

class TopUpProvider with ChangeNotifier {
  late TopUpModel _topUp;

  TopUpModel get topUp => _topUp;

  // TopUp set
  set topUp(TopUpModel topUp) {
    _topUp = topUp;
    notifyListeners();
  }

  // Note: TopUp
  Future<bool> topupBalance({
    required String userId,
    required String topupAmount,
  }) async {
    try {
      TopUpModel topUp = await TopUpService().TopupBalance(
        userId: userId,
        topupAmount: topupAmount,
      );
      _topUp = topUp;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

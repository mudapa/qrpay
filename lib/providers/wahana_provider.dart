import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/wahana_model.dart';
import 'package:qrcode_pay/services/wahana_service.dart';

class WahanaProvider extends ChangeNotifier {
  List<WahanaModel> _wahanas = [];

  List<WahanaModel> get wahanas => _wahanas;

  // Wahana set
  set wahanas(List<WahanaModel> wahanas) {
    _wahanas = wahanas;
    notifyListeners();
  }

  // Note: GetWahanas
  Future<bool> getWahanas() async {
    try {
      List<WahanaModel> wahanas = await WahanaService().getWahanas();
      _wahanas = wahanas;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

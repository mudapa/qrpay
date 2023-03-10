import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/services/outlet_service.dart';

class OutletProvider with ChangeNotifier {
  List<OutletModel> _outlets = [];

  List<OutletModel> get outlets => _outlets;

  // Outlet set
  set outlets(List<OutletModel> outlets) {
    _outlets = outlets;
    notifyListeners();
  }

  // Note: GetOutlets
  Future<bool> getOutlets() async {
    try {
      List<OutletModel> outlets = await OutletService().getOutlets();
      _outlets = outlets;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

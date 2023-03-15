import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/services/outlet_service.dart';

class OutletProvider with ChangeNotifier {
  List<OutletModel> _outlets = [];
  List<AllProductModel> _products = [];

  List<OutletModel> get outlets => _outlets;
  List<AllProductModel> get products => _products;

  // Outlet set
  set outlets(List<OutletModel> outlets) {
    _outlets = outlets;
    notifyListeners();
  }

  // Product set
  set products(List<AllProductModel> products) {
    _products = products;
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

  // Note: GetProducts
  Future<bool> getProducts() async {
    try {
      List<AllProductModel> products = await OutletService().getProducts();
      _products = products;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

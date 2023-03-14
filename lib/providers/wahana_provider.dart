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

  late TransactionWahanaModel _transactionWahana;

  TransactionWahanaModel get transactionWahana => _transactionWahana;

  // TransactionWahana set
  set transactionWahana(TransactionWahanaModel transactionWahana) {
    _transactionWahana = transactionWahana;
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

  // Note: GetWahanaId
  Future<bool> getWahanaId() async {
    try {
      WahanaModel wahanas = await WahanaService().getWahanaId();
      _wahanas = [wahanas];
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Note: Transaction Wahana
  Future<bool> payPlayground({
    required String playgroundId,
    required String userId,
  }) async {
    try {
      TransactionWahanaModel transactionWahana =
          await WahanaService().payPlayground(
        playgroundId: playgroundId,
        userId: userId,
      );
      _transactionWahana = transactionWahana;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/data_model.dart';
import 'package:qrcode_pay/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  // User set
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // Note: Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }
}

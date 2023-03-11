import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qrcode_pay/models/balance_cek_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceCekService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  Future<BalanceCekModel> cekBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    var urlCekBalance = '$baseUrl/balance-checks/1';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(urlCekBalance),
      headers: headers,
    );

    print(token);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      BalanceCekModel balance = BalanceCekModel.fromJson(data);

      return balance;
    } else {
      throw Exception('Failed cek balance');
    }
  }
}

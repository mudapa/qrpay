import 'dart:convert';

import 'package:qrcode_pay/models/wahana_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WahanaService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // get All Wahana
  Future<List<WahanaModel>> getWahanas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    var urlWahana = '$baseUrl/playgrounds';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      Uri.parse(urlWahana),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<WahanaModel> wahanas = [];

      for (var item in data) {
        wahanas.add(WahanaModel.fromJson(item));
      }

      return wahanas;
    } else {
      throw Exception('Gagal Get Wahana!');
    }
  }

  // get Wahana by Id
  Future<WahanaModel> getWahanaId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    var urlWahanaId = '$baseUrl/playgrounds/1';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      Uri.parse(urlWahanaId),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      WahanaModel wahanas = WahanaModel.fromJson(data);
      return wahanas;
    } else {
      throw Exception('Failed to get Wahana by Id');
    }
  }

  // Transaction Wahana
  Future<TransactionWahanaModel> payPlayground({
    required String playgroundId,
    required String userId,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    var urlpayPlay = '$baseUrl/transactions/playground';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'playground_id': playgroundId,
      'user_id': userId,
    });

    var response = await http.post(
      Uri.parse(urlpayPlay),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      TransactionWahanaModel transactionWahana =
          TransactionWahanaModel.fromJson(data);
      transactionWahana.transaction = data['transaction'];
      transactionWahana.transactionPlayground = data['transaction_playground'];

      return transactionWahana;
    } else {
      throw Exception('Failed to pay playground');
    }
  }
}

import 'dart:convert';

import 'package:qrcode_pay/models/wahana_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WahanaService {
  String baseUrl = 'http://192.168.3.162:8000/api';

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
}

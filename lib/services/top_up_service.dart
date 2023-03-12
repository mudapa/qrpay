import 'dart:convert';
import 'package:qrcode_pay/models/top_up_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TopUpService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // Note: TopUp
  Future<TopUpModel> topupBalance({
    required String userId,
    required String topupAmount,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    var urlTopup = '$baseUrl/topups';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'user_id': userId,
      'topup_amount': topupAmount,
    });

    var response = await http.post(
      Uri.parse(urlTopup),
      headers: headers,
      body: body,
    );

    print(token);
    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      TopUpModel topup = TopUpModel.fromJson(data['topup']);
      topup.path = data['path'];
      topup.topupCode = data['topup_code'];

      return topup;
    } else {
      throw Exception('Failed topup');
    }
  }
}

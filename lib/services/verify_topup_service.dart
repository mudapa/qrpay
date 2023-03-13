import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrcode_pay/models/verify_topup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyTopupService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // Note: Verify Topup
  Future<VerifyTopupModel> verifyTopup({
    required String topupCode,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    var urlVerify = '$baseUrl/topups/verify';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'topup_code': topupCode,
    });

    var response = await http.post(
      Uri.parse(urlVerify),
      headers: headers,
      body: body,
    );

    print(token);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      VerifyTopupModel verifyTopup = VerifyTopupModel.fromJson(data['topup']);

      return verifyTopup;
    } else {
      throw Exception('Failed verify topup');
    }
  }
}

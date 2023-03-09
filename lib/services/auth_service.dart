import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrcode_pay/models/data_model.dart';

class AuthService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // Note: Login
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var urlLogin = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(urlLogin),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }
}

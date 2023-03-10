import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrcode_pay/models/outlet_model.dart';

class OutletService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // Note: Outlet
  Future<List<OutletModel>> getOutlets() async {
    var urlOutlet = '$baseUrl/outlets';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 179|rFKl9hSTY2vGn5H63wJU0qDOrXI0UR3iXDVGcciE',
    };
    var response = await http.get(
      Uri.parse(urlOutlet),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<OutletModel> outlets = [];

      for (var item in data) {
        outlets.add(OutletModel.fromJson(item));
      }

      return outlets;
    } else {
      throw Exception('Gagal Get Outlet!');
    }
  }
}

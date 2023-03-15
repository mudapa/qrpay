import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutletService {
  String baseUrl = 'http://192.168.3.162:8000/api';

  // Note: Outlet
  Future<List<OutletModel>> getOutlets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    var urlOutlet = '$baseUrl/outlets';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      Uri.parse(urlOutlet),
      headers: headers,
    );

    print(token);
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

  // Note: Product
  Future<List<AllProductModel>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    var urlProduct = '$baseUrl/products';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      Uri.parse(urlProduct),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<AllProductModel> products = [];

      for (var item in data) {
        products.add(AllProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Product!');
    }
  }
}

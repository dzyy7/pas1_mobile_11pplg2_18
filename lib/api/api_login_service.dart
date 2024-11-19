import 'dart:convert';
import 'package:pas1_mobile_11pplg2_18/Models/api_login_model.dart';
import 'package:http/http.dart' as http;


class ApiLoginService {
  final String _baseUrl = "https://mediadwi.com/api/latihan/login";

  Future<ApiLoginModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return ApiLoginModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to login");
    }
  }
}

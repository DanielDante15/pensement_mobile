import 'dart:convert';
import 'package:pensement_mobile/utils/env.dart';
import 'package:http/http.dart' as http;

class LoginController extends UrlEnviroment {
  Future<http.Response> login(String username, String password) async {
    return await http
        .post(Uri.parse('${super.env}/auth/login'),
            headers: {'content-type': 'application/json'},
            body: json.encode({"email": username, "password": password}))
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw 'Error while retrieving data';
    });
  }
}

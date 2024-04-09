import 'dart:convert';
import 'package:pensement_mobile/utils/env.dart';
import 'package:http/http.dart' as http;

class UserController extends UrlEnviroment {
  Future<http.Response> register({
    required String token,
    required String name,
    required String email,
    required String password,
  }) async {
    return await http
        .post(Uri.parse('${super.env}/auth/register'),
            headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: json
                .encode({"name": name, "email": email, "password": password}))
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw 'Error while retrieving data';
    });
  }
}

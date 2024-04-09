import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pensement_mobile/components/SnackBar/snacknbar.dart';
import 'package:pensement_mobile/controllers/LoginController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthContext extends ChangeNotifier {
  final LoginController api = LoginController();
  static AuthContext service = AuthContext();

  var isLoading = false;
  var isAuth = false;
  var error = false;

  Future<void> setToken(String stoken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', stoken);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    isAuth = false;
    isLoading = false;
    notifyListeners();
  }

  validateToken() async {
    String? recoveredToken = await getToken();
    try {
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(recoveredToken.toString());
      if (decodedToken.containsKey('exp')) {
        int expiryTimeInSeconds = decodedToken['exp'];
        DateTime expiryDateTime =
            DateTime.fromMillisecondsSinceEpoch(expiryTimeInSeconds * 1000);
        if (expiryDateTime.isAfter(DateTime.now())) {
          isAuth = true;
          notifyListeners();
        }
      }
    } catch (e) {
      notifyListeners();
    }
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));

      var response = await api.login(username, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> resBody =
            jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
        setToken(resBody['token']);
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        SnackbarManager().showErrorSnackbar('Error while logging in.');
        error = true;
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (err) {
      SnackbarManager().showErrorSnackbar(err.toString());
      notifyListeners();
      return false;
    }
  }
}

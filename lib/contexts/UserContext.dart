import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pensement_mobile/components/SnackBar/snacknbar.dart';
import 'package:pensement_mobile/contexts/AuthContext.dart';
import 'package:pensement_mobile/controllers/UserController.dart';

class UserContext extends ChangeNotifier {
  final UserController api = UserController();
  static UserContext service = UserContext();
  final auth = AuthContext.service;

  var isLoading = false;
  var isUserCreated = false;
  var error = false;
  var user = {};

  Future<void> getUserById(String id) async {
    isLoading = true;
    notifyListeners();
    final token = await auth.getToken();
    try {
      final response = await api.getUser(token: token, id: id);
      if (response.statusCode == 200) {
        user = jsonDecode(response.body);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      error = true;
      notifyListeners();
    }
  }

  Future<bool> registerUser(String name, email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final token = await auth.getToken();
      var response = await api.register(
        token: token,
        email: email,
        name: name,
        password: password,
      );

      if (response.statusCode == 200) {
        SnackbarManager().showSuccessSnackbar('User created successfully!');
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        SnackbarManager().showErrorSnackbar('Error while creating user!');
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

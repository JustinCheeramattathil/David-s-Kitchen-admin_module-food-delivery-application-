// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:adminmodule/repository/admin_login_repository.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository _loginRepository;
  LoginController(this._loginRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _loginSuccess = false;
  bool get loginSuccess => _loginSuccess;

  void setLoginSuccess(bool success) {
    _loginSuccess = success;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> adminLogin(
      String mobile, String password, BuildContext context) async {
    try {
      setLoading(true);
      final result = await _loginRepository.adminLogin(mobile, password);

      if (result["success"]) {
        // Successful login
        log('Successfully logged in');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully logged in'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Failed login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect mobile or password'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        log('Login failed: ${result["error"]["message"]}',
            error: result["error"]);
      }
    } catch (error) {
      // Exception during API call
      log('Exception during API call: $error', error: error);
    } finally {
      setLoading(false);
    }
  }

  Future<void> checkAdminLoginStatus() async {
    try {
      // Call the repository function to check admin login status
      final status = await _loginRepository.checkAdminLoginStatus();

      if (status is Map<String, dynamic>) {
        // Handle the response data if needed
        log('Admin login status response: $status');
      } else if (status is bool) {
        // Handle the success value if needed
        log('Admin login status success: $status');
      }
    } catch (error) {
      // Handle the exception during status check if needed
      log('Exception during admin login status check: $error', error: error);
    }
  }
}

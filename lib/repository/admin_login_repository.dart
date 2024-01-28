import 'dart:developer';

import 'package:adminmodule/core/api/api_base_url.dart';
import 'package:adminmodule/core/api/api_end_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final Dio _dio;
  LoginRepository(this._dio);

  final loginurl = ApiBaseUrl().baseurl + ApiEndUrl().adminLogin;
  final tokenvalidation = ApiBaseUrl().baseurl + ApiEndUrl().checkifadmin;

  Future<Map<String, dynamic>> adminLogin(
      String mobile, String password) async {
    log('function is taking');
    try {
      log('haiiiiiiiiiii');
      final response = await _dio.post(
        loginurl,
        data: {
          "mobile": mobile,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        // log(token);

        // Successful login
        return {"success": true, "data": response.data};
      } else {
        // Failed login
        return {"success": false, "error": response.data};
      }
    } catch (error) {
      // Exception during API call
      return {
        "success": false,
        "error": {"message": "Something went wrong"}
      };
    }
  }

  Future<dynamic> checkAdminLoginStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token != null) {
        final response = await _dio.post(
          tokenvalidation,
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );

        if (response.statusCode == 200) {
          // Token is valid, return the response data
          return response.data;
        } else {
          // Token validation failed, return the success value from response data
          return response.data['success'];
        }
      } else {
        // Token is not available, return false
        return false;
      }
    } catch (error) {
      // Exception during API call, return false
      return false;
    }
  }
}

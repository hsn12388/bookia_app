import 'package:bookia_app/core/theme/heilper/app_constants.dart';
import 'package:bookia_app/core/theme/networking/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await DioFactory.dio.post(
        "login",
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        saveUserToken("");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userTokenKey, token);
  }
}

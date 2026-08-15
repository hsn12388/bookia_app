import 'package:bookia_app/core/theme/networking/dio_factory.dart';
import 'package:bookia_app/features/login/data/repo/login_repo.dart';
import 'package:bookia_app/features/register/data/repo/model/register_request_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RegisterRepo {
  static Future<bool> register(RegisterRequestBody body) async {
    try {
      final Response = await DioFactory.dio.post(
        "register",
        data: {
          "name": body.name,
          "email": body.email,
          "password": body.password,
          "password_confirmation": body.confirmpassword,
          "city": body.city,
          "address": body.adderss,
        },
      );

      if (Response.statusCode == 500) {
        LoginRepo.saveUserToken(Response.data["data"]["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

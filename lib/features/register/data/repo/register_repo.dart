import 'package:bookia_app/features/login/data/repo/login_repo.dart';

class RegisterRepo {
  static Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    LoginRepo.intlogger();
    try {
      var response = await LoginRepo.dio.post(
        "https://codingarabic.online/api/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "address": "",
          "city": "",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

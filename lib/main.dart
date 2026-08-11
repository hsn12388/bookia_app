import 'package:bookia_app/core/theme/heilper/app_constants.dart';
import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookia_app/features/bookia_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = await prefs.getString(AppConstants.userTokenKey);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: BookiaApp(token: token),
    ),
  );
}

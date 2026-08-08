import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookia_app/features/bookia_app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: BookiaApp(),
    ),
  );
}

import 'package:bookia_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.backgroundlight,
    appBarTheme: AppBarThemeData(backgroundColor: AppColor.backgroundlight),
    fontFamily: 'DM',

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        //color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        //color: Colors.black,
      ),
      titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.bordercolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.mainColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.bordercolor),
      ),
    ),

    //scaffoldBackgroundColor: Color(0xFFF7F8F9),
  );
  static ThemeData darktheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundDark,
    appBarTheme: AppBarThemeData(backgroundColor: AppColor.backgroundDark),

    brightness: Brightness.dark,
    fontFamily: 'DM',

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        //color: Colors.black,
      ),
      titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black.withValues(alpha: .7),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.bordercolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.mainColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.bordercolor),
      ),
    ),
  );
}

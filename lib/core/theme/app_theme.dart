import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,

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
    ),

    //scaffoldBackgroundColor: Color(0xFFF7F8F9),
  );
  static ThemeData darktheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'DM',

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        //color: Colors.black,
      ),
    ),
  );
}

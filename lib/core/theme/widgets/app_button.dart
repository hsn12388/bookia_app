import 'package:bookia_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  const AppButton({super.key, this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: backgroundColor ?? AppColor.mainColor,
      ),

      child: Text(
        text!,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: backgroundColor == null ? Colors.white : Colors.black,
        ),
        //    style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

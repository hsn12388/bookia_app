import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:bookia_app/core/theme/widgets/app_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_back_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_text_form_fild.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), leadingWidth: 80.w),
      body: Padding(
        padding: 22.padall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            Text(
              "Welcome back! Glad to see you, Again!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            32.verticalSpace,
            CustomTextFormFild(
              keyboardtype: TextInputType.emailAddress,
              hintText: "Enter Your Email",
              keyboardType: TextInputType.emailAddress,
            ),
            16.verticalSpace,
            CustomTextFormFild(
              keyboardtype: TextInputType.visiblePassword,

              hintText: "Enter Your password",
              isPassword: true,
            ),
            30.verticalSpace,
            AppButton(text: LocaleKeys.login.tr()),
          ],
        ),
      ),
    );
  }
}

import 'package:bookia_app/core/theme/app_theme.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/core/theme/widgets/app_button.dart';
import 'package:bookia_app/features/login/presentation/ui/login_screen.dart';
import 'package:bookia_app/features/welcome/presentation/ui/widgets/welcome_setting.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Assets.images.backS.image().image,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 135.h),
            Assets.images.splashLogo.image(),
            SizedBox(height: 28.h),
            Text(
              LocaleKeys.welcome_text.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 28.h),
            WelcomeSetting(),
            SizedBox(height: 120.h),
            AppButton(
              text: LocaleKeys.login.tr(),
              onTap: () {
                //  Navigator.push(
                //  context,
                // MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
                // Navigator.pushNamed(context, Routes.LoginScreen);
                context.pushNamed(Routes.LoginScreen);
              },
            ),

            SizedBox(height: 15.h),
            AppButton(
              onTap: () {
                context.pushNamed(Routes.RegisterScreen);
              },
              text: LocaleKeys.register.tr(),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookia_app/core/theme/app_color.dart';
import 'package:bookia_app/core/theme/heilper/app_dialogs.dart';
import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/core/theme/widgets/app_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_back_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_text_form_fild.dart';
import 'package:bookia_app/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), leadingWidth: 80.w),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Loginloading) {
            AppDialogs.loadingDialog(context);
          } else if (state is Loginsuccess) {
            context.pushNameAndRemoveUntil(Routes.homeScreen, false);
          } else {
            context.pop();
            AppDialogs.Errordialog(context);
          }
        },
        child: Padding(
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
                controller: emailcontroller,
                keyboardtype: TextInputType.emailAddress,
                hintText: "Enter Your Email",
                keyboardType: TextInputType.emailAddress,
              ),
              16.verticalSpace,
              CustomTextFormFild(
                controller: passwordcontroller,
                keyboardtype: TextInputType.visiblePassword,

                hintText: "Enter Your password",
                isPassword: true,
              ),
              30.verticalSpace,
              AppButton(
                text: LocaleKeys.login.tr(),
                onTap: () {
                  context.read<LoginCubit>().login(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );
                },
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.RegisterScreen);
                    },
                    child: Text(
                      "Register Now",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

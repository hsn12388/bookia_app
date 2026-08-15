import 'package:bookia_app/core/theme/app_color.dart';
import 'package:bookia_app/core/theme/heilper/app_dialogs.dart';
import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/core/theme/widgets/app_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_back_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_text_form_fild.dart';
import 'package:bookia_app/features/register/data/repo/model/register_request_body.dart';
import 'package:bookia_app/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var addresscontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    citycontroller.dispose();
    addresscontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), leadingWidth: 78.w),

      body: Padding(
        padding: 16.padhorizontal,
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              AppDialogs.loadingDialog(context);
            } else if (state is RegisterSuccess) {
              context.pushNameAndRemoveUntil(Routes.homeScreen, false);
            } else {
              context.pop();
              AppDialogs.Errordialog(context);
            }
          },
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
                controller: namecontroller,
                keyboardtype: TextInputType.name,
                hintText: "Enter Your Name",
                keyboardType: TextInputType.emailAddress,
              ),
              16.verticalSpace,
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

              16.verticalSpace,
              CustomTextFormFild(
                controller: confirmpasswordcontroller,
                keyboardtype: TextInputType.visiblePassword,

                hintText: "Confirmation Password",
                isPassword: true,
              ),
              16.verticalSpace,
              CustomTextFormFild(
                controller: citycontroller,
                keyboardtype: TextInputType.text,

                hintText: "City",
              ),
              16.verticalSpace,
              CustomTextFormFild(
                controller: addresscontroller,
                keyboardtype: TextInputType.text,

                hintText: "Address",
              ),
              30.verticalSpace,
              AppButton(
                text: LocaleKeys.register.tr(),
                onTap: () {
                  context.read<RegisterCubit>().register(
                    RegisterRequestBody(
                      name: namecontroller.text,
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                      confirmpassword: confirmpasswordcontroller.text,
                      adderss: addresscontroller.text,
                      city: citycontroller.text,
                    ),
                  );
                },
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

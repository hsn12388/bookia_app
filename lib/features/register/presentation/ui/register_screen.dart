import 'package:bookia_app/core/theme/heilper/app_dialogs.dart';
import 'package:bookia_app/core/theme/heilper/extentions.dart';
import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/core/theme/widgets/app_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_back_button.dart';
import 'package:bookia_app/core/theme/widgets/custom_text_form_fild.dart';
import 'package:bookia_app/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(leading: CustomBackButton(), leadingWidth: 80.w),
            body: BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  AppDialogs.loadingDialog(context);
                } else if (state is RegisterSuccess) {
                  context.pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully completed"),
                      backgroundColor: Colors.green,
                    ),
                  );

                  context.pushNameAndRemoveUntil(Routes.homeScreen, false);
                } else if (state is RegisterPasswordMismatch) {
                  AppDialogs.Errordialog(context);
                } else if (state is RegisterError) {
                  context.pop();
                  AppDialogs.Errordialog(context);
                }
              },
              child: Padding(
                padding: 22.padall,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.verticalSpace,
                      Text(
                        "Hello! Register to get started",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      32.verticalSpace,
                      CustomTextFormFild(
                        controller: nameController,
                        keyboardtype: TextInputType.name,
                        hintText: "Username",
                      ),
                      16.verticalSpace,
                      CustomTextFormFild(
                        controller: emailController,
                        keyboardtype: TextInputType.emailAddress,
                        hintText: "Email",
                      ),
                      16.verticalSpace,
                      CustomTextFormFild(
                        controller: passwordController,
                        keyboardtype: TextInputType.visiblePassword,
                        hintText: "Password",
                        isPassword: true,
                      ),
                      16.verticalSpace,
                      CustomTextFormFild(
                        controller: confirmPasswordController,
                        keyboardtype: TextInputType.visiblePassword,
                        hintText: "Confirm password",
                        isPassword: true,
                      ),
                      30.verticalSpace,
                      AppButton(
                        text: "Register",
                        onTap: () {
                          context.read<RegisterCubit>().register(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text,
                            passwordConfirmation:
                                confirmPasswordController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

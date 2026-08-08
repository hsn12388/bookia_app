import 'package:bookia_app/core/theme/app_theme.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:bookia_app/core/theme/routes/app_router.dart';
import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/features/login/presentation/ui/login_screen.dart';
import 'package:bookia_app/features/register/presentation/ui/register_screen.dart';
import 'package:bookia_app/features/welcome/presentation/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: context.read<ThemeCubit>().appTheme,
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: Routes.WelcomeScreen,
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:bookia_app/core/theme/routes/routes.dart';
import 'package:bookia_app/features/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:bookia_app/features/login/presentation/ui/login_screen.dart';
import 'package:bookia_app/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:bookia_app/features/register/presentation/ui/register_screen.dart';
import 'package:bookia_app/features/welcome/presentation/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.LoginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.RegisterScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterScreen(),
          ),
        );

      case Routes.WelcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("404 Not found")],
              ),
            ),
          ),
        );
    }
  }
}

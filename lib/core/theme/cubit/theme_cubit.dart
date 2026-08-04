import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bookia_app/core/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  ThemeData appTheme = AppTheme.lighttheme;

  void ChangeMode() {
    if (appTheme == AppTheme.lighttheme) {
      appTheme = AppTheme.darktheme;
    } else {
      appTheme = AppTheme.lighttheme;
    }
    emit(ChangeState(theme: appTheme));
  }
}

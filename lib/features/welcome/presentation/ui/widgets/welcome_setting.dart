import 'package:bookia_app/core/theme/app_theme.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSetting extends StatelessWidget {
  const WelcomeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.black.withValues(alpha: 0.3),
              ),
              child: Column(
                children: [
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.dark_mode.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Switch.adaptive(
                            value:
                                context.read<ThemeCubit>().appTheme ==
                                AppTheme.darktheme,
                            onChanged: (v) {
                              context.read<ThemeCubit>().ChangeMode();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.english_language.tr(),

                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Switch.adaptive(
                        value: context.locale.languageCode == 'en',
                        onChanged: (v) {
                          if (context.locale.languageCode == 'ar') {
                            context.setLocale(Locale('en'));
                          } else {
                            context.setLocale(Locale('ar'));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}

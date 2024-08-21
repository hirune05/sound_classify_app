import 'package:flutter/material.dart';
import 'package:sound_classify_app/thems/app_colors.dart';

ThemeData appTheme(BuildContext context) => ThemeData().copyWith(
      scaffoldBackgroundColor: AppColors.backGround,
      appBarTheme: const AppBarTheme(
        color: AppColors.appBarBackGround,
        titleTextStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText),
      ),
    );

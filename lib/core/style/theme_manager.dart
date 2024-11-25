import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class ThemeManager {
  static ThemeData getDarkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,

    textTheme:const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: Colors.black,
        foregroundColor: ColorManager.blendedGreen,
        textStyle: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: ColorManager.blendedGreen
        ),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.grey[900]
      ),
    ),

  );
}
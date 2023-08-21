import 'package:berayean/src/theme_manager/color_manager.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationThemeData(){
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.primary,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstant.fontFamily,
  );
}
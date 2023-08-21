import 'package:berayean/src/theme_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color
) {
  return GoogleFonts.poppins().copyWith(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color
  );
} 

TextStyle getWhiteTextStyle ({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular
}){

  return _getTextStyle(fontSize, FontFamilyConstant.fontFamily, fontWeight, ColorManager.white);
}

TextStyle getBlack30TextStyle ({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular
}){

  return _getTextStyle(fontSize, FontFamilyConstant.fontFamily, fontWeight, ColorManager.black30);
}

TextStyle getBlack60TextStyle ({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular
}){

  return _getTextStyle(fontSize, FontFamilyConstant.fontFamily, fontWeight, ColorManager.black60);
}

TextStyle getBlackTextStyle ({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular
}){

  return _getTextStyle(fontSize, FontFamilyConstant.fontFamily, fontWeight, ColorManager.black);
}
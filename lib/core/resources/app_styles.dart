import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_font.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    String? fontFamily, TextDecoration? decoration, Color? decorationColor,double? letterSpacing) {
  return GoogleFonts.getFont(fontFamily ?? 'Inter',
      fontSize: fontSize,
      decoration: decoration,
      letterSpacing:letterSpacing ,
      decorationColor: decorationColor,
      // fontFamily: fontFamily??AppFonts.mainFont,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
      double? letterSpacing,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.regular,
      color, fontFamily, decoration, decorationColor,letterSpacing);
}

// medium style

TextStyle getMediumStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
      double? letterSpacing,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.medium, color,
      fontFamily, decoration, decorationColor,letterSpacing);
}

// medium style

TextStyle getLightStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
      double? letterSpacing,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.light, color,
      fontFamily, decoration, decorationColor,letterSpacing);
}

// bold style

TextStyle getBoldStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
      double? letterSpacing,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.bold, color,
      fontFamily, decoration, decorationColor,letterSpacing);
}// extraBold style

TextStyle getExtraBoldStyle(
    {double? fontSize,
    required Color color,
      double? letterSpacing,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.extraBold, color,
      fontFamily, decoration, decorationColor,letterSpacing);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double? fontSize,
      double? letterSpacing,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.semiBold,
      color, fontFamily, decoration, decorationColor,letterSpacing);
}

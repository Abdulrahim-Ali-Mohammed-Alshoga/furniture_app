import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_font.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    String? fontFamily, TextDecoration? decoration, Color? decorationColor) {
  return GoogleFonts.getFont(fontFamily ?? 'Inter',
      fontSize: fontSize,
      decoration: decoration,
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
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.regular,
      color, fontFamily, decoration, decorationColor);
}

// medium style

TextStyle getMediumStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.medium, color,
      fontFamily, decoration, decorationColor);
}

// medium style

TextStyle getLightStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.light, color,
      fontFamily, decoration, decorationColor);
}

// bold style

TextStyle getBoldStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.bold, color,
      fontFamily, decoration, decorationColor);
}// extraBold style

TextStyle getExtraBoldStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.extraBold, color,
      fontFamily, decoration, decorationColor);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double? fontSize,
    required Color color,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return _getTextStyle(fontSize ?? AppFontSize.s12, AppFontWeight.semiBold,
      color, fontFamily, decoration, decorationColor);
}

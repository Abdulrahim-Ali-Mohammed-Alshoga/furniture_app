import 'package:flutter/material.dart';

import '../resources/app_colors.dart';



class AppTheme {
  AppTheme._();

  static ThemeData getLightTheme() {
    return ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
          shape: CircleBorder(),
          backgroundColor: AppColors.iconFloatingActionButton,
        ),

        primaryColor: AppColors.mainLight,
        primaryColorLight: AppColors.secondLight,
        primaryColorDark: AppColors.thirdLight,
        canvasColor: AppColors.mainLight,
        dividerTheme: const DividerThemeData(
          color: Colors.black54,
        ),
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.mainLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        shadowColor: Colors.grey.withOpacity(0.5),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(AppColors.green)),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          color: AppColors.mainLight,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: AppColors.mainLight,
        cardColor: AppColors.mainLight,
        brightness: Brightness.light,
        dividerColor: AppColors.accent.withOpacity(0.1),
        focusColor: AppColors.accent,
        fontFamily: 'Almarai',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.accent),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.white,
        ),
        // textTheme: const TextTheme(
        //   headline1: TextStyle(
        //       fontSize: 96.0, color: Colors.white, fontWeight: FontWeight.w300),
        //   headline2: TextStyle(
        //       fontSize: 60.0, color: Colors.black, fontWeight: FontWeight.w300),
        //   headline3: TextStyle(
        //       fontSize: 48.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   headline4: TextStyle(
        //       fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   headline5: TextStyle(
        //       fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   headline6: TextStyle(
        //       fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500),
        //   subtitle1: TextStyle(
        //       fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   subtitle2: TextStyle(
        //       fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500),
        //   bodyText1: TextStyle(
        //       fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   bodyText2: TextStyle(
        //       fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
        //   caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        //   overline: TextStyle(
        //       fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w400),
        // )
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: AppColors.mainDark,
        primaryColorLight: AppColors.secondDark,
        primaryColorDark: AppColors.secondDark,
        // backgroundColor: AppColors.mainDark,
        canvasColor: AppColors.mainDark,
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
        ),
        shadowColor: AppColors.accent.withOpacity(0.2),
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.mainDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(AppColors.green)),
        appBarTheme: const AppBarTheme().copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0.0,
            color: AppColors.mainDark,
            centerTitle: true,
            titleTextStyle: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.mainDark,
        cardColor: AppColors.mainDark,
        applyElevationOverlayColor: true,
        dividerColor: AppColors.accent.withOpacity(0.1),
        focusColor: AppColors.accent,
        fontFamily: 'Almarai',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.accent,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.secondDark,
          secondary: AppColors.accent,
        ),
        // textTheme: const
        // TextTheme(
        //   headline1: TextStyle(
        //       fontSize: 96.0, color: Colors.white, fontWeight: FontWeight.w300),
        //   headline2: TextStyle(
        //       fontSize: 60.0, color: Colors.white, fontWeight: FontWeight.w300),
        //   headline3: TextStyle(
        //       fontSize: 48.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   headline4: TextStyle(
        //       fontSize: 34.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   headline5: TextStyle(
        //       fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   headline6: TextStyle(
        //       fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500),
        //   subtitle1: TextStyle(
        //       fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   subtitle2: TextStyle(
        //       fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w500),
        //   bodyText1: TextStyle(
        //       fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   bodyText2: TextStyle(
        //       fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400),
        //   caption: TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w300,
        //   ),
        //   overline: TextStyle(
        //       fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w400),
        // )
    );
  }
}

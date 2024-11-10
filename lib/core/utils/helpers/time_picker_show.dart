import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';


Future pickTime({required BuildContext context}) async {
  final initialDate = TimeOfDay.now();
  return showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialDate,
      builder: (context, child) {
        return Theme(data: ThemeData(useMaterial3: false, primaryColor: Colors.red), child: child!);
        // return Theme(data: _buildShrineTheme(context), child: child!);
      });
}

ThemeData _buildShrineTheme(BuildContext context) {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppColors.secondLight,
      onPrimary: AppColors.white,
      surface: AppColors.white,
      secondary: AppColors.secondLight,
      onSurface: AppColors.black,
      onBackground: AppColors.secondLight,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.black),
      headlineMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.black),
      // labelSmall: TextStyle(color: AppColors.black),
    ),
  );
}

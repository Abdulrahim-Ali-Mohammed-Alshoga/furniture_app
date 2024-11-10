import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../resources/app_colors.dart';

Future pickDate({
  required BuildContext context,
  DateTime? firstDate,
  String? initialDate,
}) async {
  //final initialDate = DateTime.now();
  DateTime? dateTime;
  if (initialDate!=null) {
    DateFormat format = DateFormat("dd-MM-yyyy h:mm a");
   dateTime = format.parse(initialDate);
  }

  return showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: dateTime ?? DateTime.now(),
      builder: (context, child) => Theme(
          data: ThemeData(useMaterial3: false, primaryColor: Colors.red),
          child: child!),
      // builder: (context, child) {
      //   return Theme(data: _buildShrineTheme(context), child: child!);
      // },
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5));
}

ThemeData _buildShrineTheme(BuildContext context) {
  final ThemeData base = ThemeData.light(useMaterial3: false);
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

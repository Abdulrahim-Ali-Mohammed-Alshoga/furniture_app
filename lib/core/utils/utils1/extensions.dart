import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

extension ListExtension<T> on List<T> {
  T get randomElement => this[Random().nextInt(length)];
}

extension StringExtension on String {
  Color get statusColor {
    switch (this) {
      case 'free':
        return AppColors.statusBlue;
      case 'costed':
        return AppColors.statusBlue;
      case 'completed':
        return AppColors.statusGreen;
      case 'released':
        return AppColors.statusGray;
      case 'closed':
        return AppColors.statusGray;
      case 'rejected':
        return AppColors.statusRed;
      case 'canceled':
        return AppColors.statusRed;
      default:
        return AppColors.statusGray;
    }
  }
}

extension NonNullString on String? {
  String get orEmpty {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
  DateTime? toDateTime() {
    try {
      // تقسيم السلسلة النصية إلى أجزاء
      List<String> parts = this!.split(' ');

      // تأكد من وجود الأجزاء المطلوبة
      if (parts.length != 3) {
        return null; // إرجاع null إذا لم يكن هناك 3 أجزاء
      }

      // تقسيم التاريخ والوقت
      List<String> dateParts = parts[0].split('-');
      List<String> timeParts = parts[1].split(':');

      // تحويل الأجزاء إلى أرقام
      int day = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      // تعديل الساعة بناءً على AM/PM
      if (parts[2].toUpperCase() == 'PM' && hour != 12) {
        hour += 12; // إضافة 12 ساعة إذا كانت PM
      } else if (parts[2].toUpperCase() == 'AM' && hour == 12) {
        hour = 0; // تحويل 12 AM إلى 0 ساعة
      }

      // إنشاء كائن DateTime
      return DateTime(year, month, day, hour, minute);
    } catch (e) {
      return null; // إرجاع null عند حدوث خطأ
    }
  }

  String? toIso8601() {
    DateTime? dateTime = toDateTime();
    return dateTime?.toIso8601String(); // إرجاع التاريخ بتنسيق ISO 8601
  }


  String get to12HourFormat {
    if (this!.isEmpty) {
      return '';
    }
    DateTime dateTime = DateTime.parse(this!);
    String date =
        '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    String period = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    String time = '$hour:${minute.toString().padLeft(2, '0')} $period';
    return '$date $time';
    // return DateFormat.jm().format(dateTime);
  }

  String get orEmptyData {
    if (this == null || this!.isEmpty) {
      return '0000';
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int get orZero  {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }

  String get toCycleUnit {
    switch (this) {
      case 1:
        return 'Year';
      case 2:
        return 'Quarterly';
      case 3:
        return 'Month';
      case 4:
        return 'Week';

      default:
        return 'Unknown'; // يمكنك تعديل هذه القيمة حسب الحاجة
    }
  }
}

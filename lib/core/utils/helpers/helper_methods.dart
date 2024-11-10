import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/connectivity_service/connectivity_service.dart';


class HelperMethods {
  HelperMethods._();

  static bool noInternetConnection() {
    return Get.find<ConnectivityController>().currentConnectivityStatus ==
        false;
  }

  static hideSoftKeyBoard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static bool isRequired(String name) {
    return name.trim().substring(0, 1).contains('*');
  }

  static String baseName(String name) {
    if (name.trim().isEmpty) return name.trim();
    return isRequired(name)
        ? '${name.trim().substring(1).trim()} *'
        : name.trim();
  }
  static String? validateDateTimeNotNull(DateTime? str) {
    return ((str.toString().isEmpty || str ==  null)? "This Field is Required" : null);
  }
  static String nameWithoutStar(String name) {
    if (name.trim().isEmpty) return name.trim();
    return (name.trim().contains('*')
        ? name.trim().substring(0, (name.indexOf('*') - 1))
        : name.trim());
  }

  static double getPercentValue(double? percent) {
    if (percent == null) return 0.0;
    if (percent >= 0 && percent <= 1) {
      return percent;
    } else if (percent > 1) {
      return 1.0;
    } else {
      return 0.0;
    }
  }

  static double? calculatePercentage(
      {required double value1, required double value2}) {
    if (value2 > 0) {
      return (((value1 - value2) / value2) * 100);
    }
    if (value2 == 0) return null;
    return 0;
  }

  static String getMonthName(int value) {
    String text = '';
    switch (value) {
      case 1:
        text = 'JAN';
        break;
      case 2:
        text = 'FEB';
        break;
      case 3:
        text = 'MAR';
        break;
      case 4:
        text = 'APR';
        break;
      case 5:
        text = 'MAY';
        break;
      case 6:
        text = 'JUN';
        break;
      case 7:
        text = 'JUL';
        break;
      case 8:
        text = 'AUG';
        break;
      case 9:
        text = 'SEP';
        break;
      case 10:
        text = 'OCT';
        break;
      case 11:
        text = 'NOV';
        break;
      case 12:
        text = 'DEC';
        break;
      default:
        text = '';
        break;
    }
    return text;
  }
}

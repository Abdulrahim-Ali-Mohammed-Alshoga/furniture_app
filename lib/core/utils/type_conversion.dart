import 'dart:ui';

class TypesConversion {
  TypesConversion._();

  static double? valueTypeToDouble(dynamic value) {
    if (value is String) {
      if (value.isEmpty) {
        return null;
      }
      return double.parse(value);
    }

    if (value is int) {
      return value.toDouble();
    }
    return value;
  }

  static String? valueTypeToString(dynamic value) {
    if (value is int || value is double) {
      return value.toString();
    } else if (value is String) {
      return value.trim();
    }
    return value;
  }

  static DateTime? valueTypeToDateTime(dynamic value) {
    if (value != null && value is String) return DateTime.parse(value);
    return null;
  }

  static int? valueTypeToInt(dynamic value) {
    if (value is String) {
      if (value.isEmpty) return null;
      return int.parse(value);
    }

    if (value is double) {
      return value.toInt();
    }

    return value;
  }

  static bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  static bool valueTypeToBool(dynamic value, {bool defaultValue = false}) {
    bool? newValue;

    if (value is String) {
      newValue = value == '0' ? false : true;
    }

    if (value is int) {
      newValue = value == 0 ? false : true;
    }

    if (value is bool) {
      newValue = value;
    }

    return newValue ?? defaultValue;
  }

  static double roundIntoNDecimal(dynamic value) {
    return double.parse((value).toStringAsFixed(2));
  }

  static Color getColorFromHex(dynamic hexColor) {
    if (hexColor is String) {
      hexColor = hexColor.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
    }
    return Color(int.parse("0x$hexColor"));
  }

  static String getHexFromColor(Color color, {bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}';
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }
}

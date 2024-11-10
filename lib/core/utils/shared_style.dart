import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';


class SharedStyle {
  SharedStyle._();

  /// border radius
  static const BorderRadiusGeometry mainContainerBorderRadius =
      BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0));
  static const BorderRadius contentContainerBorderRadius =
      BorderRadius.all(Radius.circular(15.0));

  static drawerBorderRadius(bool isArabic) {
    if (isArabic) {
      return const BorderRadius.only(
          topLeft: Radius.circular(30), bottomLeft: Radius.circular(30));
    } else {
      return const BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30));
    }
  }

  static const BorderRadius settingsIconPadding =
      BorderRadius.all(Radius.circular(10.0));

  /// padding
  static EdgeInsetsGeometry mainContainerElementsPadding =
      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h);
  static EdgeInsetsGeometry contentContainerPadding =
      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.0.h);
  static const EdgeInsetsGeometry drawerPadding =
      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0);
  static const EdgeInsets requestItemPadding =
      EdgeInsets.symmetric(vertical: 10.0);

  /// textStyle
  // static TextStyle? mainTitleText =
  //     Get.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold);
  //
  // /// formBorders
  static var inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  );
  static var inputBorderAuth = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  );
  static const errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
  static var focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Get.theme.colorScheme.secondary, width: 2.0),
  );
  static const focusedErrorBuilder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  );
  // static TextStyle? loginLabelTextStyle = Get.textTheme.subtitle1;

  static BoxDecoration containerTextAndIconBoxDecoration({
    double radius = 4,
    Color color = Colors.grey,
    // Color borderColor = Colors.white,
  }) {
    return BoxDecoration(
      border: Border.all(width: 0, color: Colors.grey),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration containerBoxDecorationWithGradient({
    double radius = 20,
    Color color1 = AppColors.gradiant1,
    Color color2 = AppColors.gradiant2,
  }) {
    return BoxDecoration(
        gradient: LinearGradient(
            colors: [
              color1,
              color2,
            ],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
        border: Border.all(
          color: color1.withOpacity(0.1),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)));
  }

  static BoxDecoration authBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
        colors: [
          AppColors.gradiant1,
          AppColors.gradiant2,
        ],
        begin: FractionalOffset(0.0, 1.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
          color: Get.theme.shadowColor,
          blurRadius: 10,
          offset: const Offset(0, 5)),
    ],
    border: Border.all(
      color: AppColors.gradiant1.withOpacity(0.1),
    ),
  );
}

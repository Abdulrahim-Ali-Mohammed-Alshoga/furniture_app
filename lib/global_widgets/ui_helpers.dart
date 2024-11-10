import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class UiHelper {
  UiHelper._();

  static SizedBox horizontalSpaceTiny = SizedBox(width: 4.0.w);
  static SizedBox horizontalSpaceSmall = SizedBox(width: 8.0.w);
  static SizedBox horizontalSpaceMedium = SizedBox(width: 16.0.w);
  static SizedBox horizontalSpaceLarge = SizedBox(width: 24.0.w);
  static SizedBox horizontalSpaceMassive = SizedBox(width: 32.0.w);

  static SizedBox verticalSpaceTiny = SizedBox(height: 4.0.h);
  static SizedBox verticalSpaceSmall = SizedBox(height: 8.0.h);
  static SizedBox verticalSpaceMedium = SizedBox(height: 16.0.h);
  static SizedBox verticalSpaceLarge = SizedBox(height: 24.0.h);
  static SizedBox verticalSpaceMassive = SizedBox(height: 64.0.h);

  static SizedBox verticalSpace(double height) => SizedBox(height: height);

  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  static Divider columnDivider(
      {Color? color, double? height, double? indent, double? endIndent}) {
    return Divider(
      color: color ?? Get.theme.dividerColor,
      height: height,
      indent: indent,
      endIndent: endIndent,
    );
  }

  static Widget spaceDivider(
      {double? verticalPadding = 0, double? horizontalPadding = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0, horizontal: horizontalPadding ?? 0),
      child: Divider(
          color: Get.isDarkMode ? Colors.blueGrey.shade600 : Colors.black26,
          thickness: 0.5.h,
          height: 5.0),
    );
  }

  static const VerticalDivider rowDivider = VerticalDivider();
  static const SizedBox shrinkSizedBox = SizedBox.shrink();

  static Widget spinKitProgressIndicator({double size = 50.0, Color? color}) {
    return SpinKitFadingCircle(
      color: color ?? Get.theme.primaryColor,
      size: size,
      // lineWidth: 4.5,
    );
  }

  Widget spacedDivider = Column(
    children: <Widget>[
      verticalSpaceMedium,
      Divider(color: Colors.blueGrey, height: 5.0.h),
      verticalSpaceMedium,
    ],
  );

  static LinearProgressIndicator linearProgressIndicator =
      LinearProgressIndicator(
    backgroundColor: Colors.grey[300],
    valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
  );

// double screenHeightFraction(BuildContext context,
//         {int dividedBy = 1, double offsetBy = 0}) =>
//     (SizeConfig.screenHeight - offsetBy) / dividedBy;
//
// double screenWidthFraction(BuildContext context,
//         {int dividedBy = 1, double offsetBy = 0}) =>
//     (SizeConfig.screenWidth - offsetBy) / dividedBy;
}

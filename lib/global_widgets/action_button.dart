import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/resources/app_colors.dart';


class ActionButton extends StatelessWidget {
  final String text;
  final double? width, fontSize, height, vertical, horizontal, radius;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const ActionButton(
      {super.key,
      required this.text,
      this.borderColor,
      this.fontWeight,
      this.fontSize,
      this.radius,
      this.vertical,
      this.horizontal,
      this.height,
      this.width,
      this.backgroundColor,
      this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        minimumSize:
            MaterialStatePropertyAll(Size(width ?? 120.w, height ?? 10.h)),
        // fixedSize: MaterialStateProperty.all<Size>(
        //   Size(double.infinity, ),
        // ),

        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
              vertical: vertical ?? 10.h, horizontal: horizontal ?? 10.w),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor ??
              textColor?.withOpacity(0.2) ??
              Get.theme.colorScheme.secondary,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              side: BorderSide(
                  color: borderColor ?? Get.theme.scaffoldBackgroundColor,
                  strokeAlign: borderColor == null ? 1 : 0),
              borderRadius: BorderRadius.circular(radius?.r ?? 10.r)),
        ),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: FittedBox(
        child: Text(
          text,
          maxLines: 1,
          style: Get.textTheme.bodySmall?.copyWith(
              fontSize: fontSize ?? 11.sp,
              color: textColor ?? AppColors.mainLight,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontFamily: "Teshrin"),
        ),
      ),
    );
  }
}

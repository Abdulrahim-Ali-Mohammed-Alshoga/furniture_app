import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_styles.dart';

import '../core/resources/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final Function onPressed;

  final String title, image;
  final bool isSelected;

  const BottomNavItem(
      {super.key,
      required this.onPressed,
      required this.isSelected,
      required this.title,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected ? AppColors.tealSplash : AppColors.slateGray;
    return MaterialButton(
      minWidth: 0.w,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: isSelected ? 8.h : 7.h),
            child: Image.asset(image, color: color),
          ),
          Text(
            title,
            style: getMediumStyle(color: color, fontSize: AppFontSize.s12),
          ),
        ],
      ),
    );
  }
}

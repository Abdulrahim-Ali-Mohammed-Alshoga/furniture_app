import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_font.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_styles.dart';
import '../../../core/resources/app_values.dart';
import '../../../global_widgets/ui_helpers.dart ';

class ListTileSettingsWidget extends StatelessWidget {
  const ListTileSettingsWidget(
      {super.key, required this.iconImage, required this.title, this.subtitle});

  final String title, iconImage;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s56.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.s14.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
        child: Row(
          children: [
            Image.asset(
              iconImage,
              height: AppSize.s24.h,
              width: AppSize.s24.w,
              fit: BoxFit.fill,
            ),
            UiHelper.horizontalSpace(AppSize.s12.w),
            Text(
              title,
              style: getMediumStyle(color: AppColors.black, fontSize: AppFontSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}

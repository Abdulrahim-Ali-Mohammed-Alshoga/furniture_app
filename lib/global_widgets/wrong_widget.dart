
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/ui_helpers.dart%20';

import '../core/resources/app_colors.dart';
import '../core/resources/app_images.dart';
import '../core/resources/app_styles.dart';
import 'button_widget.dart';

class WrongWidget extends StatelessWidget {
  const WrongWidget({super.key, this.onTap});

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.wrong),
        UiHelper.verticalSpace(50.h),
        Text(
          'Something went wrong',
          style: getExtraBoldStyle(color: AppColors.card, fontSize: 20.sp),
        ),
        UiHelper.verticalSpace(80.h),
        Text(
          'Check for errors indicated by a red message, then refresh the page .',
          textAlign: TextAlign.center,
          style: getBoldStyle(color: AppColors.black, fontSize: 13.sp),
        ),
        UiHelper.verticalSpace(30.h),
        ButtonWidget(
          width: 190.w,
          height: 44.h,
          circular: 10.r,
          title: 'try again',
          style: getMediumStyle(color: AppColors.white, fontSize: 16.sp),
          onTap: onTap,
        ),
      ],
    );
  }
}

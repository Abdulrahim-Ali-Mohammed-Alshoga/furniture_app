
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/ui_helpers.dart%20';
import '../core/resources/app_colors.dart';
import '../core/resources/app_images.dart';
import '../core/resources/app_styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image:AssetImage(AppImages.empty)),
        UiHelper.verticalSpace(50.h),
        Text(
          'Empty',
          style: getExtraBoldStyle(color: AppColors.card, fontSize: 35.sp),
        ),
        UiHelper.verticalSpace(30.h),
        Text(
          'No data available',
          style: getBoldStyle(color: AppColors.black, fontSize: 18.sp),
        ),
      ],
    );
  }
}

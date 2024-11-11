import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_time_constants.dart';
import '../../../core/resources/app_values.dart';
import '../controllers/onboard_controller.dart';

class Indicator extends StatelessWidget {
  const Indicator(
      {super.key,
      required this.isActive,
      required this.numPages,
      required this.controller,
      required this.pageController});

  final bool isActive;
  final int numPages;

  final OnboardController controller;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.jumpToPage(numPages);
        controller.jumpToIndicator(numPages);
      },
      child: Container(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(
              milliseconds: AppTimeConstants.sliderAnimationTime),
          margin: EdgeInsets.symmetric(horizontal: AppSize.s4.w),
          height: AppSize.s8.h,
          width: AppSize.s8.w,
          decoration: BoxDecoration(
             shape: BoxShape.circle,
              color: isActive ? AppColors.tealSplash : AppColors.paleBlue,
        ),
        ),
      ),
    );
  }
}

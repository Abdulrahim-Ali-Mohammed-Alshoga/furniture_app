import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_values.dart';
import '../controllers/onboard_controller.dart';
import 'indicator_widget.dart';

class BuildPageIndicator extends StatelessWidget {
  const BuildPageIndicator(
      {super.key, required this.controller, required this.pageController});

  final OnboardController controller;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < controller.numPages; i++) {
      list.add(i == controller.currentPage
          ? Indicator(
              isActive: true,
              numPages: i,
              controller: controller,
              pageController: pageController,
            )
          : Indicator(
              isActive: false,
              numPages: i,
              controller: controller,
              pageController: pageController,
            ));
    }
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.s20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }
}

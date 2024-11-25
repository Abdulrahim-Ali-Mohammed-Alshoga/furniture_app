import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_colors.dart';
import 'package:furniture_app/core/resources/app_images.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:get/get.dart';
import '../../../global_widgets/bottom_app_bar_.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});

  static const String route = "/BottomNavBarView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.tealSplash,
        onPressed: () {},
        child: Image.asset(AppImages.eye),
      ),
      body: GetBuilder<BottomNavBarController>(builder: (c) {
        return IndexedStack(
          index: controller.currentTab,
          children: controller.pages,
        );
      }),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: AppSize.s12,

        child: BottomAppBarWidget(
          currentTab: controller.currentTab,
          onPressed: controller.jumpToView,
        ),
      ),
    );
  }


}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String route = '/SplashView';

  @override
  State<SplashView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Center(

          ),
        ),
      ),
    );
  }
}

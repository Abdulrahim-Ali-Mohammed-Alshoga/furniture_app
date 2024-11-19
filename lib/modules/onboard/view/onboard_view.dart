import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:get/get.dart';
import '../../../core/launguages_and_localization/app_strings.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_images.dart';
import '../../../core/resources/app_styles.dart';
import '../../../core/resources/app_time_constants.dart';
import '../../../core/resources/app_values.dart';
import '../../../global_widgets/action_button.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/onboard_controller.dart';
import '../widget/build_page_indicator.dart';
import '../widget/page_view_onboard.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  static const String route = '/OnBoardView';

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 10,
                    child: PageView(
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int page) {
                        controller.jumpToIndicator(page);
                      },
                      children: const [
                        PageViewOnboard(
                          image: AppImages.onboardingOne,
                          textOne:
                              'View And Exprience Furniture With The Help Of Augmented Reality ',
                        ),
                        PageViewOnboard(
                          image: AppImages.onboardingTwo,
                          textOne:
                              'Design Your Space With Augmented Reality By Creating Room',
                        ),
                        PageViewOnboard(
                            image: AppImages.onboardingThree,
                            textOne:
                                'Explore World Class Top Furnitures As Per Your Requirements & Choice'),
                      ],
                    ),
                  ),
                  BuildPageIndicator(
                    controller: controller,
                    pageController: _pageController,
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s22),
              child: controller.currentPage != controller.numPages - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                         onTap: () {
                           controller.goLoginView();
                         } ,
                          child: Text(
                            'Skip',
                            style: getMediumStyle(
                                color: AppColors.slateGray, fontSize: 16.sp),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(
                                    milliseconds:
                                        AppTimeConstants.nextPageAnimationTime),
                                curve: Curves.ease);
                          },
                          child: Container(
                            height: AppSize.s60.h,
                            width: AppSize.s60.w,
                            decoration: const BoxDecoration(
                                color: AppColors.tealSplash,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  : ActionButton(
                      width: double.infinity,
                      height: AppSize.s60.h,
                      onPressed: () => controller.goLoginView() ,
                      fontSize: AppFontSize.s16,
                      backgroundColor: AppColors.tealSplash,
                      text: AppStrings.getStarted.tr,
                    ),
            ),
            UiHelper.verticalSpace(AppSize.s30.h),
          ],
        ),
      ),
    );
  }
}

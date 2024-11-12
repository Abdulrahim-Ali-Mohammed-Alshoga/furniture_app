import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/modules/profile/widgets/list_tile_profile_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../core/resources/app_styles.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String route = '/ProfileView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        appBar: const AppBarWidget(
          isIconBack: false,
          title: 'Profile',
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight:  constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UiHelper.verticalSpaceLarge,
                          Container(
                            height: AppSize.s70.h,
                            width: AppSize.s70.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      AppImages.user,
                                    ),
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.cover),
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //     width: 3, color: AppColors.white)
                            ),
                          ),
                          Text(
                            'Abdulrahim ali Alshgaa',
                            style: getMediumStyle(
                                color: AppColors.black, fontSize: 20.sp),
                          ),
                          Text(
                            'abdalrhimalshgaa770907523@gmail.com',
                            style: getRegularStyle(
                                color: AppColors.slateGray, fontSize: 13.sp),
                          ),
                          UiHelper.verticalSpaceLarge,
                          const ListTileProfileWidget(
                              iconImage: AppImages.iconUser, title: 'Profile'),
                          UiHelper.verticalSpaceMedium,
                          const ListTileProfileWidget(
                              iconImage: AppImages.wallet,
                              title: 'Payment Methods'),
                          UiHelper.verticalSpaceMedium,
                          const ListTileProfileWidget(
                              iconImage: AppImages.archive,
                              title: 'Order history'),
                          UiHelper.verticalSpaceMedium,
                          const ListTileProfileWidget(
                              iconImage: AppImages.airPlane,
                              title: 'Delivery Address'),
                          UiHelper.verticalSpaceMedium,
                          const ListTileProfileWidget(
                              iconImage: AppImages.alignCenter,
                              title: 'Support Center'),
                          UiHelper.verticalSpaceMedium,
                          const ListTileProfileWidget(
                              iconImage: AppImages.security,
                              title: 'Legal Policy '),
                          UiHelper.verticalSpaceMedium,
                        ],
                      ),
                      Column(
                        children: [
                          Text('Log Out',style: getMediumStyle(fontSize: AppFontSize.s16,color: AppColors.vividRed),),UiHelper.verticalSpace(AppSize.s30.h)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

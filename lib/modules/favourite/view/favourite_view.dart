import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/core/utils/utils1/extensions.dart';
import 'package:furniture_app/global_widgets/auto_sized_text.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../core/resources/app_styles.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/favourite_controller.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  static const String route = '/FavouriteView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      builder: (controller) => Scaffold(
        appBar: const AppBarWidget(
          isIconBack: false,
          title: 'Favourite',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UiHelper.verticalSpaceLarge,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFurnitureList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppSize.s2,
                    mainAxisExtent: AppSize.s250.h,
                    mainAxisSpacing: AppSize.s16.h,
                    crossAxisSpacing: AppSize.s16.w),
                itemBuilder: (BuildContext context, int index) {
                  final furniture = controller.getFurnitureList[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              height: AppSize.s160.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s25.r),
                                  color: AppColors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: AppColors.shadowHomeColor
                                            .withOpacity(0.2),
                                        blurRadius: AppSize.s16,
                                        offset: const Offset(0, 6))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(furniture.image),
                                  UiHelper.verticalSpaceSmall,
                                ],
                              ),
                            ),
                            Positioned(
                                top: AppSize.s10.h,
                                right: AppSize.s12.w,
                                child: const Icon(
                                  Icons.favorite,
                                  color: AppColors.tealSplash,
                                ))
                          ],
                        ),
                        AutoSizedTextWidget(
                          text: furniture.name,
                          maxLines: AppSize.s2,
                          maxFontSize: AppFontSize.s16,
                          fontWeight: FontWeight.w500,
                        ),
                        Text(
                          furniture.price.toCurrencyString,
                          style: getMediumStyle(
                            color: AppColors.peachPrice,
                            fontSize: AppFontSize.s16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

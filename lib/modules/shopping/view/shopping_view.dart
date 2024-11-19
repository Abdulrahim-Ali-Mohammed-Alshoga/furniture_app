import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_colors.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_styles.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/core/utils/utils1/extensions.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../core/launguages_and_localization/app_strings.dart';
import '../../../global_widgets/action_button.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/shopping_controller.dart';
import '../widgets/list_tile_shopping_widget.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  static const String route = '/ShoppingView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingController>(
      builder: (controller) => Scaffold(
        appBar: const AppBarWidget(
          isClear: true,
          isIconBack: true,
          title: 'Shopping',
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: AppSize.s24.h),
                  itemCount: controller.furnitureList.length,
                  itemBuilder: (context, index) {
                    final furniture = controller.furnitureList[index];
                    return Column(
                      children: [
                        ListTileShoppingWidget(
                            image: furniture.image,
                            increases: () => controller.increases(index),
                            lower: () => controller.lower(index),
                            quantity: controller.quantity[index],
                            title: furniture.name,
                            manufacturer: furniture.manufacturer,
                            price: furniture.price.toCurrencyString),
                        UiHelper.verticalSpaceMedium,
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s24.r),
                    topRight: Radius.circular(AppSize.s24.r),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s24.w, vertical: AppSize.s24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: getMediumStyle(
                          color: AppColors.black, fontSize: AppFontSize.s16),
                    ),
                    UiHelper.verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: getRegularStyle(
                              color: AppColors.slateGray,
                              fontSize: AppFontSize.s16),
                        ),
                        Text(
                         controller.totalPrice.toCurrencyString,
                          style: getMediumStyle(
                              color: AppColors.peachPrice,
                              fontSize: AppFontSize.s16),
                        ),
                      ],
                    ),
                    UiHelper.verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Cost',
                          style: getRegularStyle(
                              color: AppColors.slateGray,
                              fontSize: AppFontSize.s16),
                        ),
                        Text(
                        controller.shippingCost.toCurrencyString,
                          style: getMediumStyle(
                              color: AppColors.peachPrice,
                              fontSize: AppFontSize.s16),
                        ),
                      ],
                    ),
                    UiHelper.verticalSpaceSmall,
                    const Divider(
                      color: AppColors.slateGray,
                    ),
                    UiHelper.verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total payment',
                          style: getBoldStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.s16),
                        ),
                        Text(
                          controller.totalPayment.toCurrencyString,
                          style: getMediumStyle(
                              color: AppColors.peachPrice,
                              fontSize: AppFontSize.s16),
                        ),
                      ],
                    ),
                    UiHelper.verticalSpaceLarge,
                    ActionButton(
                      width: double.infinity,
                      height: AppSize.s60.h,
                      onPressed: () {},
                      fontSize: 16.sp,
                      backgroundColor: AppColors.tealSplash,
                      text: AppStrings.getStarted.tr,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

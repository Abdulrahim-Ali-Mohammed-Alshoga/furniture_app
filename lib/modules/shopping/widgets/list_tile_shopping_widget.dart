import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_images.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_styles.dart';
import '../../../core/resources/app_values.dart';
import '../../../global_widgets/ui_helpers.dart ';

class ListTileShoppingWidget extends StatelessWidget {
  const ListTileShoppingWidget(
      {super.key,
      required this.image,
      required this.title,
      this.subtitle,
      required this.price,
      required this.manufacturer,
      required this.quantity,
      required this.increases,
      required this.lower});

  final String title, manufacturer, image, price;
  final Widget? subtitle;
  final int quantity;
  final GestureTapCallback? increases, lower;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.s14.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s16.w, vertical: AppSize.s12.h),
        child: SizedBox(
          height: AppSize.s70.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: AppSize.s70.w,
                height: AppSize.s70.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainLight,
                    borderRadius: BorderRadius.circular(AppSize.s12.r)),
                child: Image.asset(
                  image,
                  width: AppSize.s37.w,
                  height: AppSize.s46.h,
                  fit: BoxFit.fill,
                ),
              ),
              UiHelper.horizontalSpace(AppSize.s12.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: getRegularStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.s14),
                        ),
                        Text(
                          manufacturer,
                          style: getRegularStyle(
                              color: AppColors.slateGray,
                              fontSize: AppFontSize.s12),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: getMediumStyle(
                          color: AppColors.peachPrice,
                          fontSize: AppFontSize.s14),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: lower,
                child: Container(
                  width: AppSize.s22.w,
                  height: AppSize.s22.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: AppColors.mainLight, shape: BoxShape.circle),
                  child: Icon(
                    Icons.remove,
                    size: AppSize.s15.h,
                  ),
                ),
              ),
              UiHelper.horizontalSpaceSmall,
              Text(
                quantity.toString(),
                style: getRegularStyle(
                    color: AppColors.black, fontSize: AppFontSize.s14),
              ),
              UiHelper.horizontalSpaceSmall,
              GestureDetector(
                onTap: increases,
                child: Container(
                  width: AppSize.s22.w,
                  height: AppSize.s22.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: AppColors.tealSplash, shape: BoxShape.circle),
                  child: Icon(
                    Icons.add,
                    size: AppSize.s15.h,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_images.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_styles.dart';
import '../../../core/resources/app_values.dart';
import '../../../global_widgets/ui_helpers.dart ';

class ListTileNotificationsWidget extends StatelessWidget {
  const ListTileNotificationsWidget(
      {super.key,
      required this.image,
      required this.title,
      this.subtitle,
      required this.time});

  final String title, image, time;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Slidable(

      endActionPane: ActionPane(extentRatio: .22, motion: const ScrollMotion(), children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,

             height: AppSize.s50.h,
             decoration: const BoxDecoration(
               color: AppColors.lightGray,
               shape: BoxShape.circle
             ),
             width: AppSize.s50.w,
             child: Image.asset(AppImages.iconDelete,color: Colors.red,),
            ),
          ),
        )
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.s14.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.s16.w, vertical: AppSize.s12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getRegularStyle(
                          color: AppColors.black, fontSize: AppFontSize.s14),
                    ),
                    Text(
                      time,
                      style: getRegularStyle(
                          color: AppColors.slateGray,
                          fontSize: AppFontSize.s13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

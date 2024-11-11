import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/ui_helpers.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_font.dart';
import '../../../core/resources/app_styles.dart';
import '../../../core/resources/app_values.dart';
import '../../../global_widgets/auto_sized_text.dart';

class PageViewOnboard extends StatelessWidget {
  const PageViewOnboard({
    super.key,
    required this.image,
    required this.textOne,
  });

  final String image;
  final String textOne;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: AppSize.s360.h,
        ),
        UiHelper.verticalSpace(AppSize.s40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s50.w),
          child: AutoSizedTextWidget(
            text: textOne,
            textAlign: TextAlign.center,
            maxFontSize: 21.sp,
            maxLines: 3,
            style: getBoldStyle(
              color: AppColors.black,
              fontSize: AppFontSize.s19,
            ),
          ),
        )
      ],
    );
  }
}

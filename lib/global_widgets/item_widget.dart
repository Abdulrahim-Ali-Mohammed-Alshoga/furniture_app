import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_styles.dart';
import '../../../../global_widgets/ui_helpers.dart ';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key, required this.title, this.subTitle, this.color, this.child});

  final String title;
  final Color? color;
  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "$title:",
          style: getBoldStyle(color: AppColors.black, fontSize: 12.sp),
        ),
        UiHelper.horizontalSpaceSmall,
        child ??
            Visibility(
              visible: subTitle!.isNotEmpty,
              child: Expanded(

                child: Text(

                  subTitle!,
                  style: getRegularStyle(
                      color: color ?? AppColors.black.withOpacity(.7),
                      fontSize: 12.sp),
                ),
              ),
            ),
      ],
    );
  }
}

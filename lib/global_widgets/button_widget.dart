import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/ui_helpers.dart%20';

import '../core/resources/app_colors.dart';
import '../core/resources/app_styles.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {super.key,
      required this.title,
      this.height,
      this.width,
      this.onTap,
      this.style,
      this.icon,
      this.horizontalSpace,
      this.isRight = true,
      this.color,
      this.circular = 32});

  final String title;
  final bool isRight;

  final double? horizontalSpace;
  final double circular;
  final double? width, height;
  final TextStyle? style;
  final Widget? icon;
  final GestureTapCallback? onTap;
  final Color? color;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color ?? AppColors.blue,
            borderRadius: BorderRadius.circular(widget.circular)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!widget.isRight) widget.icon ?? const SizedBox(),
            Text(
              widget.title,
              style: widget.style ??
                  getMediumStyle(color: AppColors.white, fontSize: 16.sp),
            ),
            UiHelper.horizontalSpace(widget.horizontalSpace ?? 8.w),
            if (widget.isRight) widget.icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

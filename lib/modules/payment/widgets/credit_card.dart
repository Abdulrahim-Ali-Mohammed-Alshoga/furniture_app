import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_colors.dart';
import 'package:furniture_app/core/resources/app_font.dart';
import 'package:furniture_app/core/resources/app_images.dart';
import 'package:furniture_app/core/resources/app_styles.dart';
import 'package:furniture_app/core/resources/app_values.dart';

class CreditCard extends StatefulWidget {
  const CreditCard(
      {super.key,
      required this.cardNumber,
      required this.expDate,
      required this.horizontalDrag,
      required this.cVC, required this.typeCardName, required this.typeCardImage});

  final String cardNumber, expDate, cVC,typeCardImage,typeCardName;
  final double horizontalDrag;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double horizontalDrag = 0;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // المدة الزمنية للأنميشن
      vsync: this,
    );

    // الاستماع لتحديثات الأنميشن
    _animation =
        Tween<double>(begin: horizontalDrag, end: horizontalDrag).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _animation.addListener(() {
      setState(() {
        horizontalDrag = _animation.value;
      });
    });
  }

  @override
  void didUpdateWidget(CreditCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // تحقق إذا كانت القيمة المستهدفة هي 180
    if (widget.horizontalDrag == 180) {
      _animation =
          Tween<double>(begin: horizontalDrag, end: widget.horizontalDrag)
              .animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

      _controller
        ..reset()
        ..forward(); // تشغيل الأنميشن
    }
    if (widget.horizontalDrag == 0) {
      _animation =
          Tween<double>(begin: horizontalDrag, end: widget.horizontalDrag)
              .animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

      _controller
        ..reset()
        ..forward(); // تشغيل الأنميشن
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onHorizontalDragUpdate: (horizontal) {
        setState(() {
          horizontalDrag += horizontal.delta.dx;
          horizontalDrag %= 360;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi / 180 * horizontalDrag),
        alignment: Alignment.center,
        child: Container(
          height: AppSize.s180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                const Color(0xff0C738A),
                const Color(0xff1D3E64).withOpacity(.92),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: horizontalDrag <= 90 || horizontalDrag >= 270
              ? cardFront()
              : cardBack(),
        ),
      ),
    );
  }

  Widget cardFront() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s24.h, horizontal: AppSize.s24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Mansurul hoque',
                style: getBoldStyle(
                  color: AppColors.white,
                  fontSize: AppFontSize.s16,
                ),
              ),
              Image.asset(
              widget.typeCardImage
              )
            ],
          ),
          Text(
            widget.cardNumber.isNotEmpty
                ? widget.cardNumber
                : '**** **** **** ****',
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: AppFontSize.s18,
                wordSpacing: 15,
                shadows: const [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.black,
                    offset: Offset(2, 1.5),
                  )
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exp date',
                        style: getRegularStyle(
                          color: AppColors.cadetBlue,
                          fontSize: AppFontSize.s11,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s2.h,
                      ),
                      Text(
                        widget.expDate.isNotEmpty ? widget.expDate : 'MM/YY',
                        style: getMediumStyle(
                          color: AppColors.white,
                          fontSize: AppFontSize.s11,
                        ),
                      ),
                    ],
                  ),
                  // UiHelper.horizontalSpaceLarge,
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'CVC number',
                  //       style: getRegularStyle(
                  //         color: AppColors.cadetBlue,
                  //         fontSize: AppFontSize.s11,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: AppSize.s2.h,
                  //     ),
                  //     Text(
                  //       '962',
                  //       style: getMediumStyle(
                  //         color: AppColors.white,
                  //         fontSize: AppFontSize.s11,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              Text(
                widget.typeCardName,
                style: getMediumStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSize.s11,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget cardBack() {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: AppSize.s90.w,
                height: AppSize.s30.h,
                color: AppColors.white,
                alignment: Alignment.centerRight,

                child: Text(
                  widget.cVC,

                  style: getBoldStyle(
                      color: AppColors.black, fontSize: AppFontSize.s22,letterSpacing: 5),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

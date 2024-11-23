import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/core/utils/utils1/extensions.dart';
import 'package:furniture_app/global_widgets/form_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_styles.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../../global_widgets/ui_helpers.dart ';
import '../../../core/resources/app_font.dart';
import '../../../global_widgets/action_button.dart';
import '../controllers/payment_controller.dart';
import '../widgets/credit_card.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  static const String route = '/PaymentView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) => Scaffold(
        extendBody: true,
          appBar: const AppBarWidget(
            isIconBack: true,
            title: 'Payment',
          ),
          body: FormBuilder(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s22.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.verticalSpace(AppSize.s30.h),
                          Text(
                            'Choose payment method',
                            style: getMediumStyle(
                                color: AppColors.black, fontSize: 13.sp),
                          ),UiHelper.verticalSpace(AppSize.s20.h),
                          Row(
                            children: List.generate(
                              controller.imagesPayment.length,
                                  (index) => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.changeSelectImage(index),
                                    child: Container(
                                        width: AppSize.s60.w,
                                        height: AppSize.s46.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            border: controller.selectImage==index?Border.all(
                                                width: 1.5,
                                                color: Color(0xff1D3E64)
                                            ):null,
                                            borderRadius: BorderRadius.circular(AppSize.s12.r)
                                        ),
                                        child:
                                        Image.asset(controller.imagesPayment[index])),
                                  ),
                                  UiHelper.horizontalSpaceMedium
                                ],
                              ),
                            ),
                          ),
                          UiHelper.verticalSpaceLarge,
                          CreditCard(
                            typeCardImage: controller.imagesPayment[controller.selectImage],
                            typeCardName: controller.selectTypeCard,
                            horizontalDrag: controller.horizontalDrag,
                            cardNumber: controller.formatted,
                            cVC: controller.formattedCVC,
                            expDate: controller.formattedExpDate,
                          ),
                        UiHelper.verticalSpaceLarge,
                          Text(
                            'Card Number',
                            style: getMediumStyle(
                                color: AppColors.black, fontSize: 13.sp),
                          ),
                          UiHelper.verticalSpace(AppSize.s8.h),
                          InputTextFieldWidget(
                            onTap: () {
                              controller.setHorizontalDrag(0);
                            },
                            maxLines: 1,

                            obscureText: true,
                            controller: controller.cardNumberController,
                            textInputType: TextInputType.number,
                            onChanged: (value) => controller.formatText(value!),
                            keyName: 'Enter Card Number',
                            hintText: 'Enter Card Number',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              // فقط الأرقام
                              LengthLimitingTextInputFormatter(16),
                              // تحديد الطول إلى 16 رقم
                            ],
                            textInputAction: TextInputAction.next,
                            hintStyle: getRegularStyle(
                                color: AppColors.slateGray, fontSize: 14.sp),
                            isFill: true,
                            fillColor: AppColors.white,
                          ),
                          UiHelper.verticalSpaceLarge,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expired Date',
                                      style: getMediumStyle(
                                          color: AppColors.black, fontSize: 13.sp),
                                    ),
                                    UiHelper.verticalSpace(AppSize.s8.h),
                                    InputTextFieldWidget(
                                      controller: controller.expDateController,
                                      textInputType: TextInputType.number,
                                      onTap: () {
                                        controller.setHorizontalDrag(0);
                                      },
                                      onChanged: (value) =>
                                          controller.formatTextExpDate(value!),
                                      keyName: 'Card Number',
                                      hintText: 'Expired',
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      textInputAction: TextInputAction.next,
                                      hintStyle: getRegularStyle(
                                          color: AppColors.slateGray,
                                          fontSize: 14.sp),
                                      isFill: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                              UiHelper.horizontalSpaceLarge,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CVC Number',

                                      style: getMediumStyle(
                                          color: AppColors.black, fontSize: 13.sp),
                                    ),
                                    UiHelper.verticalSpace(AppSize.s8.h),
                                    InputTextFieldWidget(
                                      textInputType: TextInputType.number,
                                      onTap: () {
                                        controller.setHorizontalDrag(180);
                                      },
                                      controller: controller.cVCController,
                                      obscureText: true,
                                      maxLines: 1,
                                      onChanged: (value) =>
                                          controller.changeTextForStars(value!),
                                      keyName: 'CVC Number',
                                      hintText: 'CVC',
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      textInputAction: TextInputAction.next,
                                      hintStyle: getRegularStyle(
                                          color: AppColors.slateGray,
                                          fontSize: 14.sp),
                                      isFill: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          UiHelper.verticalSpaceTiny,
                        ],
                      ),
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total payment',
                              style: getMediumStyle(
                                  color: AppColors.black,
                                  fontSize: AppFontSize.s18),
                            ),
                            Text(
                              86.680.toCurrencyString,
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
                          fontSize: AppFontSize.s16,
                          backgroundColor: AppColors.tealSplash,
                          text: 'payment',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/global_widgets/form_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_styles.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../../global_widgets/button_widget.dart';
import '../../../../global_widgets/form_widgets/password_input.dart';
import '../../../../global_widgets/ui_helpers.dart ';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static const String route = '/ForgotPasswordView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) => Scaffold(
          appBar: const AppBarWidget(
            isIconBack: true,
            title: 'Forgot Password',
          ),
          body: FormBuilder(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s22.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.verticalSpace(AppSize.s30.h),
                    UiHelper.verticalSpaceMedium,
                    PasswordInput(
                      isSignUp: true,
                      keyName: 'x',
                      fillColor: AppColors.white,
                      isFill: true,
                      controller: controller.passwordController,
                      hintText: 'Enter your password',
                      confirmHint: 'Enter your confirm password',
                      textInputAction: TextInputAction.done,
                      hintStyle: getRegularStyle(
                          color: AppColors.slateGray, fontSize: 14.sp),
                    ),
                    UiHelper.verticalSpace(40.h),
                    ButtonWidget(
                      circular: AppSize.s14.r,
                      color: AppColors.tealSplash,
                      title: 'Change Password',
                      height: AppSize.s60.h,
                      onTap: () => controller.changePassword(),
                    ),
                    UiHelper.verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

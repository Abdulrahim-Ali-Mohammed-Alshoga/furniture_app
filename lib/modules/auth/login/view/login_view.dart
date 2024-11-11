import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/form_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../core/resources/app_styles.dart';
import '../../../../global_widgets/button_widget.dart';
import '../../../../global_widgets/form_widgets/password_input.dart';
import '../../../../global_widgets/ui_helpers.dart ';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String route = '/LoginView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: FormBuilder(
          key: controller.formKey,
          autovalidateMode: controller.autoValidateMode,
          child: Column(
            children: [
              UiHelper.verticalSpace(80.h),
              InputTextFieldWidget(
                keyName: 'c',
                hintText: 'User Name',
                controller: controller.emailController,
                textInputAction: TextInputAction.next,
                hintStyle: getSemiBoldStyle(
                    color: AppColors.textStyle, fontSize: 14.sp),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 12.w),
                  child: Icon(
                    Icons.mail_outline,
                    color: AppColors.blue,
                    size: 22.h,
                  ),
                ),
              ),
              UiHelper.verticalSpaceMedium,
              PasswordInput(
                keyName: 'x', isFill: false,
                controller: controller.passwordController,
                hintText: 'Password',
                textInputAction: TextInputAction.done,
                hintStyle: getSemiBoldStyle(
                    color: AppColors.textStyle, fontSize: 14.sp),
              ),
              UiHelper.verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: controller.isCheck,
                        onChanged: (value) => controller.changeCheck(),
                      ),
                      Text(
                        'Remember me',
                        style: getSemiBoldStyle(
                            color: AppColors.textStyle, fontSize: 12.sp),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () => controller.goForgetPasswordView(),
                    child: Text(
                      'Forget Password?',
                      style: getSemiBoldStyle(
                          color: AppColors.blue, fontSize: 12.sp),
                    ),
                  )
                ],
              ),
              UiHelper.verticalSpace(40.h),
              ButtonWidget(
                title: 'Login',
                onTap: () => controller.goHomeView(),
              ),
              const Spacer(),

              UiHelper.verticalSpace(50.h)
            ],
          ),
        )
      ),
    );
  }
}

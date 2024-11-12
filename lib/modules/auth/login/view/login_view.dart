import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/global_widgets/form_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';
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
      builder: (controller) =>
          Scaffold(
              body: FormBuilder(
                key: controller.formKey,
                autovalidateMode: controller.autoValidateMode,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s22.w),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    UiHelper.verticalSpace(AppSize.s140.h),
                    Text(
                      controller.isSingIn ? 'Welcome Back' : 'Create Account',
                      style: getBoldStyle(
                          color: AppColors.black, fontSize: 32.sp),
                    ),
                    Text(
                      controller.isSingIn
                          ? 'Welcome Back! Please Enter Your Details.'
                          : 'Let’s create account together',
                      style: getRegularStyle(
                          color: AppColors.slateGray, fontSize: 15.sp),
                    ),
                    UiHelper.verticalSpace(AppSize.s30.h),
                    AnimatedOpacity(
                      opacity: controller.isSingIn ? 0.0:1.0  ,

                      duration: const Duration(milliseconds: 400),

                      child: AnimatedSize(
                          duration: const Duration(milliseconds: 400),

                          curve: Curves.easeInOut,
                          child: controller.isSingIn
                              ? const SizedBox.shrink() : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Full Name',
                                style: getMediumStyle(
                                    color: AppColors.black, fontSize: 13.sp),
                              ),
                              UiHelper.verticalSpace(AppSize.s8.h),
                              InputTextFieldWidget(
                                keyName: 'c',
                                hintText: 'Enter your Name',
                                controller: controller.emailController,
                                textInputAction: TextInputAction.next,
                                hintStyle: getRegularStyle(
                                    color: AppColors.slateGray, fontSize: 14.sp),
                                isFill: true,
                                fillColor: AppColors.white,
                              ),
                            ],
                          ))),
                      Text(
                        'Email',
                        style: getMediumStyle(
                            color: AppColors.black, fontSize: 13.sp),
                      ),
                      UiHelper.verticalSpace(AppSize.s8.h),
                      InputTextFieldWidget(
                        keyName: 'c',
                        hintText: 'Enter your email',
                        controller: controller.emailController,
                        textInputAction: TextInputAction.next,
                        hintStyle: getRegularStyle(
                            color: AppColors.slateGray, fontSize: 14.sp),
                        isFill: true,
                        fillColor: AppColors.white,
                      ),
                      UiHelper.verticalSpaceMedium,
                      Text(
                        'Password',
                        style: getMediumStyle(
                            color: AppColors.black, fontSize: 13.sp),
                      ),
                      UiHelper.verticalSpace(AppSize.s8.h),
                      PasswordInput(
                        keyName: 'x',
                        fillColor: AppColors.white,
                        isFill: true,
                        controller: controller.passwordController,
                        hintText: 'Enter your password',
                        textInputAction: TextInputAction.done,
                        hintStyle: getRegularStyle(
                            color: AppColors.slateGray, fontSize: 14.sp),
                      ),
                      UiHelper.verticalSpaceMedium,
                      AnimatedOpacity(
                        opacity: controller.isSingIn ? 1.0 : 0.0,

                        duration: const Duration(milliseconds: 400),

                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 400),

                          curve: Curves.easeInOut,

                          child: controller.isSingIn
                              ? Row(
                            key: const ValueKey('signInRow'),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: AppSize.s14.h,
                                    width: AppSize.s20.w,
                                    child: Checkbox(
                                      value: controller.isCheck,
                                      onChanged: (value) =>
                                          controller.changeCheck(),
                                    ),
                                  ),
                                  UiHelper.horizontalSpace(AppSize.s5.w),
                                  Text(
                                    'Remember For 30 Days',
                                    style: getRegularStyle(
                                        color: AppColors.slateGray,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => controller.goForgetPasswordView(),
                                child: Text(
                                  'Forgot password',
                                  style: getRegularStyle(
                                      color: AppColors.black, fontSize: 13.sp),
                                ),
                              ),
                            ],
                          )
                              : const SizedBox
                              .shrink(),
                        ),
                      )
                      ,
                      UiHelper.verticalSpace(40.h),
                      ButtonWidget(
                        circular: AppSize.s14.r,
                        color: AppColors.tealSplash,
                        title: controller.isSingIn ? 'Login' : 'Sign Up',
                        height: AppSize.s60.h,
                        onTap: () => controller.goHomeView(),
                      ),
                      UiHelper.verticalSpaceMedium,
                      ButtonWidget(
                        circular: AppSize.s14.r,
                        color: AppColors.white,
                        style: getMediumStyle(
                            color: AppColors.black, fontSize: 16.sp),
                        title: 'Sign in with google',
                        height: AppSize.s60.h,
                        onTap: () => controller.goHomeView(),
                      ),
                      UiHelper.verticalSpaceLarge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.isSingIn
                                ? 'Don’t have an account?'
                                : 'Already have an account?',
                            style: getRegularStyle(
                                color: AppColors.slateGray, fontSize: 13.sp),
                          ),
                          GestureDetector(
                            onTap: () => controller.changePage(),
                            child: Text(
                              controller.isSingIn
                                  ? 'Sign Up for free'
                                  : 'Sign in',
                              style: getMediumStyle(
                                  color: AppColors.black, fontSize: 13.sp),
                            ),
                          ),
                        ],
                      )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furniture_app/modules/auth/forgot_password/view/forgot_password_view.dart';
import 'package:furniture_app/modules/notifications/view/notifications_view.dart';
import 'package:furniture_app/modules/popular/view/popular_view.dart';
import 'package:furniture_app/modules/profile/view/profile_view.dart';
import 'package:furniture_app/modules/shopping/view/shopping_view.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';
import '../../../payment/view/payment_view.dart';
import '../../../settings/view/settings_view.dart';

class LoginController extends BaseController {
  /// general variables
  bool isCheck = false;

  bool supportState = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isSingIn = true;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
  }

  changeCheck() {
    isCheck = !isCheck;
    update();
  }



  changePage() {
    isSingIn = !isSingIn;
    update();
  }

  goHomeView() {
    Get.focusScope?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(PaymentView.route);
    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  } goForgotPasswordView() {
    Get.focusScope?.unfocus();

      Get.toNamed(ForgotPasswordView.route);

  }
}

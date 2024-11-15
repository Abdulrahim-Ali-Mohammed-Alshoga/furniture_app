import 'package:flutter/material.dart';
import 'package:furniture_app/modules/notifications/view/notifications_view.dart';
import 'package:furniture_app/modules/popular/view/popular_view.dart';
import 'package:furniture_app/modules/profile/view/profile_view.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';
import '../../../settings/view/settings_view.dart';

class LoginController extends BaseController {
  /// general variables
  bool isCheck = false;

  bool supportState = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
bool isSingIn=true;

  @override
  void onInit() async {
    // TODO: implement onInit



    super.onInit();

  }

  changeCheck() {
    isCheck = !isCheck;
    update();
  }

  goForgetPasswordView() {
   // Get.toNamed(ForgetPasswordView.route);
  }
  changePage() {
    isSingIn = !isSingIn;
    update();
  }
  goHomeView() {
    Get.focusScope?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
Get.offAllNamed(PopularView.route) ;
    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }





}

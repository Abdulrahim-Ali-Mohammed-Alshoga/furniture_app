import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';

class ForgotPasswordController extends BaseController {
  /// general variables



  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
  }





  changePassword() {
    Get.focusScope?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      Get.back();
    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}

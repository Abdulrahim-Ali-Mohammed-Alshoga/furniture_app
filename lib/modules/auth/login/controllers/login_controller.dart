import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';
import '../repository/login_repository.dart';

class LoginController extends BaseController {
  /// general variables
  bool isCheck = false;

  bool supportState = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();


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

  goHomeView() {
    Get.focusScope?.unfocus();
    if (formKey.currentState?.validate() ?? false) {

    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }





}

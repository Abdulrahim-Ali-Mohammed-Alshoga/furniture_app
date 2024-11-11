import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';
import '../repository/login_repository.dart';

class LoginController extends BaseController with GetSingleTickerProviderStateMixin{
  /// general variables
  bool isCheck = false;

  bool supportState = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
bool isSingIn=true;
  late AnimationController animationController;
  @override
  void onInit() async {
    // TODO: implement onInit



    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
    vsync: this
    );
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

    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }





}

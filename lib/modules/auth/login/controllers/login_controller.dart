import 'package:flutter/material.dart';
import 'package:furniture_app/modules/favourite/view/favourite_view.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';
import '../../../profile/view/profile_view.dart';
import '../repository/login_repository.dart';

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
Get.offAllNamed(FavouriteView.route) ;
    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }





}

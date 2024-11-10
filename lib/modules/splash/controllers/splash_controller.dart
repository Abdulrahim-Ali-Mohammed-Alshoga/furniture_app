
import 'package:get/get.dart';

import '../../../data/base_controllers/base_controller.dart';

class SplashController extends BaseController {
  /// general variables


  @override
  void onInit() async {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    super.onInit();navigate();
  }

  void navigate() async {
    Future.delayed(const Duration(milliseconds: 1200), () async {
      // if (HelperMethods.noInternetConnection()) {
      //
      //   GetSnackBar(
      //     message: AppStrings.internetConnectionError.tr,
      //     isDismissible: false,
      //     backgroundColor: Get.theme.colorScheme.secondary,
      //   ).show();
      //
      //   return;
      // }
      // Get.offAllNamed(DisplayProductView.route);
    });
  }
}

import 'package:get/get.dart';

import '../../data/base_controllers/base_controller.dart';
class HomeController extends BaseController {
  /// general variables



  @override
  void onInit() {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    super.onInit();
  }

  goView(String nameView) {
    Get.toNamed(nameView);
  }
}

import 'package:furniture_app/modules/auth/login/view/login_view.dart';
import 'package:get/get.dart';

import '../../../data/base_controllers/base_controller.dart';

class OnboardController extends BaseController {
  /// general variables
  final int  numPages = 3;
    int  currentPage = 0;
  @override
  void onInit() {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    super.onInit();
  }
   jumpToIndicator(int numberPages){
      currentPage = numberPages;
      update();
   }
goLoginView(){
    Get.offAllNamed(LoginView.route);
}

}

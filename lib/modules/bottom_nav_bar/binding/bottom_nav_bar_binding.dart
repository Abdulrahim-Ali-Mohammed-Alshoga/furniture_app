


import 'package:furniture_app/modules/favourite/controllers/favourite_controller.dart';
import 'package:furniture_app/modules/profile/controllers/profile_controller.dart';
import 'package:furniture_app/modules/shopping/controllers/shopping_controller.dart';
import 'package:get/get.dart';


import '../../../home/controllers/home_controller.dart';
import '../controller/bottom_nav_bar_controller.dart';

class  BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
      Get.lazyPut(() => HomeController());
     Get.lazyPut(() =>FavouriteController());

  }
}

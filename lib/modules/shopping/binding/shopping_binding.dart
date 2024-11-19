import 'package:furniture_app/modules/shopping/controllers/shopping_controller.dart';
import 'package:get/get.dart';




class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingController());
  }
}

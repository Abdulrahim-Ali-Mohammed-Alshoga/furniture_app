import 'package:get/get.dart';

import '../controllers/popular_controller.dart';



class PopularBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularController());
  }
}

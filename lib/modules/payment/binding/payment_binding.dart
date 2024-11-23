import 'package:furniture_app/modules/payment/controllers/payment_controller.dart';
import 'package:get/get.dart';


class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>PaymentController());
  }
}

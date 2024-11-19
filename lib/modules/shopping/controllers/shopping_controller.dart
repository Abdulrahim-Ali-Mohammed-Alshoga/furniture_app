import 'package:furniture_app/data/models/furniture_model.dart';

import '../../../../data/base_controllers/base_controller.dart';
import '../../../core/resources/app_images.dart';

class ShoppingController extends BaseController {
  /// general variables
  List<FurnitureModel> furnitureList = [
    FurnitureModel(
        image: AppImages.chair1,
        name: 'Levi Armchair',
        manufacturer: 'Cultured White',
        price: 39.00),
    FurnitureModel(
        image: AppImages.chair3,
        name: 'Hiro Armchair',
        manufacturer: 'Cultured White',
        price: 29.54),
    FurnitureModel(
        image: AppImages.chair5,
        name: 'Slipcove Armchair',
        manufacturer: 'Hatil-Loren',
        price: 32.8),
  ];
  double totalPrice = 0;
  double totalPayment = 0;
  double shippingCost = 20.60;
  List<int> quantity = [];

  @override
  void onInit() {
    // TODO: implement onInit
    //pageController.addListener(_handlePageChange);

    super.onInit();
    quantity = List.filled(furnitureList.length, 1);
    calculateTotalPrice();
  }
  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (int i = 0; i < furnitureList.length; i++) {
      totalPrice += furnitureList[i].price * quantity[i];
    }
    totalPayment=totalPrice+shippingCost;
    update();
  }
  lower(int index) {
    --quantity[index];
    calculateTotalPrice();
  }

  increases(int index) {
    ++quantity[index];
    calculateTotalPrice();

  }
}

import 'package:furniture_app/data/models/furniture_model.dart';

import '../../../../data/base_controllers/base_controller.dart';
import '../../../core/resources/app_images.dart';

class PopularController extends BaseController {
  /// general variables
  List<FurnitureModel> furnitureList = [
    FurnitureModel(
        image: AppImages.chair7,
        name: 'Levi Armchair',
        manufacturer: 'Cultured White',
        price: 39.00),
    FurnitureModel(
        image: AppImages.chair6,
        name: 'Hiro Armchair',
        manufacturer: 'Cultured White',
        price: 29.54),
    FurnitureModel(
        image: AppImages.chair5,
        name: 'Slipcove Armchair',
        manufacturer: 'Hatil-Loren',
        price: 32.8),
    FurnitureModel(
        image: AppImages.chair4,
        name: 'Rose Armchair',
        manufacturer: 'Regal Furniture',
        price: 45.90),
    FurnitureModel(
        image: AppImages.chair2,
        name: 'Besen Egge Chair',
        manufacturer: 'Partex Furniture',
        price: 26.90),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    //pageController.addListener(_handlePageChange);

    super.onInit();
  }
}

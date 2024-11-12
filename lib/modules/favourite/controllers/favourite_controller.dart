
import '../../../../data/base_controllers/base_controller.dart';
import '../../../data/models/furniture_model.dart';
class FavouriteController extends BaseController {
  /// general variables
  List<FurnitureModel> getFurnitureList=[];

  @override
  void onInit() {
    // TODO: implement onInit
    //pageController.addListener(_handlePageChange);

    super.onInit();
    getFurnitureList=getFurniture;
  }






}

import 'package:furniture_app/modules/notifications/repository/notifications_repository.dart';

import '../../../../data/base_controllers/base_controller.dart';
import '../../../data/models/notifications_model.dart';

class NotificationsController extends BaseController {
  /// general variables
  List<NotificationsModel> notificationList = [];
  final NotificationsRepository _repository = NotificationsRepository.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    //pageController.addListener(_handlePageChange);

    super.onInit();
    notificationList.addAll(_repository.retrieveNotifications());
  }
}

import 'package:furniture_app/data/models/notifications_model.dart';

import '../../../core/resources/app_images.dart';

class NotificationsRepository {
  NotificationsRepository._();

  // final StockApi _api = StockApi.instance;

  static final NotificationsRepository _instance = NotificationsRepository._();

  static NotificationsRepository get instance => _instance;
  retrieveNotifications(){
    return [
      NotificationsModel(
          image: AppImages.chair2,
          title: 'special offer on bean upto 46% off all the products',
        time: '10 minute ago'
       ),    NotificationsModel(
          image: AppImages.chair4,
          title: 'your order 3 summery green chair has been shipped!',
        time: '49 minute ago'
       ),
      NotificationsModel(
          image: AppImages.chair1,
          title: 'your order will be ship. once we get confirl address',
        time: '5 hours age'
        ),
      NotificationsModel(
          image: AppImages.chair3,
          title: 'new products you may like are available go and show now.',
          time: '8 days ago',
           ),
    ];
  }
}

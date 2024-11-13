import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/notifications_controller.dart';
import '../widgets/list_tile_notifications_widget.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  static const String route = '/NotificationsView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) => Scaffold(
        appBar: const AppBarWidget(
          isClear: true,
          isIconBack: true,
          title: 'Notifications',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
            child: Column(
              children: [

                UiHelper.verticalSpaceLarge,
                const ListTileNotificationsWidget(
                    image: AppImages.chair2,
                    title:
                    'special offer on bean upto 46% off all the products',
                    time: '10 minute ago')    ,
                UiHelper.verticalSpaceMedium,
                const ListTileNotificationsWidget(
                  image: AppImages.chair4,
                  title:
                  'your order 3 summery green chair has been shipped!',
                  time: '49 minute ago',
                )  ,
                UiHelper.verticalSpaceMedium,
                const ListTileNotificationsWidget(
                  image: AppImages.chair1,
                  title:
                  'your order will be ship. once we get confirl address',
                  time: '5 hours age',
                )   ,
                UiHelper.verticalSpaceMedium,
                const ListTileNotificationsWidget(
                    image: AppImages.chair3,
                    title:
                    'new products you may like are available go and show now.',
                    time: '8 days ago')     ,
                UiHelper.verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

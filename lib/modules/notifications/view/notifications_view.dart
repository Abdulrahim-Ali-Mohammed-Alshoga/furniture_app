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
                ListView.builder(
                  itemBuilder: (context, index) {
                    final notification = controller.notificationList[index];
                    return ListTileNotificationsWidget(
                        image: notification.image!,
                        title: notification.title!,
                        time: notification.time!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

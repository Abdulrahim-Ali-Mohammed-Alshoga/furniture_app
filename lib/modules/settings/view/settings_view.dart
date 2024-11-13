import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../controllers/settings_controller.dart';
import '../widgets/list_tile_settings_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const String route = '/SettingsView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) => Scaffold(
        appBar: const AppBarWidget(
          isIconBack: true,
          title: 'Settings',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiHelper.verticalSpaceLarge,
                    UiHelper.verticalSpaceLarge,
                    const ListTileSettingsWidget(
                        iconImage: AppImages.notification,
                        title: 'Notifications'),
                    UiHelper.verticalSpaceMedium,
                    const ListTileSettingsWidget(
                        iconImage: AppImages.mailFast,
                        title: 'Email Settings'),UiHelper.verticalSpaceMedium,
                    const ListTileSettingsWidget(
                        iconImage: AppImages.mapLocation,
                        title: 'Manage Addresses'),
                    UiHelper.verticalSpaceMedium,
                    const ListTileSettingsWidget(
                        iconImage: AppImages.wallet,
                        title: 'Manage Payment'),
                    UiHelper.verticalSpaceMedium,

                    const ListTileSettingsWidget(
                        iconImage: AppImages.power,
                        title: 'Data Control'),
                    UiHelper.verticalSpaceMedium,

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

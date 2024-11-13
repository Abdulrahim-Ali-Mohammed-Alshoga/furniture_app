import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:furniture_app/core/utils/utils1/extensions.dart';
import 'package:furniture_app/modules/popular/controllers/popular_controller.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../global_widgets/app_bar_widget.dart';
import '../../../global_widgets/ui_helpers.dart ';
import '../widgets/list_tile_notifications_widget.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key});

  static const String route = '/PopularView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(
      builder: (controller) =>
          Scaffold(
            appBar: const AppBarWidget(
              isClear: true,
              isIconBack: true,
              title: 'Popular',
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
              child: ListView.builder(
                padding: EdgeInsets.only(top:AppSize.s24.h ),
                itemCount: controller.furnitureList.length,
                itemBuilder: (context, index) {
                  final furniture=controller.furnitureList[index];
                  return Column(children: [
                    ListTileNotificationsWidget(
                        image:furniture.image,
                        title:
                        furniture.name,
                        manufacturer: furniture.manufacturer,
                        price: furniture.price.toCurrencyString),
                    UiHelper.verticalSpaceMedium,
                  ],);
                },

              ),
            ),
          ),
    );
  }
}

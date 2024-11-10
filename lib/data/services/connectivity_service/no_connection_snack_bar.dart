import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/launguages_and_localization/app_strings.dart';

// import '../../core/language_and_localization/app_strings.dart';

class NoConnectionSnackBar {
  static GetSnackBar? _getBar;

  static GetSnackBar? get getBar {
    _getBar ??= GetSnackBar(
      // icon: IconButton(onPressed: () {}, icon: Icon(Icons.update)),
      message: AppStrings.internetConnectionError.tr,
      // backgroundColor: Get.theme.primaryColor,
      isDismissible: true,
      backgroundColor: Get.theme.colorScheme.secondary,

      dismissDirection: DismissDirection.horizontal,
    );
    return _getBar;
  }

  static showNoConnectionSnackBar() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getBar?.show();
    });
  }

  static hideNoConnectionSnackBar({Function? onHideCallback}) {
    if (Get.isSnackbarOpen) {
      Get.back();

      if (onHideCallback != null) {
        onHideCallback();
      }
    }
  }
}

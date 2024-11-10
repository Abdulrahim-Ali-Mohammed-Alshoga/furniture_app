import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../data/services/connectivity_service/no_connection_snack_bar.dart';
import '../../../global_widgets/action_button.dart';
import '../../../global_widgets/button_widget.dart';
import '../../../global_widgets/ui_helpers.dart';
import '../../launguages_and_localization/app_strings.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_styles.dart';

class DifferentDialogs {
  static bool _isShowing = false;
  static RxString progressMessage =
      RxString(AppStrings.pleaseWait.tr.capitalizeFirst!);

  static GetSnackBar successSnackBar(
      {String title = AppStrings.success, String? message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr, style: getMediumStyle(color: AppColors.white)),
      messageText:
          Text(message ?? '', style: getMediumStyle(color: AppColors.white)),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 2),
    );
  }

  static showProgressDialog({bool willPop = false}) async {
    if (Get.isSnackbarOpen) {
      NoConnectionSnackBar.hideNoConnectionSnackBar();
      await Future.delayed(const Duration(seconds: 1), () {});
    }
    _isShowing = true;
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async {
            return willPop;
          },
          child: AlertDialog(
            content: SizedBox(
              height: 0.07.sh,
              width: 0.7.sw,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitDualRing(
                    color: Get.theme.colorScheme.secondary,
                    size: 40.r,
                    lineWidth: 4,
                  ),
                  UiHelper.horizontalSpaceSmall,
                  Expanded(child: Obx(() {
                    return Text(
                      progressMessage.value,
                      style: Get.textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                      maxLines: 2,
                    );
                  })),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showViewDialog(
      {EdgeInsetsGeometry? actionsPadding,
      MainAxisAlignment? actionsAlignment,
      List<Widget>? actions,
      required String title,
      required Widget child}) async {
    showDialog<void>(
      context: Get.context!,
      // barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          actionsAlignment: actionsAlignment,
          actionsPadding: actionsPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10.r)), // تعيين شكل (shape) حواف مربع الحوار
          ),
          title: Container(
            width: 100,
            height: 0.08.sh,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r)),
            ),
            child: Text(
              style: TextStyle(color: Get.theme.scaffoldBackgroundColor),
              title,
            ),
          ),
          content: child,
          actions: actions ??
              [
                ActionButton(
                  text: 'Cancel',
                  textColor: Get.theme.unselectedWidgetColor,
                  borderColor: Get.theme.unselectedWidgetColor,
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                  height: 30,
                  width: 100,
                  onPressed: () {
                    Get.back(); // لإغلاق مربع الحوار
                  },
                ),
              ],
        );
      },
    );
  }

  static GetSnackBar errorSnackBar({String? title, String? message}) {
    return GetSnackBar(
      titleText: Text(
        title ?? AppStrings.error.tr.capitalizeFirst!,
        style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message ?? AppStrings.failed.tr.capitalizeFirst!,
        style: Get.textTheme.titleSmall!.copyWith(
          color: Colors.white,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.remove_circle_outline,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  static hideProgressDialog() async {
    if (_isShowing) {
      Get.back();
    }
    _isShowing = false;
  }

  static deleteAlertDialog({final GestureTapCallback? onTapDelete}) async {
    await Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: Colors.white,
        titlePadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.all(10.h),
        title: Container(
          height: 0.08.sh,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r)),
          ),
          child: Text(
            'Do you want to delete?',
            style: getBoldStyle(color: AppColors.black, fontSize: 12.sp),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 45.h,
              width: 700.w,
              child: const Text(
                  textAlign: TextAlign.center,
                  'Once deleted, you will not be able to recover'),
            ),
          ],
        ),
        actions: [
          ButtonWidget(
            onTap:onTapDelete ,
            title: 'Delete',
            height: 35.h,
            width: 70.w,
            isRight: false,
            horizontalSpace: 0,
            circular: 8.r,
            icon: const Icon(
              Icons.delete_rounded,
              color: AppColors.white,
            ),
            color: AppColors.redDelete,
            style: getBoldStyle(color: AppColors.white, fontSize: 9.sp),
          ),
          ButtonWidget(
            title: 'Cancel',
            height: 35.h,
            width: 70.w,
            isRight: false,
            horizontalSpace: 0,
            circular: 8.r,
            icon: const Icon(
              Icons.clear,
              color: AppColors.white,
            ),
            onTap: () => Get.back(),
            color: AppColors.greyCancel,
            style: getBoldStyle(color: AppColors.white, fontSize: 9.sp),
          ),
        ],
      ),
    );
  }

  static showAlertDialogFilter(
      {VoidCallback? onPressedOk,
      String? groupValue,
      VoidCallback? onPressedCancel,
      ValueChanged<String?>? onChanged,
      required List<String> filterTextList}) {
    Get.dialog(
      StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          titlePadding: EdgeInsets.zero,
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.all(10.h),
          title: Container(
            width: 100,
            height: 0.08.sh,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: const Text(
              'Filter',
              style: TextStyle(
                color: AppColors.mainLight,
                fontFamily: "Teshrin",
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                filterTextList.length,
                (index) => RadioListTile(
                  title: Text(
                    filterTextList[index],
                    style: const TextStyle(
                      color: AppColors.blueDarkColor,
                    ),
                  ),
                  value: filterTextList[index],
                  groupValue: groupValue,
                  onChanged: (String? value) {
                    if (onChanged != null) {
                      groupValue = value;
                      setState(() {
                        onChanged(value);
                      }); // استدعاء setState هنا داخل StatefulBuilder
                    }
                  },
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppColors.primaryColor2),
              ),
              onPressed: onPressedOk,
              child: const Text('OK'),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.blueDarkColor)),
              onPressed: onPressedCancel,
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

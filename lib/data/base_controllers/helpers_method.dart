import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_styles.dart';
import '../../core/utils/helpers/date_picker_show.dart';
import '../../core/utils/helpers/time_picker_show.dart';
import '../../global_widgets/button_widget.dart';
import '../../global_widgets/ui_helpers.dart';
import '../services/connectivity_service/no_connection_snack_bar.dart';

class HelpersMethods {
  static final Size appBarSize = AppBar().preferredSize;

  Duration timeOutDuration({int seconds = 5}) {
    return Duration(seconds: seconds);
  }

  // static showMessageClose(BuildContext context) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const AlertDialogWidget();
  //     },
  //   );
  // }

  static Future<String?> requireStartDate(BuildContext context,
      [DateTime? firstDate]) async {
    final dateSelect = await pickDate(
        context: context,
        firstDate: firstDate ?? DateTime(DateTime.now().year - 5));
    if (dateSelect != null) {
      return intl.DateFormat('dd MMM yyyy').format(dateSelect);
    }
    return dateSelect;
  }

  static Future<String?> requireStartTime(BuildContext context) async {
    final dateSelect = await pickTime(context: context);
    if (dateSelect != null) {
      return intl.DateFormat('HH:mm')
          .format(DateTime(2022, 1, 1, dateSelect.hour, dateSelect.minute));
    }
    return dateSelect;
  }

  static showMessageDelete(BuildContext context, String title) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          content: Container(
            width: 300.w,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete_forever,
                          color: Colors.redAccent,
                        ),
                        UiHelper.horizontalSpaceSmall,
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Text(
                  textAlign: TextAlign.center,
                  'Once you delete it you cant retrieve it again!',
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(110.w, 40.h), // Set the desired width and height
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade50),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.r),

                    //  side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(110.w, 40.h), // Set the desired width and height
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade50),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.r),

                    //  side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // bool noInternetConnection() {
  //   if (Get.find<ConnectivityController>().currentConnectivityStatus == null) {
  //     Get.find<ConnectivityController>().checkWhenStreamIsNull();
  //   }
  //   return Get.find<ConnectivityController>().currentConnectivityStatus ==
  //       false;
  // }

  onNOInternetConnection() async {
    return await NoConnectionSnackBar.showNoConnectionSnackBar();
  }

  static myShowModalBottomSheet(BuildContext context, Widget child) async {
    return showModalBottomSheet(
        backgroundColor: AppColors.bottomSheetColor,
        context: context,
        isScrollControlled: true,
        elevation: 0,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  UiHelper.verticalSpaceSmall,
                  Container(
                    width: 28.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  UiHelper.verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiHelper.verticalSpaceLarge,
                      Container(
                          color: AppColors.bottomSheetColor,
                          constraints: BoxConstraints(
                              minHeight: .1.sh, maxHeight: .75.sh),
                          child: SingleChildScrollView(child: child))
                    ],
                  )
                ]),
              ),
            ));
  }


  //  void toastMessage(
  //   String message, {
  //   Color? backgroundColor,
  //   Color? textColor,
  // }) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: backgroundColor ?? Colors.black,
  //       textColor: textColor ?? Colors.white,
  //       fontSize: 16.0);
  // }

  static String showFormattedDate(
    DateTime date, {
    bool withTime = false,
    bool onlyDate = false,
    bool onlyTime = false,
    bool dateWithDayName = false,
  }) {
    if (onlyTime) {
      return intl.DateFormat('hh:mm a').format(date);
    }
    if (withTime) {
      return intl.DateFormat('hh:mm a  dd, MM, yyyy').format(date);
    }
    if (onlyDate) {
      return intl.DateFormat('MM/dd/yyyy').format(date);
    }
    if (dateWithDayName) {
      return intl.DateFormat('EE, dd, MM, yyyy').format(date);
    }
    return intl.DateFormat('yyyy-MM-dd ').format(date);
  }

  static String? splitOnlyTowUserName(
    String? fullName, {
    bool withMid = false,
    bool onlyFirstName = false,
  }) {
    if (fullName != null) {
      var names = fullName.split(' ');

      if (onlyFirstName) {
        return names.first;
      }

      if (names.length == 1) {
        return names.first;
      }

      return withMid && names.length > 2
          ? '${names.first} ${names[1]} ${names.last}'
          : '${names.first} ${names.last}';
    }
    return null;
  }

  buildFailedSnackBar({String? msg, String title = 'Failed'}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    return WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get.showSnackbar(
      // DifferentDialogs.errorSnackBar(
      //   message: msg,
      //   title: title,
      // ),
      // );
    });
  }

  buildSuccessSnackBar({String? msg, String title = 'Success'}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    return WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get.showSnackbar(
      // DifferentDialogs.successSnackBar(
      //   message: msg,
      //   title: title,
      // ),
      // );
    });
  }

  buildInfoSnack({required String? msg, String title = 'Info'}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    // return Get.showSnackbar(
    // DifferentDialogs.messageSnackBar(
    //   message: msg,
    //   title: title,
    // ),
    // );
  }

  hideSoftKeyBoard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static TextDirection currentLocaleTextDirection() {
    bool isRtl = intl.Bidi.isRtlLanguage(
        Localizations.localeOf(Get.context!).languageCode);
    return isRtl ? TextDirection.rtl : TextDirection.ltr;
  }

  static TextDirection getTextDirection({String? text, bool opposite = false}) {
    bool isRtl;
    if (text != null) {
      isRtl = intl.Bidi.detectRtlDirectionality(text);
    } else {
      isRtl = intl.Bidi.isRtlLanguage(
        Localizations.localeOf(Get.context!).languageCode,
      );
    }
    if (opposite) {
      return !isRtl ? TextDirection.rtl : TextDirection.ltr;
    }
    return isRtl ? TextDirection.rtl : TextDirection.ltr;
  }

  static bool get isDirectionRTL {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(Get.context!).languageCode);
  }
}

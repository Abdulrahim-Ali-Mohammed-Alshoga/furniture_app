// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
//
// import '../../global_widgets/different_dialogs.dart';
// import '../values/launguages_and_localization/app_strings.dart';
//
// class UrlLauncherHelper {
//   UrlLauncherHelper._();
//
//   static Future<void> makePhoneCall({required String? phoneNumber}) async {
//     if (phoneNumber == null || phoneNumber.isEmpty) return;
//     String url = 'tel:${phoneNumber.trim()}';
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       Get.showSnackbar(DifferentDialogs.errorSnackBar(
//           message: AppStrings.MAKE_CALL_ERROR.tr.capitalizeFirst));
//     }
//   }
//
//   static Future<void> openEmail({required String? email}) async {
//     if (email == null || email.isEmpty) return;
//     final url = Uri.encodeFull('mailto:${email.trim()}');
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       Get.showSnackbar(DifferentDialogs.errorSnackBar(
//           message: AppStrings.OPEN_EMAIL_ERROR.tr.capitalizeFirst));
//     }
//   }
//
//   static Future<void> openUrlLink({required String? urlLink}) async {
//     if (urlLink == null || urlLink.isEmpty) return;
//     final uri = Uri.parse(urlLink);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       Get.showSnackbar(DifferentDialogs.errorSnackBar(
//           message: AppStrings.OPEN_FILE_ERROR.tr.capitalizeFirst));
//     }
//   }
//
//   static Future<void> openWhatsapp({required String? phoneNumber}) async {
//     if (phoneNumber == null || phoneNumber.isEmpty) {
//       return;
//     }
//     var whatsapp = phoneNumber.trim();
//     var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp;
//     var whatsappURLIOS = "https://wa.me/$whatsapp";
//     if (Platform.isIOS) {
//       // for iOS phone only
//       if (await canLaunchUrlString(whatsappURLIOS)) {
//         await launchUrlString(
//           whatsappURLIOS,
//         );
//       } else {
//         Get.showSnackbar(DifferentDialogs.errorSnackBar(
//             message: AppStrings.OPEN_EMAIL_ERROR.tr.capitalizeFirst));
//         ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
//             content:
//                 Text(AppStrings.WHATSAPP_NOT_INSTALLED.tr.capitalizeFirst!)));
//       }
//     } else {
//       // android , web
//       if (await canLaunchUrlString(whatsappURlAndroid)) {
//         await launchUrlString(whatsappURlAndroid);
//       } else {
//         SnackBar(
//             content:
//                 Text(AppStrings.WHATSAPP_NOT_INSTALLED.tr.capitalizeFirst!));
//       }
//     }
//   }
// }

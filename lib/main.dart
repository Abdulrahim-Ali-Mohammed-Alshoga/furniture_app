import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/services/connectivity_service/connectivity_service.dart';
import 'data/services/settings_service.dart';
import 'data/services/translation_service.dart';
import 'start_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Upgrader.clearSavedSettings();
  HttpOverrides.global = MyHttpOverrides();



  Get.put(ConnectivityController(), permanent: true);
  Get.put(SettingsService(), permanent: true);
  Get.put(TranslationService(), permanent: true);
  runApp(const StartApp());
}

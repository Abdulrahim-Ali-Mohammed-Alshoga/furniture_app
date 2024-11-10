

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/data/services/translation_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/resources/get_storage_keys.dart';

class SettingsService extends GetxService {
  Rx<bool> enabledBiometric = Rx(false);
  Rx<ThemeMode> selectedThemeMode = ThemeMode.light.obs;
  late Locale selectedLanguage;

  bool get isArabic => selectedLanguage.languageCode == 'ar';
  GetStorage? _settingsBox;
  GetStorage? _tutorialGuideBox;

  @override
  void onInit() {
    super.onInit();
    _settingsBox = GetStorage('app_settings');
    _tutorialGuideBox = GetStorage('tutorial_guide');
    checkEnableBiometric();
  }

  /// language methods
  Locale getLocale() {
    String? _locale =
        GetStorage('app_settings').read<String>(GetStorageKeys.LANGUAGE);
    if (_locale == null || _locale.isEmpty) {
      _locale = Get.deviceLocale?.languageCode != 'ar' ? 'en' : 'ar';
    }
    selectedLanguage =
         Get.find<TranslationService>().fromStringToLocale(_locale);
    return selectedLanguage;
  }

  void updateLocale(Locale? value) async {
    if (value == null) return;
    Get.find<SettingsService>().selectedLanguage = value;
    Get.updateLocale(value);
    if (value.countryCode?.isEmpty ?? true) {
      await _settingsBox?.write(GetStorageKeys.LANGUAGE, value.languageCode);
    } else {
      await _settingsBox?.write(GetStorageKeys.LANGUAGE,
          value.languageCode + "_" + value.countryCode!);
    }
    print(_settingsBox?.read(GetStorageKeys.LANGUAGE));
  }

  /// theme methods
  ThemeMode getThemeMode() {
    return ThemeMode.light;
    String? _themeMode =
        GetStorage('app_settings').read<String>(GetStorageKeys.THEME_MODE);
    switch (_themeMode) {
      case 'ThemeMode.light':
        selectedThemeMode.value = ThemeMode.light;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        selectedThemeMode.value = ThemeMode.dark;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        selectedThemeMode.value = ThemeMode.system;
        return ThemeMode.system;
      default:
        selectedThemeMode.value = ThemeMode.system;
        return ThemeMode.system;
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    selectedThemeMode.value = themeMode;
    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    }
    _settingsBox?.write(GetStorageKeys.THEME_MODE, themeMode.toString());
    // Get.rootController.restartApp();
  }

  /// biometric methods
  void checkEnableBiometric() {
    if (_settingsBox?.read(GetStorageKeys.ENABLE_BIOMETRIC) != null &&
        (_settingsBox?.read(GetStorageKeys.ENABLE_BIOMETRIC) == true)) {
      enabledBiometric.value = true;
    }
  }

  void toggleBiometricState(bool value) {
    enabledBiometric.value = value;
    _settingsBox?.write(GetStorageKeys.ENABLE_BIOMETRIC, value);
  }

  /// tutorial guide methods
  updateTutorialState(String getStorageKey) {
    _tutorialGuideBox?.write(getStorageKey, true);
  }

  getTutorialState(String getStorageKey) {
    var tutorialGuide = _tutorialGuideBox?.read(getStorageKey);
    if (tutorialGuide != null) {
      return tutorialGuide;
    } else {
      return false;
    }
  }

  /// app badge
}

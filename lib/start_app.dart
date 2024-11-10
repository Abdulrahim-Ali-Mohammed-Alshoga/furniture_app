import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/launguages_and_localization/app_translation.dart';
import 'core/theme/app_theme.dart';
import 'data/services/settings_service.dart';
import 'data/services/translation_service.dart';
import 'routes/app_pages.dart';

class StartApp extends StatelessWidget {
  const StartApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'employee',
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.sp),
              ),
              child: child!,
            );
          },
          initialRoute: AppPages.initial,
          getPages: AppPages.allRoutes,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Get.find<TranslationService>().supportedLocales(),
          translations: AppTranslation(),
          locale: const Locale('en'),
          fallbackLocale: Get.find<TranslationService>().fallbackLocale,
          themeMode: Get.find<SettingsService>().getThemeMode(),
          theme: AppTheme.getLightTheme().copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          darkTheme: AppTheme.getDarkTheme(),
        );
      },
    );
  }
}

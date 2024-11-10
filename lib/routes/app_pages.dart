import 'package:get/get.dart';
import '../global_widgets/qr/mobile_scanner_widger.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';

class AppPages {
  // static const String initial = SplashView.route;

  static const String initial = SplashView.route;

  static const transition = Transition.cupertinoDialog;
  static const duration = Duration(milliseconds: 500);

  static final List<GetPage> allRoutes = [

    GetPage(
      name: SplashView.route,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),


  GetPage(
      name: MobileScannerWidget.route,
      page: () => const MobileScannerWidget(),

    ),

  ];
}

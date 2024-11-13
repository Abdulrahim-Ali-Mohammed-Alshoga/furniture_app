import 'package:furniture_app/modules/auth/login/binding/login_binding.dart';
import 'package:furniture_app/modules/auth/login/view/login_view.dart';
import 'package:furniture_app/modules/profile/binding/onboard_binding.dart';
import 'package:furniture_app/modules/profile/view/profile_view.dart';
import 'package:get/get.dart';
import '../modules/favourite/binding/favourite_binding.dart';
import '../modules/favourite/view/favourite_view.dart';
import '../modules/onboard/binding/onboard_binding.dart';
import '../modules/onboard/view/onboard_view.dart';
import '../modules/settings/binding/settings_binding.dart';
import '../modules/settings/view/settings_view.dart';
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
      name: OnBoardView.route,
      page: () => const OnBoardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: LoginView.route,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ProfileView.route,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: FavouriteView.route,
      page: () => const FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: SettingsView.route,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}

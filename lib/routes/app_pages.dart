import 'package:furniture_app/modules/auth/forgot_password/binding/forgot_password_binding.dart';
import 'package:furniture_app/modules/auth/forgot_password/view/forgot_password_view.dart';
import 'package:furniture_app/modules/auth/login/binding/login_binding.dart';
import 'package:furniture_app/modules/auth/login/view/login_view.dart';
import 'package:furniture_app/modules/notifications/view/notifications_view.dart';
import 'package:furniture_app/modules/payment/binding/payment_binding.dart';
import 'package:furniture_app/modules/payment/view/payment_view.dart';
import 'package:furniture_app/modules/profile/binding/onboard_binding.dart';
import 'package:furniture_app/modules/profile/view/profile_view.dart';
import 'package:furniture_app/modules/shopping/view/shopping_view.dart';
import 'package:get/get.dart';
import '../modules/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/view/bottom_nav_bar_view.dart';
import '../modules/favourite/binding/favourite_binding.dart';
import '../modules/favourite/view/favourite_view.dart';
import '../modules/notifications/binding/notifications_binding.dart';
import '../modules/onboard/binding/onboard_binding.dart';
import '../modules/onboard/view/onboard_view.dart';
import '../modules/popular/binding/popular_binding.dart';
import '../modules/popular/view/popular_view.dart';
import '../modules/settings/binding/settings_binding.dart';
import '../modules/settings/view/settings_view.dart';
import '../modules/shopping/binding/shopping_binding.dart';
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
    GetPage(
      name: NotificationsView.route,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: PopularView.route,
      page: () => const PopularView(),
      binding: PopularBinding(),
    ),
    GetPage(
      name: ShoppingView.route,
      page: () => const ShoppingView(),
      binding:ShoppingBinding(),
    ),

    GetPage(
      name: ForgotPasswordView.route,
      page: () => const ForgotPasswordView(),
      binding:ForgotPasswordBinding(),
    ), GetPage(
      name: PaymentView.route,
      page: () => const PaymentView(),
      binding:PaymentBinding(),
    ), GetPage(
      name:  BottomNavBarView.route,
      page: () => const  BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
  ];
}

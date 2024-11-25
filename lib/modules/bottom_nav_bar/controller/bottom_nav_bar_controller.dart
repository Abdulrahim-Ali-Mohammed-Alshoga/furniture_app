import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/view/home_view.dart';
import '../../favourite/view/favourite_view.dart';
import '../../profile/view/profile_view.dart';
import '../../shopping/view/shopping_view.dart';

class BottomNavBarController extends GetxController {
  int currentTab = 0;
  List<IconData> icons = [
    Icons.connected_tv_sharp,
    Icons.add,
    Icons.cabin_rounded,
    Icons.perm_identity_rounded
  ];
  final List<Widget> pages = [
    const HomeView(),
    const FavouriteView(),
  ];

  void jumpToView(int numberPages) {
    switch (numberPages) {
      case 2:
        Get.toNamed(ShoppingView.route);
        break;
      case 3:
        Get.toNamed(ProfileView.route);
        break;
      default:
        currentTab = numberPages;
        update();
    }
  }
}

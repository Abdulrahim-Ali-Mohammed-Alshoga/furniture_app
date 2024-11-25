import 'package:flutter/material.dart';
import 'package:furniture_app/core/resources/app_images.dart';
import 'bottom_nav_item.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({
    super.key,
    required this.currentTab,
    required this.onPressed,
  });

  final int currentTab;
  final Function(int) onPressed;

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  late int currentTab=0;


  void _handleTabPress(int index) {
    if(index!=2&&index!=3){
      setState(() {
        currentTab = index; // تحديث التبويب الحالي
      });
    }

    widget.onPressed(index); // استدعاء الدالة الممررة
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Left Tab bar icons
        Row(
          children: [
            BottomNavItem(
              image: AppImages.home,
              title: 'Home',
              onPressed: () => _handleTabPress(0), // تمرير دالة
              isSelected: currentTab == 0,
            ),
            BottomNavItem(
              image: AppImages.heart,
              title: 'Favourite',
              onPressed: () => _handleTabPress(1), // تمرير دالة
              isSelected: currentTab == 1,
            ),
          ],
        ),

        // Right Tab bar icons
        Row(
          children: [
            BottomNavItem(
              image: AppImages.cart,
              title: 'Shopping',
              onPressed: () => _handleTabPress(2), // تمرير دالة
              isSelected:false,
            ),
            BottomNavItem(
              image: AppImages.userIcon,
              title: 'Profile',
              onPressed: () => _handleTabPress(3), // تمرير دالة
              isSelected:false,
            ),
          ],
        ),
      ],
    );
  }
}

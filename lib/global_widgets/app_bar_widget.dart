import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/resources/app_values.dart';
import 'package:get/get.dart';

import '../core/resources/app_colors.dart';
import '../core/resources/app_styles.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key,
      this.isClear = false,
      required this.title,
      this.resultIconBack,
      this.controller, 
      this.isIconBack = true});

  final TextEditingController? controller; 
  final bool isClear, isIconBack;
  final String title;
  final Map<String, dynamic>? resultIconBack;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarWidgetState extends State<AppBarWidget> {
 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //  surfaceTintColor: Colors.transparent ,
      elevation: 0,
      // forceMaterialTransparency: true,
      //shadowColor: AppColors.grey,
      titleSpacing: 0,
      title: Row(
        children: [
          Expanded(
            child:  widget.isIconBack
                ? GestureDetector(
                    onTap: () => Get.back(result: widget.resultIconBack),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50.w,
                        margin: EdgeInsets.only(left: AppSize.s20.w),
                        height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                          size: 25.h,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.none,
              child: Text(
                widget.title,
                style:
                    getBoldStyle(color: AppColors.textStyleHome, fontSize: 18),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding:   EdgeInsets.only(right: AppSize.s20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                if ( widget.isClear ) ...[
                        Text('Clear All',style: getRegularStyle(color: AppColors.slateGray,fontSize: 16),)
                ],
                            ],
                          ),
              ))
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}
// GestureDetector(
// onTap: () => Get.back(),
// child: Container(
// margin: EdgeInsets.symmetric(horizontal: 6.w),
// alignment: Alignment.center,
// decoration: const BoxDecoration(
// color: AppColors.white, shape: BoxShape.circle),
// child: Icon(
// Icons.first_page,
// color: AppColors.black,
// size: 25.h,
// ),
// ))


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/qr/mobile_scanner_widger.dart';
import 'package:furniture_app/global_widgets/ui_helpers.dart%20';
import 'package:get/get.dart';

import '../core/resources/app_colors.dart';
import '../core/resources/app_styles.dart';
import 'form_widgets/search_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key,
      this.isIcon = false,
      required this.title,
      this.resultIconBack,
      this.controller,
      this.functionSearch,
      this.functionClose,
      this.functionSearchQr,
      this.isIconBack = true});

  final TextEditingController? controller;
  final Function? functionSearch, functionClose, functionSearchQr;
  final bool isIcon, isIconBack;
  final String title;
  final Map<String, dynamic>? resultIconBack;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(

    //  surfaceTintColor: Colors.transparent ,
       elevation: 0,
      // forceMaterialTransparency: true,
      //shadowColor: AppColors.grey,
      actions: isSearch || !widget.isIcon
          ? null
          : [
              GestureDetector(
                onTap: () => setState(() {
                  isSearch = !isSearch;
                }),
                child: Icon(
                  Icons.search,
                  color: AppColors.black,
                  size: 25.h,
                ),
              ),
              UiHelper.horizontalSpaceTiny,
              GestureDetector(
                onTap: () async {
                  String textQr;
                  Get.toNamed(MobileScannerWidget.route)!.then(
                    (value) async {
                      if (await value['BarCodeValue'] != '-1') {
                        textQr = value['BarCodeValue'];
                        widget.functionSearchQr!(textQr);
                      }
                    },
                  );
                },
                child: Icon(
                  Icons.qr_code,
                  color: AppColors.black,
                  size: 25.h,
                ),
              ),
              UiHelper.horizontalSpaceSmall,
            ],
      title: isSearch
          ? SearchWidget(
              functionBack: () {
                setState(() {
                  isSearch = false;
                });
              },
              functionClose: widget.functionClose!,
              controller: widget.controller!,
              functionSearch: widget.functionSearch!,
            )
          : FittedBox(
              child: Text(
                widget.title,
                style: getBoldStyle(
                    color: AppColors.textStyleHome, fontSize: 17.sp),
              ),
            ),
      automaticallyImplyLeading: false,
      leading: !isSearch && widget.isIconBack
          ? InkWell(
              onTap: () => Get.back(result: widget.resultIconBack),
              child: Icon(
                Icons.first_page,
                color: AppColors.black,
                size: 25.h,
              ))
          : null,
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

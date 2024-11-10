import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/app_colors.dart';
import '../ui_helpers.dart ';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {super.key,
        required this.functionClose,
        required this.functionSearch,
        required this.controller, required this.functionBack});
final  TextEditingController controller;
  final Function functionSearch, functionClose,functionBack;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isClean = true;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: (v) {
        widget.functionSearch(widget.controller.text);
        if (isClean && widget.controller.text.isNotEmpty) {
          setState(() {
            isClean = false;
          });
        } else if (widget.controller.text.isEmpty) {
          setState(() {
            isClean = true;
          });
        }
      },
      autofocus: true,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.pink,
      style: TextStyle(color: AppColors.black, fontSize: 16.sp),
      controller: widget.controller,
      focusNode: focusNode,

      maxLines: 1,
      textInputAction: TextInputAction.search,

      onFieldSubmitted: (s) {
        widget.functionSearch(widget.controller.text);
      },
      decoration: InputDecoration(
        fillColor: AppColors.mainLight,
        filled: true,
        contentPadding: EdgeInsets.only(left: 10.w),
        prefixIcon: GestureDetector(
          onTap: () {
            widget.functionClose();
            widget.functionBack();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 21.h,
            color: AppColors.grey,
          ),
        ),
        suffixIcon: SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isClean)
                GestureDetector(
                    onTap: () {
                      isClean = true;
                      // FocusScope.of(context).requestFocus(focusNode);
                      widget.functionClose();
                    },
                    child: Icon(
                      Icons.clear,
                      color: AppColors.grey,
                      size: 22.h,
                    )),
              Icon(Icons.search, color: AppColors.grey, size: 22.h),
              UiHelper.horizontalSpaceSmall,
            ],
          ),
        ),
        focusedBorder:
          OutlineInputBorder(
          borderSide: const BorderSide(color:AppColors.mainLight), borderRadius: BorderRadius.all(Radius.circular(20.r))
        ),
        enabledBorder:   OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainLight),
          borderRadius: BorderRadius.all(Radius.circular(20.r))
        ),
        hintStyle: const TextStyle(color: AppColors.grey),
        hintText: "Search",
      ),
    );
  }
}

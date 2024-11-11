import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_styles.dart';
import '../ui_helpers.dart ';

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final String keyName;
  final String confirmKeyName;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final double circular;
  final TextStyle? hintStyle;
  final String? confirmLabel;
  final String? confirmHint;
  final bool isSignUp;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? contentPadding;
  final int requiredMinLength;
  final InputBorder? inputBorder;
  final bool isFill;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;

  // final Color fillColor;

  const PasswordInput({
    super.key,
    required this.hintText,
    this.textInputAction,
    this.contentPadding,
    this.labelText,
    this.confirmKeyName = '',
    required this.keyName,
    this.isSignUp = false,
    this.confirmLabel,
    this.requiredMinLength = 3,
    this.isFill = true,
    this.inputBorder,
    this.padding,
    this.fillColor,
    this.confirmHint,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
      this.circular= 12, this.controller,
    // this.fillColor = Colors.white,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isHidden = true;
  late String firstPass;

  @override
  Widget build(BuildContext context) {
    if (widget.isSignUp) {
      return Column(
        children: <Widget>[
          buildTextFormField(),
          UiHelper.verticalSpaceMedium,
          buildConfirmPassword(),
        ],
      );
    } else {
      return buildTextFormField();
    }
  }

  Widget buildConfirmPassword() {
    return FormBuilderTextField(
      initialValue: '',
      name: widget.confirmKeyName,
      style: getSemiBoldStyle(color: AppColors.textStyle, fontSize: 14.sp),
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: isHidden,
      maxLines: 1,
      decoration: InputDecoration(
        // labelText: widget.confirmLabel,
        hintText: widget.confirmHint,
        hintStyle:
        widget.hintStyle ?? Theme
            .of(context)
            .textTheme
            .bodyLarge,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 13.4.h, horizontal: 9.w),
        labelStyle:
            widget.labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        fillColor: widget.fillColor,
        filled: widget.isFill,
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: isHidden
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        prefixIcon: widget.prefixIcon ??
            const Icon(
              Icons.lock_outlined,
            ),
        isDense: true,
        focusedBorder: widget.inputBorder ??
            OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.circular.r)),
                borderSide: const BorderSide(
                  color: AppColors.blue,
                  width: 1,
                )),
        enabledBorder: widget.inputBorder ??
            OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.circular.r)),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1,
                )

                // borderSide: BorderSide.none,
                ),

        border: widget.inputBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.circular.r)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              // borderSide: BorderSide.none,
            ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(widget.requiredMinLength),
        (val) {
          if (val != firstPass) {
            return 'Not Match Passwords';
          } else {
            return null;
          }
        },
      ]),
    );
  }

  Widget buildTextFormField() {
    return FormBuilderTextField(
      name: widget.keyName,
      controller: widget.controller,
      style: getSemiBoldStyle(color: AppColors.textStyle, fontSize: 14.sp),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autofocus: false,
      obscureText: isHidden,
      onChanged: (pass1) {
        firstPass = pass1.toString();
      },
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 13.4.h, horizontal: 9.w),
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        labelText: widget.labelText,
        labelStyle:
            widget.labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        hintStyle:
        widget.hintStyle ?? Theme
            .of(context)
            .textTheme
            .bodyLarge,
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: isHidden
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        prefixIcon: widget.prefixIcon ??   Padding(
      padding: EdgeInsets.only(left: 24.w, right: 12.w),
      child: Icon(
        Icons.lock_outline,
        color: AppColors.blue,
        size: 22.h,
      ),
    ),
        filled: widget.isFill,
        isDense: true,
        focusedBorder: widget.inputBorder ??
            OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(widget.circular.r)),
                borderSide: const BorderSide(
                  color: AppColors.blue,
                  width: 1,
                )),
        enabledBorder: widget.inputBorder ??
            OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(widget.circular.r)),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1,
                )

              // borderSide: BorderSide.none,
            ),

        border: widget.inputBorder ??
            OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(widget.circular.r)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              // borderSide: BorderSide.none,
            ),
      ),
      maxLines: 1,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(widget.requiredMinLength),
      ]),
    );
  }

  void _toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

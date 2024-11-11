import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_styles.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String keyName;
  final TextInputType? textInputType;
  final bool isNumeric;
  final bool isUrl;
  final bool enabled;
  final bool isEmail;

  final bool isRequired;
  final bool isFill, readOnly;
  final ValueChanged<String?>? onChanged;

  final InputBorder? inputBorder, focusedBorder, border;
  final int? maxLength;
  final int? minLine, max;
  final int? maxLines;
  final bool obscureText;
  final BoxConstraints? suffixIconConstraints;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? suffix;

  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final Color? fillColor, cursorColor;
  final ValueChanged<String?>? onSubmitted;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String>? validator;
  final bool hasBorder;
  final double circular;

  const InputTextFieldWidget({
    super.key,
    this.hasBorder = true,
    this.hintText,
    this.max,
    this.cursorColor,
    this.labelStyle,
    this.hintStyle,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.border,
    this.readOnly = false,
    this.textAlign,
    this.labelText,
    this.onSubmitted,
    this.textInputAction,
    this.enabled = true,
    required this.keyName,
    this.textInputType,
    this.initialValue,
    this.isEmail = false,
    this.isNumeric = false,
    this.isRequired = true,
    this.isUrl = false,
    this.isFill = false,
    // this.fillColor,
    this.minLine,
    this.autoFocus = false,
    this.prefixIcon,
    this.style,
    this.inputBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.fillColor,
    this.contentPadding,
    this.circular = 12,
    this.onChanged,
    this.suffix,
    this.suffixIconConstraints,
    this.focusNode,
    this.validator,
  });

  @override
  State<InputTextFieldWidget> createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  late String text;
  bool isRTL = false;

  @override
  void initState() {
    super.initState();
    text = widget.hintText ?? widget.labelText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Visibility(
        //   visible: widget.labelText != null,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       AutoSizeText(
        //         widget.labelText ?? 'none',
        //         style: Get.textTheme.subtitle2!.copyWith(
        //           color: Get.theme.primaryColor,
        //         ),
        //       ),
        //       UiHelper.verticalSpaceSmall,
        //     ],
        //   ),
        // ),
        FormBuilderTextField(
            // autovalidateMode:AutovalidateMode.onUserInteraction ,
            // selectionControls: ,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            textAlign: widget.textAlign ?? TextAlign.start,
            cursorColor: widget.cursorColor,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            name: widget.keyName,
            style: widget.style ??
                getSemiBoldStyle(color: AppColors.textStyle, fontSize: 14.sp),
            minLines: widget.minLine,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            initialValue: widget.initialValue,
            autofocus: widget.autoFocus!,

            // textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              labelText: widget.labelText,
              // label: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Container(
              //       height: 8,
              //       width: 8,
              //       color: Get.theme.primaryColor,
              //       margin: EdgeInsets.symmetric(horizontal: 8.0),
              //     ),
              //     Text(widget.labelText ?? ''),
              //   ],
              // ),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(vertical: 13.4.h, horizontal: 9.w),
              hintText: widget.hintText,
              alignLabelWithHint: true,
              fillColor: widget.fillColor,
              filled: widget.isFill,
              hintStyle:
                  widget.hintStyle ?? Theme.of(context).textTheme.bodyLarge,
              labelStyle:
                  widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
              suffixIcon: widget.suffixIcon,
              suffixIconConstraints: widget.suffixIconConstraints,
              suffix: widget.suffix,
              prefixIcon: widget.prefixIcon,
              isDense: true,

              focusedBorder: widget.focusedBorder ??
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
                    borderSide: widget.hasBorder
                        ? const BorderSide(
                            color: AppColors.white,
                            width: 1,
                          )
                        : BorderSide.none,
                    // borderSide: BorderSide.none,
                  ),

              border: widget.border ??
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
            inputFormatters: widget.inputFormatters ?? getEmailInputFormatter(),
            onReset: () {
              setState(() {
                text = widget.labelText ?? widget.hintText ?? '';
              });
            },
            onSubmitted: widget.onSubmitted,
            validator: FormBuilderValidators.compose([
              if (widget.isRequired) FormBuilderValidators.required(),

              if (widget.isEmail) FormBuilderValidators.email(),
              if (widget.isNumeric) FormBuilderValidators.numeric(),
              if (widget.max != null)
                FormBuilderValidators.minLength(widget.max!),
              if (widget.isUrl) FormBuilderValidators.url(),
              if (widget.validator != null) widget.validator!,

              // if (widget.isEqual) (val) {
              //
              //   if (val != widget.titleEqual) {
              //     return 'Not Match Passwords';
              //   } else {
              //     return null;
              //   }
              // },
            ]),
            keyboardType: getKeyboardType(),
            onChanged: widget.onChanged
            // (str) {
            //   if (!mounted) return;
            //   setState(() {
            //     text = str!;
            //   });
            //   if (widget.onChange != null) {
            //     widget.onChange!.call(str!);
            //   }
            // },
            ),
      ],
    );
  }

  TextInputType? getKeyboardType() {
    if (widget.textInputType != null) {
      return widget.textInputType;
    } else {
      return (widget.minLine != null && widget.minLine! >= 7)
          ? TextInputType.multiline
          : TextInputType.text;
    }
  }

  List<TextInputFormatter>? getEmailInputFormatter() {
    return widget.isEmail
        ? [
            FilteringTextInputFormatter.deny(
              RegExp('[ ]'),
            )
          ]
        : null;
  }
}

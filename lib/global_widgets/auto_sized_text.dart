import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoSizedTextWidget extends StatefulWidget {
  final String text;
  final double maxFontSize;
  final int maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;
  final FontWeight? fontWeight;
  const AutoSizedTextWidget({

    required this.text,
    this.maxFontSize = 24.0,
    this.maxLines = 3,
    super.key, this.style, this.textAlign, this.fontWeight,
  });

  @override
  State<AutoSizedTextWidget>  createState() => _AutoSizedTextState();
}

class _AutoSizedTextState extends State<AutoSizedTextWidget> {
  late double fontSize;

  @override
  void initState() {
    super.initState();
    fontSize = widget.maxFontSize; // تعيين حجم النص الأقصى كبداية
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // حساب الحجم المطلوب باستخدام TextPainter
        while (_doesTextExceedMaxLines(widget.text, fontSize, constraints.maxWidth-20.w)) {

          fontSize -= 1; // تصغير حجم النص حتى يناسب الحد الأقصى للأسطر
          if (fontSize < 8) break; // إيقاف التصغير إذا وصلنا إلى حجم صغير جدًا
        }

        return Text(
          widget.text,
          style: TextStyle(fontSize: fontSize,fontWeight: widget.fontWeight),
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
        );
      },
    );
  }

  bool _doesTextExceedMaxLines(String text, double fontSize, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: maxWidth);
    return textPainter.didExceedMaxLines; // يتحقق إذا تجاوز النص الحد الأقصى للأسطر
  }
}

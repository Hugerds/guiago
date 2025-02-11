import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.textColor,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.overflow,
    this.letterSpacing,
    this.maxLines,
    this.verticalSpacing,
    this.fontFamily,
  });
  final String text;
  final Color? textColor;
  final double? verticalSpacing;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final int? maxLines;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decorationColor: disabledFont,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        height: verticalSpacing,
        color: textColor ?? Theme.of(context).textTheme.bodyMedium?.color ?? font,
        fontSize: fontSize ?? Theme.of(context).textTheme.bodyMedium?.fontSize ?? context.font_14sp,
        fontWeight: fontWeight ?? Theme.of(context).textTheme.bodyMedium?.fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily ?? Theme.of(context).textTheme.bodyMedium?.fontFamily,
      ),
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';

class ButtonWidget extends StatefulWidget {
  /// Widget padrão para os botões utilizados no sistema
  const ButtonWidget({
    required this.title,
    required this.onPressed,
    super.key,
    this.fontSize,
    this.color,
    this.fontColor,
    this.ignoring,
    this.width,
    this.height,
    this.iconePath,
    this.usesLoading = false,
    this.complementText,
    this.borderColor,
    this.iconButton,
    this.borderRadius,
    this.fontWeight,
    this.isLoading,
    this.isFixedSize = true,
  });
  final String title;
  final double? fontSize;
  final Color? color;
  final Color? fontColor;
  final bool? ignoring;
  final double? height;
  final double? width;
  final String? iconePath;
  final FontWeight? fontWeight;
  final FutureOr<void> Function()? onPressed;
  final bool usesLoading;
  final Widget? complementText;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? iconButton;
  final bool? isLoading;
  final bool isFixedSize;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool botaoExecutando = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.ignoring ?? false,
      child: ElevatedButton(
        onPressed: () async {
          if (!botaoExecutando) {
            if (mounted) {
              setState(() => botaoExecutando = true);
            }
            if (mounted && widget.onPressed != null) {
              await widget.onPressed!();
            }
            if (mounted) {
              setState(() => botaoExecutando = false);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            side: widget.borderColor == null ? BorderSide.none : BorderSide(color: widget.borderColor!),
          ),
          backgroundColor: widget.color,
          shadowColor: transparent,
          fixedSize: widget.isFixedSize ? Size(widget.width ?? 190.w, widget.height ?? 6.5.h) : null,
          minimumSize: Size.zero,
        ),
        child: Row(
          mainAxisSize: widget.isFixedSize ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextWidget(
                widget.title,
                textColor: widget.fontColor ?? white,
                fontSize: widget.fontSize ?? context.font_14sp,
                fontWeight: semiBold,
              ),
            ),
            if (widget.complementText != null) widget.complementText!,
          ],
        ),
      ),
    );
  }
}

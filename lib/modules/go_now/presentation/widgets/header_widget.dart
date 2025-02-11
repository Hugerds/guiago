import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/painter/dashed_line_painter.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/tab_bar_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/horizontal_spacing_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/vertical_spacing_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            children: [
              const Icon(Icons.menu, color: white, size: 24),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const TabBarWidget(),
                ),
              ),
              const Icon(Icons.search, color: white, size: 24),
            ],
          ),
        ),
        const VerticalSpacing(1),
        SizedBox(
          width: 25.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    'zona sul',
                    fontSize: context.font_12sp,
                    textColor: white,
                    fontWeight: bold,
                  ),
                  const HorizontalSpacing(1),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: white,
                    size: 16,
                  ),
                ],
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLinePainter(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/shared/presentation/widgets/horizontal_spacing_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';

class IconFilterWidget extends StatelessWidget {
  const IconFilterWidget(this.label, {super.key, this.icon});

  final IconData? icon;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
      margin: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: font, size: 16),
          const HorizontalSpacing(1),
          TextWidget(
            label,
            fontSize: context.font_10sp,
            textColor: font,
            fontWeight: bold,
          ),
        ],
      ),
    );
  }
}

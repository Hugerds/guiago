import 'package:flutter/material.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/icon_filter_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: const BoxDecoration(
        color: secondPartBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(color: border),
        ),
      ),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconFilterWidget('filtros', icon: Icons.filter_alt),
            IconFilterWidget('com desconto'),
            IconFilterWidget('disponíveis'),
            IconFilterWidget('hidro'),
            IconFilterWidget('piscina'),
            IconFilterWidget('sauna'),
            IconFilterWidget('ofurô'),
          ],
        ),
      ),
    );
  }
}

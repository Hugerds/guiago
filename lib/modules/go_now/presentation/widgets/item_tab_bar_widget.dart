import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/modules/shared/presentation/widgets/horizontal_spacing_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';

class ItemTabBarWidget extends StatelessWidget {
  const ItemTabBarWidget({required this.active, required this.icon, required this.label, super.key});

  final bool active;

  final IconData icon;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active ? activeButton : white,
            size: 16,
          ),
          const HorizontalSpacing(2),
          TextWidget(
            label,
            fontSize: context.font_12sp,
            fontWeight: FontWeight.bold,
            textColor: active ? font : white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';

class MapButtonWidget extends StatelessWidget {
  const MapButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: white,
      label: const TextWidget(
        'mapa',
        textColor: primaryRed,
        fontWeight: mediumBold,
      ),
      icon: const Icon(
        Icons.map_outlined,
        color: primaryRed,
        size: 24,
      ),
    );
  }
}

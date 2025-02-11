import 'package:flutter/widgets.dart';
import 'package:guia_go/core/constants/colors.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = white
      ..strokeWidth = size.height
      ..style = PaintingStyle.stroke;

    const double dashWidth = 4;
    const double dashSpace = 2;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

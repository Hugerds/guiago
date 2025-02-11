import 'package:flutter/widgets.dart';

/// A widget that provides horizontal spacing. Based on a percentage of the screen width.
class HorizontalSpacing extends StatelessWidget {
  /// Creates a [HorizontalSpacing] widget.
  const HorizontalSpacing(this.spacing, {super.key});

  /// The percentage of the screen width that the spacing should occupy.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (spacing * 0.01),
    );
  }
}

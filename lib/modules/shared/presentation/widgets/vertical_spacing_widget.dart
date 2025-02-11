import 'package:flutter/widgets.dart';

/// A widget that provides vertical spacing. Based on a percentage of the screen height.
class VerticalSpacing extends StatelessWidget {
  /// Creates a [VerticalSpacing] widget.
  const VerticalSpacing(this.spacing, {super.key});

  /// The percentage of the screen height that the spacing should occupy.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (spacing * 0.01),
    );
  }
}

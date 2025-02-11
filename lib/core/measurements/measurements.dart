import 'package:flutter/widgets.dart';

void initMeasurements(BuildContext context) {
  Measurements.setMeasurements(context);
}

class Measurements {
  factory Measurements() => instance;
  Measurements._internal();
  late final double deviceHeight;
  late final double deviceWidth;

  static late Measurements instance;

  static void setMeasurements(BuildContext context) {
    instance = Measurements._internal()
      ..deviceHeight = MediaQuery.of(context).size.height
      ..deviceWidth = MediaQuery.of(context).size.width;
  }
}

extension ExtensionMedidasAplicativo on num {
  double get w => Measurements.instance.deviceWidth * (this / 100);

  double get h => Measurements.instance.deviceHeight * (this / 100);

  double get sp => this * (Measurements.instance.deviceHeight / 800);
}

import 'package:json_annotation/json_annotation.dart';

part 'discount_model.g.dart';

@JsonSerializable(createToJson: false)
class DiscountModel {
  DiscountModel({this.desconto});

  factory DiscountModel.fromJson(Map<String, dynamic> json) => _$DiscountModelFromJson(json);
  double? desconto;
}

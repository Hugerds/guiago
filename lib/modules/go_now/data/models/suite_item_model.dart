import 'package:json_annotation/json_annotation.dart';

part 'suite_item_model.g.dart';

@JsonSerializable(createToJson: false)
class SuiteItemModel {
  SuiteItemModel({this.nome});

  factory SuiteItemModel.fromJson(Map<String, dynamic> json) => _$SuiteItemModelFromJson(json);
  String? nome;
}

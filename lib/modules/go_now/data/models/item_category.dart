import 'package:json_annotation/json_annotation.dart';

part 'item_category.g.dart';

@JsonSerializable(createToJson: false)
class ItemCategoryModel {
  ItemCategoryModel({this.nome, this.icone});

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) => _$ItemCategoryModelFromJson(json);

  String? nome;
  String? icone;
}

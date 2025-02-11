import 'package:guia_go/modules/go_now/data/models/item_category.dart';
import 'package:guia_go/modules/go_now/data/models/suite_item_model.dart';
import 'package:guia_go/modules/go_now/data/models/suite_period_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suite_model.g.dart';

@JsonSerializable(createToJson: false)
class SuiteModel {
  SuiteModel({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) => _$SuiteModelFromJson(json);

  String? nome;
  int? qtd;
  bool? exibirQtdDisponiveis;
  List<String>? fotos;
  List<SuiteItemModel>? itens;
  List<ItemCategoryModel>? categoriaItens;
  List<SuitePeriodModel>? periodos;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get photo => fotos?.first;
}

import 'package:collection/collection.dart';
import 'package:guia_go/modules/go_now/data/models/suite_model.dart';
import 'package:guia_go/modules/go_now/data/models/suite_period_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motel_model.g.dart';

@JsonSerializable(createToJson: false)
class MotelModel {
  MotelModel({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) => _$MotelModelFromJson(json);

  String? fantasia;
  String? logo;
  String? bairro;
  double? distancia;
  int? qtdFavoritos;
  List<SuiteModel>? suites;
  int? qtdAvaliacoes;
  double? media;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get hasDiscount => suites?.any((e) => e.periodos?.any((e) => e.desconto != null) ?? false) ?? false;

  @JsonKey(includeFromJson: false, includeToJson: false)
  SuiteModel? get suiteWithDiscount => suites?.firstWhereOrNull((e) => e.periodos?.any((e) => e.desconto != null) ?? false);

  @JsonKey(includeFromJson: false, includeToJson: false)
  SuitePeriodModel? get periodWithDiscount => suiteWithDiscount?.periodos?.firstWhereOrNull((e) => e.desconto != null);

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get minorValueFormatted {
    if (periodWithDiscount == null) {
      return null;
    } else {
      return 'a partir de R\$ ${periodWithDiscount!.valorTotal}';
    }
  }
}

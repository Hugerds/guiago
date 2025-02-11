import 'package:guia_go/modules/go_now/data/models/motel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motel_list_data_model.g.dart';

@JsonSerializable(createToJson: false)
class MotelListDataModel {
  MotelListDataModel({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  factory MotelListDataModel.fromJson(Map<String, dynamic> json) => _$MotelListDataModelFromJson(json);
  int? pagina;
  int? qtdPorPagina;
  int? totalSuites;
  int? totalMoteis;
  int? raio;
  int? maxPaginas;
  List<MotelModel>? moteis;
}

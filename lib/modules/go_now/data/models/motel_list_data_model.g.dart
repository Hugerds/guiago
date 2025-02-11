// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_list_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelListDataModel _$MotelListDataModelFromJson(Map<String, dynamic> json) =>
    MotelListDataModel(
      pagina: (json['pagina'] as num?)?.toInt(),
      qtdPorPagina: (json['qtdPorPagina'] as num?)?.toInt(),
      totalSuites: (json['totalSuites'] as num?)?.toInt(),
      totalMoteis: (json['totalMoteis'] as num?)?.toInt(),
      raio: (json['raio'] as num?)?.toInt(),
      maxPaginas: (json['maxPaginas'] as num?)?.toInt(),
      moteis: (json['moteis'] as List<dynamic>?)
          ?.map((e) => MotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

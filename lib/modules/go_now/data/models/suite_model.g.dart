// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuiteModel _$SuiteModelFromJson(Map<String, dynamic> json) => SuiteModel(
      nome: json['nome'] as String?,
      qtd: (json['qtd'] as num?)?.toInt(),
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] as bool?,
      fotos:
          (json['fotos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => SuiteItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriaItens: (json['categoriaItens'] as List<dynamic>?)
          ?.map((e) => ItemCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodos: (json['periodos'] as List<dynamic>?)
          ?.map((e) => SuitePeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

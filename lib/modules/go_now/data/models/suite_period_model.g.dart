// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuitePeriodModel _$SuitePeriodModelFromJson(Map<String, dynamic> json) =>
    SuitePeriodModel(
      tempoFormatado: json['tempoFormatado'] as String?,
      tempo: json['tempo'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      valorTotal: (json['valorTotal'] as num?)?.toDouble(),
      temCortesia: json['temCortesia'] as bool?,
      desconto: json['desconto'] == null
          ? null
          : DiscountModel.fromJson(json['desconto'] as Map<String, dynamic>),
    );

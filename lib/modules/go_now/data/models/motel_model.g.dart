// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelModel _$MotelModelFromJson(Map<String, dynamic> json) => MotelModel(
      fantasia: json['fantasia'] as String?,
      logo: json['logo'] as String?,
      bairro: json['bairro'] as String?,
      distancia: (json['distancia'] as num?)?.toDouble(),
      qtdFavoritos: (json['qtdFavoritos'] as num?)?.toInt(),
      suites: (json['suites'] as List<dynamic>?)
          ?.map((e) => SuiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      qtdAvaliacoes: (json['qtdAvaliacoes'] as num?)?.toInt(),
      media: (json['media'] as num?)?.toDouble(),
    );

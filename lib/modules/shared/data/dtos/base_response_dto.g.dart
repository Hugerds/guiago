// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseDTO<T> _$BaseResponseDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseDTO<T>(
      sucesso: json['sucesso'] as bool?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      mensagem: (json['mensagem'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

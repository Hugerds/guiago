import 'package:json_annotation/json_annotation.dart';

part 'base_response_dto.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponseDTO<T> {
  BaseResponseDTO({this.sucesso, this.data, this.mensagem});

  factory BaseResponseDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseDTOFromJson(json, fromJsonT);

  bool? sucesso;
  @JsonKey(includeIfNull: false)
  T? data;
  @JsonKey(includeIfNull: false)
  List<Object>? mensagem;
}

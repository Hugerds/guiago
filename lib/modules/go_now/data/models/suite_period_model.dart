import 'package:guia_go/modules/go_now/data/models/discount_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suite_period_model.g.dart';

@JsonSerializable(createToJson: false)
class SuitePeriodModel {
  SuitePeriodModel({this.tempoFormatado, this.tempo, this.valor, this.valorTotal, this.temCortesia, this.desconto});

  factory SuitePeriodModel.fromJson(Map<String, dynamic> json) => _$SuitePeriodModelFromJson(json);

  String? tempoFormatado;
  String? tempo;
  double? valor;
  double? valorTotal;
  bool? temCortesia;
  DiscountModel? desconto;

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get discountValue {
    if (desconto?.desconto == null || valor == null) {
      return null;
    } else {
      final discountPercent = desconto!.desconto! / valor! * 100;
      return '${discountPercent.toStringAsFixed(0)}% off';
    }
  }

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get formattedDiscount {
    if (desconto?.desconto == null || valor == null) {
      return null;
    } else {
      final discountPercent = desconto!.desconto! / valor! * 100;
      return '${discountPercent.toStringAsFixed(0)}% de desconto';
    }
  }

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get formattedTotalValue {
    return 'R\$ ${valorTotal?.toStringAsFixed(2) ?? 0.0}';
  }

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? get formattedValue {
    return 'R\$ ${valor?.toStringAsFixed(2) ?? 0.0}';
  }
}

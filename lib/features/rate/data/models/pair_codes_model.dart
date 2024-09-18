import '../../domain/entities/pair_codes.dart';

class PairCodesModel extends PairCodes {
  PairCodesModel({
    required super.result,
    required super.documentation,
    required super.termsOfUse,
    required super.timeLastUpdateUnix,
    required super.timeLastUpdateUtc,
    required super.timeNextUpdateUnix,
    required super.timeNextUpdateUtc,
    required super.baseCode,
    required super.targetCode,
    required super.conversionRate,
  });

  factory PairCodesModel.fromJson(Map<String, dynamic> json) {
    return PairCodesModel(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['termsOfUse'] ?? '',
      timeLastUpdateUnix: json['time_last_update_unix'].toString(),
      timeLastUpdateUtc: json['time_last_update_utc'],
      timeNextUpdateUnix: json['time_next_update_unix'].toString(),
      timeNextUpdateUtc: json['time_next_update_utc'],
      baseCode: json['base_code'],
      targetCode: json['target_code'],
      conversionRate: json['conversion_rate'].toString(),
    );
  }
}

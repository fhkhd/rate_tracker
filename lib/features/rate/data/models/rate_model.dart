import 'package:rate_tracker/features/rate/data/models/rate_code_model.dart';
import 'package:rate_tracker/features/rate/domain/entities/rate.dart';

class RateModel extends Rate {
  RateModel({
    required super.result,
    required super.documentation,
    required super.termsOfUse,
    super.timeLastUpdateUnix,
    super.timeLastUpdateUtc,
    super.timeNextUpdateUnix,
    super.timeNextUpdateUtc,
    super.baseCode,
    super.targetCode,
    super.conversionRate,
    super.conversionRates,
    super.supportedCodes,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['termsOfUse'] ?? '',
      timeLastUpdateUnix: json['timeLastUpdateUnix'],
      timeLastUpdateUtc: json['timeLastUpdateUtc'],
      timeNextUpdateUnix: json['timeNextUpdateUnix'],
      timeNextUpdateUtc: json['timeNextUpdateUtc'],
      baseCode: json['baseCode'],
      targetCode: json['targetCode'],
      conversionRate: json['conversionRate'],
      conversionRates: json['conversionRates'],
      supportedCodes: (json['supported_codes'] as List?)
          ?.map((dynamic e) => RateCodeModel.fromJson(e as List))
          .toList(),
    );
  }

  RateModel copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    String? timeLastUpdateUnix,
    String? timeLastUpdateUtc,
    String? timeNextUpdateUnix,
    String? timeNextUpdateUtc,
    String? baseCode,
    String? targetCode,
    double? conversionRate,
    Map<String, double?>? conversionRates,
    List<RateCodeModel>? supportedCodes,
  }) {
    return RateModel(
      result: result ?? this.result,
      documentation: documentation ?? this.documentation,
      termsOfUse: termsOfUse ?? this.termsOfUse,
      timeLastUpdateUnix: timeLastUpdateUnix ?? this.timeLastUpdateUnix,
      timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
      timeNextUpdateUnix: timeNextUpdateUnix ?? this.timeNextUpdateUnix,
      timeNextUpdateUtc: timeNextUpdateUtc ?? this.timeNextUpdateUtc,
      baseCode: baseCode ?? this.baseCode,
      targetCode: targetCode ?? this.targetCode,
      conversionRate: conversionRate ?? this.conversionRate,
      conversionRates: conversionRates ?? this.conversionRates,
      supportedCodes: supportedCodes ?? this.supportedCodes,
    );
  }
}

import 'package:rate_tracker/features/rate/domain/entities/rate_codes.dart';

class RateCodesModel extends RateCodes {
  RateCodesModel({
    required super.result,
    required super.documentation,
    required super.termsOfUse,
    required super.supportedCodes,
  });

  factory RateCodesModel.fromJson(Map<String, dynamic> json) {
    return RateCodesModel(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['termsOfUse'] ?? '',
      supportedCodes: (json['supported_codes'] as List?)
          ?.map((dynamic e) => RateCodeModel.fromJson(e as List))
          .toList(),
    );
  }

  RateCodesModel copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    List<RateCodeModel>? supportedCodes,
  }) {
    return RateCodesModel(
      result: result ?? this.result,
      documentation: documentation ?? this.documentation,
      termsOfUse: termsOfUse ?? this.termsOfUse,
      supportedCodes: this.supportedCodes,
    );
  }
}

class RateCodeModel extends RateCode {
  RateCodeModel({
    required super.code,
    required super.fullName,
  });

  factory RateCodeModel.fromJson(List<dynamic> json) {
    return RateCodeModel(
      code: json[0],
      fullName: json[1],
    );
  }

  RateCodeModel copyWith({
    String? code,
    String? fullName,
  }) {
    return RateCodeModel(
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
    );
  }
}

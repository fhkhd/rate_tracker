import 'package:rate_tracker/features/rate/domain/entities/rate_code.dart';

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

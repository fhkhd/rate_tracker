class RateCodes {
  final String result;
  final String documentation;
  final String termsOfUse;
  List<RateCode>? supportedCodes;

  RateCodes({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    this.supportedCodes,
  });
}

class RateCode {
  final String code;
  final String fullName;
  String? symbol;

  RateCode({
    required this.code,
    required this.fullName,
    this.symbol,
  });
}

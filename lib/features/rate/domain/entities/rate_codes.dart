class RateCodes {
  final String result;
  final String documentation;
  final String termsOfUse;
  final List<RateCode>? supportedCodes;

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

  RateCode({
    required this.code,
    required this.fullName,
  });
}

class PairCodes {
  final String result;
  final String documentation;
  final String termsOfUse;
  final String timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final String timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final String targetCode;
  final String conversionRate;

  PairCodes({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
  });
}

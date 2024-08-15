class Rate {
  final String result;
  final String documentation;
  final String termsOfUse;
  final String? timeLastUpdateUnix;
  final String? timeLastUpdateUtc;
  final String? timeNextUpdateUnix;
  final String? timeNextUpdateUtc;
  final String? baseCode;
  final String? targetCode;
  final double? conversionRate;
  final Map<String, double?>? conversionRates;
  final List<String>? supportedCodes;

  Rate({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.targetCode,
    this.conversionRate,
    this.conversionRates,
    this.supportedCodes,
  });
}

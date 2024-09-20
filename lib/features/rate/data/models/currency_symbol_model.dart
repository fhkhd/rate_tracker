class CurrencySymbolModel {
  final String currency;
  final String abbreviation;
  final String symbol;

  CurrencySymbolModel({
    required this.currency,
    required this.abbreviation,
    required this.symbol,
  });

  factory CurrencySymbolModel.fromJson(Map<String, dynamic> json) {
    return CurrencySymbolModel(
      currency: json["currency"].toString(),
      abbreviation: json["abbreviation"].toString(),
      symbol: json["symbol"].toString(),
    );
  }
}

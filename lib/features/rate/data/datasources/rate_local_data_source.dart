import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/secret/keys.dart';
import '../models/currency_symbol_model.dart';

abstract interface class RateLocalDataSource {
  Future<String> getApiKey();

  Future<List<CurrencySymbolModel>> getCurrencySymbols();
}

class RateLocalDataSourceImpl implements RateLocalDataSource {
  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.rateApiKey;
  }

  @override
  Future<List<CurrencySymbolModel>> getCurrencySymbols() async {
    try {
      List<CurrencySymbolModel> currencies = [];
      final jsonString =
          await rootBundle.loadString('assets/rates/symbols.json');
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      for (var json in jsonList) {
        var currency = CurrencySymbolModel.fromJson(json);
        currencies.add(currency);
      }
      return currencies;
    } catch (e) {
      throw Exception('Error loading symbols.json: $e');
    }
  }
}

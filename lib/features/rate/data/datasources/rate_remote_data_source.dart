import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/secret/keys.dart';
import '../models/rate_codes_model.dart';

abstract interface class RateRemoteDataSource {
  Future<RateCodesModel> getRate();

  Future<String> getApiKey();
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  @override
  Future<RateCodesModel> getRate() async {
    String apiKey = await getApiKey();
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
    );
    return RateCodesModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.rateApiKey;
  }
}

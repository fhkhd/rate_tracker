import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rate_tracker/features/rate/data/models/rate_model.dart';

import '../../../../core/secret/keys.dart';

abstract interface class RateRemoteDataSource {
  Future<RateModel> getRate();

  Future<String> getApiKey();
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  @override
  Future<RateModel> getRate() async {
    String apiKey = await getApiKey();
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
    );
    print("status code : ${response.statusCode}");
    print(jsonDecode(response.body)['supported_codes']);
    throw UnimplementedError();
  }

  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.rateApiKey;
  }
}

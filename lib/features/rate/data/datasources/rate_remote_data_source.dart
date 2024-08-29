import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rate_tracker/core/secrect/keys.dart';
import 'package:rate_tracker/features/rate/data/models/rate_model.dart';

abstract interface class RateRemoteDataSource {
  Future<RateModel> getRate();
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  @override
  Future<RateModel> getRate() async {
    SecretLoader secretLoader = SecretLoader(secretPath: "assets/secret.json");
    Secret secret = await secretLoader.load();
    String apiKey = secret.rateApiKey;
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
    );
    print(jsonDecode(response.body)['supported_codes']);
    throw UnimplementedError();
  }
}

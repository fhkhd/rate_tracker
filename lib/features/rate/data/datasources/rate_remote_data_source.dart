import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../../core/secret/keys.dart';
import '../models/rate_codes_model.dart';

abstract interface class RateRemoteDataSource {
  Future<RateCodesModel> getRateCodes();

  Future<String> getApiKey();
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  @override
  Future<RateCodesModel> getRateCodes() async {
    try {
      String apiKey = await getApiKey();
      final response = await http.get(
        Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RateCodesModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException("Error : ${response.statusCode.toString()}");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.rateApiKey;
  }
}

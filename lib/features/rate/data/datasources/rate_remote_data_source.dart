import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/pair_codes_model.dart';
import '../models/rate_codes_model.dart';

abstract interface class RateRemoteDataSource {
  Future<RateCodesModel> getRateCodes({required String apiKey});

  Future<PairCodesModel> pairRateCodes({
    required String apiKey,
    required String firstCode,
    required String secondCode,
  });
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  @override
  Future<RateCodesModel> getRateCodes({
    required String apiKey,
  }) async {
    try {
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
  Future<PairCodesModel> pairRateCodes({
    required String apiKey,
    required String firstCode,
    required String secondCode,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://v6.exchangerate-api.com/v6/$apiKey/pair/$firstCode/$secondCode'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return PairCodesModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException("Error : ${response.statusCode.toString()}");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}

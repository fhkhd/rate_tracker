import 'package:fpdart/fpdart.dart';
import 'package:rate_tracker/features/rate/data/datasources/rate_local_data_source.dart';
import 'package:rate_tracker/features/rate/domain/entities/pair_codes.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/entities/rate_codes.dart';
import '../../domain/repositories/rate_repository.dart';
import '../datasources/rate_remote_data_source.dart';
import '../models/currency_symbol_model.dart';

class RateRepositoryImpl implements RateRepository {
  final RateRemoteDataSource rateRemoteDataSource;
  final RateLocalDataSource rateLocalDataSource;
  final ConnectionChecker connectionChecker;

  RateRepositoryImpl(
    this.rateRemoteDataSource,
    this.rateLocalDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, RateCodes>> getRateCodes() async {
    String apiKey = await rateLocalDataSource.getApiKey();
    List<CurrencySymbolModel> currencies =
        await rateLocalDataSource.getCurrencySymbols();
    try {
      final rate = await rateRemoteDataSource.getRateCodes(apiKey: apiKey);
      rate.supportedCodes?.forEach((rateCode) {
        for (var currency in currencies) {
          if (currency.abbreviation == rateCode.code) {
            rateCode.symbol = currency.symbol;
          }
        }
      });
      return right(rate);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, PairCodes>> pairRateCodes({
    required String firstCode,
    required String secondCode,
  }) async {
    String apiKey = await rateLocalDataSource.getApiKey();
    try {
      final pair = await rateRemoteDataSource.pairRateCodes(
        apiKey: apiKey,
        firstCode: firstCode,
        secondCode: secondCode,
      );
      return right(pair);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

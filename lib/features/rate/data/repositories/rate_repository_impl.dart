import 'package:fpdart/fpdart.dart';
import 'package:rate_tracker/features/rate/domain/entities/pair_codes.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/entities/rate_codes.dart';
import '../../domain/repositories/rate_repository.dart';
import '../datasources/rate_remote_data_source.dart';

class RateRepositoryImpl implements RateRepository {
  final RateRemoteDataSource rateRemoteDataSource;
  final ConnectionChecker connectionChecker;

  RateRepositoryImpl(
    this.rateRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, RateCodes>> getRateCodes() async {
    try {
      final rate = await rateRemoteDataSource.getRateCodes();
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
    try {
      final pair = await rateRemoteDataSource.pairRateCodes(
        firstCode: firstCode,
        secondCode: secondCode,
      );
      return right(pair);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

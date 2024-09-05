import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/entities/rate.dart';
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
  Future<Either<Failure, Rate>> getRate() async {
    try {
      final rate = await rateRemoteDataSource.getRate();
      return right(rate);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

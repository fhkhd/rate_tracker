import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/pair_codes.dart';
import '../entities/rate_codes.dart';

abstract interface class RateRepository {
  Future<Either<Failure, RateCodes>> getRateCodes();

  Future<Either<Failure, PairCodes>> pairRateCodes({
    required String firstCode,
    required String secondCode,
  });
}

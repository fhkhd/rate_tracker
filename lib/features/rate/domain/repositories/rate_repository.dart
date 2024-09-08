import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/rate_codes.dart';

abstract interface class RateRepository {
  Future<Either<Failure, RateCodes>> getRateCodes();
}

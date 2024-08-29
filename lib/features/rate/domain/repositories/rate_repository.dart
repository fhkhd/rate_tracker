import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/rate.dart';

abstract interface class RateRepository {
  Future<Either<Failure, Rate>> getRate();
}

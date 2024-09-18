import 'package:fpdart/src/either.dart';

import 'package:rate_tracker/core/error/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/pair_codes.dart';

class PairRateCodes implements UseCase<PairCodes, PairCodesParams> {
  @override
  Future<Either<Failure, PairCodes>> call(PairCodesParams params) {
    throw UnimplementedError();
  }
}

class PairCodesParams {
  final String firstCode;
  final String secondCode;

  PairCodesParams({
    required this.firstCode,
    required this.secondCode,
  });
}

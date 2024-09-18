import 'package:fpdart/src/either.dart';

import 'package:rate_tracker/core/error/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/pair_codes.dart';
import '../repositories/rate_repository.dart';

class PairRateCodes implements UseCase<PairCodes, PairCodesParams> {
  final RateRepository rateRepository;

  PairRateCodes(this.rateRepository);

  @override
  Future<Either<Failure, PairCodes>> call(PairCodesParams params) async {
    return await rateRepository.pairRateCodes(
      firstCode: params.firstCode,
      secondCode: params.secondCode,
    );
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

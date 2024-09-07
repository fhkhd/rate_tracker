import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/rate_codes.dart';
import '../repositories/rate_repository.dart';

class GetRateCodes implements UseCase<RateCodes, NoParams> {
  final RateRepository rateRepository;

  GetRateCodes(this.rateRepository);

  @override
  Future<Either<Failure, RateCodes>> call(NoParams params) async {
    return await rateRepository.getRate();
  }
}

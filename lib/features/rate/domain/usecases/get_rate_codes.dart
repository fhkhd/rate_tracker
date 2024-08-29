import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/rate.dart';
import '../repositories/rate_repository.dart';

class GetRateCodes implements UseCase<Rate, NoParams> {
  final RateRepository rateRepository;

  GetRateCodes(this.rateRepository);

  @override
  Future<Either<Failure, Rate>> call(NoParams params) async {
    return await rateRepository.getRate();
  }
}

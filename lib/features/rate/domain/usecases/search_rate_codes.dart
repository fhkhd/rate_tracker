import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/rate_codes.dart';
import '../repositories/rate_repository.dart';

class SearchRateCodes implements UseCase<RateCodes, SearchValue> {
  final RateRepository rateRepository;

  SearchRateCodes(this.rateRepository);

  @override
  Future<Either<Failure, RateCodes>> call(SearchValue value) async {
    return await rateRepository.getRateCodes();
  }
}

class SearchValue {
  final String value;

  SearchValue({required this.value});
}

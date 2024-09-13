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
    final res = await rateRepository.getRateCodes();
    res.fold(
      (l) {},
      (r) {
        RateCodes? rateCodes = RateCodes(
          documentation: '',
          result: '',
          termsOfUse: '',
          supportedCodes: [],
        );
        for (var result in r.supportedCodes!) {
          if (result.code.toString().contains(value.value.toUpperCase()) &&
              value.value != "") {
            rateCodes.supportedCodes?.add(result);
          }
        }
        r.supportedCodes = rateCodes.supportedCodes;
      },
    );
    return res;
  }
}

class SearchValue {
  final String value;

  SearchValue({required this.value});
}

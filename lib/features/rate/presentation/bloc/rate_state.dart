part of 'rate_bloc.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class RateFailure extends RateState {
  final String error;

  RateFailure(this.error);
}

final class RateSearchDisplaySuccess extends RateState {
  final RateCodes rateCodes;
  final RateCode? rateCode;

  RateSearchDisplaySuccess(this.rateCodes, this.rateCode);
}

final class FirstRateSearch extends RateState {
  final RateCode firstRateCode;

  FirstRateSearch(this.firstRateCode);
}

final class SecondRateSearch extends FirstRateSearch {
  final RateCode secondRateCode;

  SecondRateSearch(super.firstRateCode, this.secondRateCode);
}

final class RatePairRatesResult extends SecondRateSearch {
  final PairCodes pairCodes;

  RatePairRatesResult(
    this.pairCodes,
    super.firstRateCode,
    super.secondRateCode,
  );
}

final class RateCalculatePairedResult extends RatePairRatesResult {
  RateCalculatePairedResult(
    super.pairCodes,
    super.firstRateCode,
    super.secondRateCode,
  );
}

final class RateCalculatedResult extends RateCalculatePairedResult {
  final String index;
  final String calculateResult;

  RateCalculatedResult(
    super.pairCodes,
    super.firstRateCode,
    super.secondRateCode,
    this.index,
    this.calculateResult,
  );
}

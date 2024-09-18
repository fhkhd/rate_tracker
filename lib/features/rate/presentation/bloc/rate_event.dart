part of 'rate_bloc.dart';

@immutable
sealed class RateEvent {}

final class RateSearchRateCode extends RateEvent {
  final String value;
  final RateCode? firstRateCode;

  RateSearchRateCode({required this.value, this.firstRateCode});
}

final class RateSelectFirstRateCode extends RateEvent {
  final RateCode firstRateCode;

  RateSelectFirstRateCode({required this.firstRateCode});
}

final class RateSelectSecondRateCode extends RateSelectFirstRateCode {
  final RateCode secondRateCode;

  RateSelectSecondRateCode({
    required super.firstRateCode,
    required this.secondRateCode,
  });
}

final class RateRestSelection extends RateEvent {}

final class RatePairRateCodes extends RateEvent {
  final String firstCode;
  final String secondCode;

  RatePairRateCodes({
    required this.firstCode,
    required this.secondCode,
  });
}

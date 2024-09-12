part of 'rate_bloc.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class RateFailure extends RateState {
  final String error;

  RateFailure(this.error);
}

final class RateUploadSuccess extends RateState {}

final class RateSearchFailure extends RateState {
  final String error;

  RateSearchFailure(this.error);
}

final class RateSearchDisplaySuccess extends RateState {
  final RateCodes rateCodes;

  RateSearchDisplaySuccess(this.rateCodes);
}

final class FirstRateSearch extends RateState {}

final class SecondRateSearch extends RateState {}

final class RateDisplaySuccess extends RateState {
  final RateCodes rateCodes;

  RateDisplaySuccess(this.rateCodes);
}

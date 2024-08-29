part of 'rate_bloc.dart';

@immutable
sealed class RateEvent {}

final class RateFetchAllRateCodes extends RateEvent {}

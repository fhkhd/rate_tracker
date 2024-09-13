part of 'rate_bloc.dart';

@immutable
sealed class RateEvent {}

final class RateSearchRateCode extends RateEvent {
  final String value;

  RateSearchRateCode({required this.value});
}

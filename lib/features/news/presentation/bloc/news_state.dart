part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsFailure extends NewsState {
  final String error;

  NewsFailure(this.error);
}

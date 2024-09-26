part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsSelectChip extends NewsEvent {
  final String query;

  NewsSelectChip({required this.query});
}

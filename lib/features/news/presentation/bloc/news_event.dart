part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsSelectChip extends NewsEvent {
  final String query;

  NewsSelectChip({required this.query});
}

final class NewsSelectArticleCard extends NewsEvent {
  final List<Article> articles;
  final Article article;
  final String query;

  NewsSelectArticleCard({
    required this.query,
    required this.articles,
    required this.article,
  });
}

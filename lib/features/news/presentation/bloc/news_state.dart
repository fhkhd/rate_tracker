part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsFailure extends NewsState {
  final String error;

  NewsFailure(this.error);
}

final class ArticleDisplaySuccess extends NewsState {
  final List<Article> articles;
  final String query;

  ArticleDisplaySuccess(this.articles, this.query);
}

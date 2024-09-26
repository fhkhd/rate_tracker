import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_tracker/features/news/domain/entities/article.dart';
import 'package:rate_tracker/features/news/domain/usecases/get_articles.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetArticles _getArticles;

  NewsBloc({
    required GetArticles getArticles,
  })  : _getArticles = getArticles,
        super(NewsInitial()) {
    on<NewsEvent>((event, emit) => emit(NewsLoading()));
    on<NewsSelectChip>(_onNewsSelectChip);
  }

  void _onNewsSelectChip(
    NewsSelectChip event,
    Emitter<NewsState> emit,
  ) async {
    final res = await _getArticles(NewsQuery(
      query: event.query,
    ));
    res.fold(
      (l) => emit(NewsFailure(l.message)),
      (r) => emit(ArticleDisplaySuccess(r)),
    );
  }
}

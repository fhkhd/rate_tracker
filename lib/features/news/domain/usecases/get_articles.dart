import 'package:fpdart/src/either.dart';
import 'package:rate_tracker/core/error/failures.dart';
import 'package:rate_tracker/core/usecase/usecase.dart';
import 'package:rate_tracker/features/news/domain/repositories/news_repository.dart';

import '../entities/article.dart';

class GetArticles implements UseCase<List<Article>, NewsQuery> {
  final NewsRepository newsRepository;

  GetArticles(this.newsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(NewsQuery params) async {
    return await newsRepository.getArticles(query: params.query);
  }
}

class NewsQuery {
  final String query;

  NewsQuery({required this.query});
}

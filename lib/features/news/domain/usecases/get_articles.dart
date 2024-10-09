import 'package:fpdart/fpdart.dart';
import 'package:rate_tracker/core/error/failures.dart';
import 'package:rate_tracker/core/usecase/usecase.dart';
import 'package:rate_tracker/features/news/domain/repositories/news_repository.dart';

import '../entities/article.dart';

class GetArticles implements UseCase<List<Article>, NewsQuery> {
  final NewsRepository newsRepository;

  GetArticles(this.newsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(NewsQuery params) async {
    var res = await newsRepository.getArticles(query: params.query);
    List<Article> articles = [];
    res.fold(
        (l) => {},
        (r) => {
              for (var result in r)
                {
                  if (result.name != "[Removed]") {articles.add(result)}
                },
              r.clear(),
              for (var article in articles) {r.add(article)}
            });
    return res;
  }
}

class NewsQuery {
  final String query;

  NewsQuery({required this.query});
}

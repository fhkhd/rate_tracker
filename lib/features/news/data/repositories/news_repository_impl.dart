import 'package:fpdart/src/either.dart';

import 'package:rate_tracker/core/error/failures.dart';

import 'package:rate_tracker/features/news/domain/entities/article.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_local_data_source.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl(
    this.newsRemoteDataSource,
    this.newsLocalDataSource,
  );

  @override
  Future<Either<Failure, List<Article>>> getArticles({
    required String query,
  }) async {
    String apiKey = await newsLocalDataSource.getApiKey();
    try {
      final articles = await newsRemoteDataSource.getArticle(
        apiKey: apiKey,
        query: query,
      );
      return right(articles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

import 'package:fpdart/src/either.dart';

import 'package:rate_tracker/core/error/failures.dart';

import 'package:rate_tracker/features/news/domain/entities/article.dart';

import '../../domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Either<Failure, List<Article>>> getArticles({required String query}) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
}

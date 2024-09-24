import 'package:fpdart/fpdart.dart';
import 'package:rate_tracker/features/news/domain/entities/article.dart';

import '../../../../core/error/failures.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<Article>>> getArticles({
    required String query,
  });
}

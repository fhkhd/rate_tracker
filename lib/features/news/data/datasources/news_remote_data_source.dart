import 'dart:convert';

import 'package:rate_tracker/features/news/data/models/article_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<ArticleModel>> getArticle({
    required String apiKey,
    required String query,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<ArticleModel>> getArticle({
    required String apiKey,
    required String query,
  }) async {
    List<ArticleModel> articleModels = [];
    try {
      final response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?apiKey=${apiKey}q=$query'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var articles = jsonDecode(response.body)['articles'] as List?;
        articles?.forEach((article) {
          articleModels.add(ArticleModel.fromJson(article));
        });
        return articleModels;
      } else {
        throw ServerException("Error : ${response.statusCode.toString()}");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}

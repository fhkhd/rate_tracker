import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    required super.id,
    required super.name,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['source']['id'] ?? 'null',
      name: json['source']['name'] ?? 'null',
      author: json['author'] ?? 'null',
      title: json['title'] ?? 'null',
      description: json['description'] ?? 'null',
      url: json['url'] ?? 'null',
      urlToImage: json['urlToImage'] ?? 'null',
      publishedAt: json['publishedAt'] ?? 'null',
      content: json['content'] ?? 'null',
    );
  }
}

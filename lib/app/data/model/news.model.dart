import 'package:sparrow_connected_test/app/data/model/article.model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Article> articles;

  NewsModel({required this.status, required this.totalResults, required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<Article>.from(json['articles'].map((article) => Article.fromJson(article))),
    );
  }
}

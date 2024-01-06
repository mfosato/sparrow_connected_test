import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sparrow_connected_test/app/core/errors.dart';
import 'package:sparrow_connected_test/app/core/strings.dart';
import 'package:sparrow_connected_test/app/data/model/news.model.dart';

const String baseUrl = 'https://newsapi.org/v2';

class MyApiClient {
  Future<Either<Failure, NewsModel>> getAllNews() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/top-headlines?country=us&apiKey=${AppStrings().apiKey}'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        NewsModel news = NewsModel.fromJson(jsonResponse);
        return Right(news);
      } else if (response.statusCode == 404) {
        return Left(NotFoundFailure(response.body));
      } else {
        return Left(ServerFailure(response.body));
      }
    }  catch (e) {
      return Left(UnknownFailure(e.toString()));
    } 
  }
}

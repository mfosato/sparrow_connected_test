import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparrow_connected_test/app/data/model/news.model.dart';
import 'package:sparrow_connected_test/app/data/provider/api_provider.dart';


void main() {
  test('Fetch data from API', () async {
    final result = await MyApiClient().getAllNews();
    result.fold((l) {
      expect(l.failureData, '');
    }, (r) {
       expect(r.articles.length, greaterThan(0));
    });
   
  });
}
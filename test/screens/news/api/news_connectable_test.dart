import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/api/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns the id list of API', () async  {
    final givenIds = [1,2,3,4];
    final newsAPI = NewsApiProvider();
    newsAPI.client = MockClient((request) async {
      return Response(jsonEncode(givenIds), 200);
    });

    final ids = await newsAPI.fetchTopIds();

    expect(ids, givenIds);
  });

  test('fetchItem returns the news of API', () async {
    final newsAPI = NewsApiProvider();
    newsAPI.client = MockClient((request) async {
      return Response(jsonEncode({'id': 123}), 200);
    });

    final news = await newsAPI.fetchItem(id: 20);

    expect(news.id, 123);
  });
}

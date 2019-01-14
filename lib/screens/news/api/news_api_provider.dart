import 'dart:convert';
import 'package:exercise/screens/news/api/news_repository.dart';
import 'package:http/http.dart' show Client;
import 'package:exercise/screens/news/api/news.dart';

class NewsApiProvider implements NewsProvider {
  Client client = Client();
  final _api = 'https://hacker-news.firebaseio.com/v0';

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_api/topstories.json');
    final ids = jsonDecode(response.body);
    return ids.cast<int>();
  }

  Future<News> fetchItem({int id}) async {
    final response = await client.get('$_api/item/$id.json');
    return News.fromJson(jsonDecode(response.body));
  }
}
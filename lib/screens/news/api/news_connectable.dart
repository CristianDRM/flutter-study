import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:exercise/screens/news/api/news.dart';

abstract class NewsConnectable {
  Future<List<News>> fetchNews();
}

class NewsConnector extends NewsConnectable {

  @override
  Future<List<News>> fetchNews() async {
    final client = Client();
    final response = await client.get('https://hacker-news.firebaseio.com/v0/topstories.json');
    final json = jsonDecode(response.body) as List;
    return json.map((item) => News.fromJson(item));
  }
}
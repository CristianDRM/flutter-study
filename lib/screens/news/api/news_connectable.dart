import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:exercise/screens/news/api/news.dart';

class NewsConnector {
  Client client = Client();
  final _api = 'https://hacker-news.firebaseio.com/v0';

  fetchTopIds() async {
    final response = await client.get('$_api/topstories.json');
    return jsonDecode(response.body);
  }

  fetchItem({int id}) async {
    final response = await client.get('$_api/item/$id.json');
    return News.fromJson(jsonDecode(response.body));
  }
}
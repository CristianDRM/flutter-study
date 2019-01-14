import 'package:exercise/screens/news/api/news.dart';

abstract class NewsSource {
  Future<List<int>> fetchTopIds();
  Future<News> fetchItem({int id});
  void add({News news});
  Future<int> clear();
}
import 'package:exercise/screens/news/api/news.dart';

abstract class NewsProvider {
  Future<List<int>> fetchTopIds();
  Future<News> fetchItem({int id});
}
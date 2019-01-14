import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/api/news_api_provider.dart';
import 'package:exercise/screens/news/api/news_db_provider.dart';
import 'package:exercise/screens/news/api/news_source.dart';

abstract class NewsProvider {
  Future<List<int>> fetchTopIds();
  Future<News> fetchItem({int id});
}

class NewsRepository extends NewsProvider {
  NewsRepository() {
    dbProvider.init();
  }

  final _caches = <NewsSource>[
    dbProvider
  ];

  final _providers = <NewsProvider>[
    NewsApiProvider(),
    dbProvider
  ];

  Future<List<int>> fetchTopIds() async {
    for(NewsProvider provider in _providers) {
      var topIds = await provider.fetchTopIds();
      if(topIds != null) {
        return topIds;
      }
    }
    return null;
  }

  Future<News> fetchItem({int id}) async {
    News item;
    for(NewsSource source in _caches) {
      item = await source.fetchItem(id: id);
      if(item != null) {
        return item;
      }
    }
    for(NewsProvider provider in _providers) {
      item = await provider.fetchItem(id: id);
      if(item != null) {
        _add(news: item);
        return item;
      }
    }
    return item;
  }

  clearCache() async {
    for(var cache in _caches) {
      await cache.clear();
    }
  }

  _add({News news}) {
    _caches.forEach((source) => source.add(news: news));
  }
}
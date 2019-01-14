import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/api/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = NewsRepository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<News>>>();
  final _itemsFetcher = PublishSubject<int>();

  NewsBloc() {
    _itemsFetcher.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  Observable<Map<int, Future<News>>> get items => _itemsOutput.stream;
  Stream<List<int>> get topIds => _topIds.stream;
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<News>> cache, int id, _) {
          cache[id] = _repository.fetchItem(id: id);
          return cache;
        },
        <int, Future<News>> { }
    );
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
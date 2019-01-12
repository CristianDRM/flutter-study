import 'dart:async';
import 'package:exercise/screens/quake/quake.dart';
import 'package:exercise/screens/quake/quake_connectable.dart';
import 'package:exercise/screens/quake/quake_file_storage.dart';

abstract class QuakeInteractorType {
  const QuakeInteractorType({this.connectable,this.fileStorage});
  final QuakeConnectable connectable;
  final QuakeFileStorageType fileStorage;
  Future<List<Quake>> fetchQuakes();
}

class QuakeInteractor extends QuakeInteractorType {
  const QuakeInteractor({
    this.connectable = const QuakeConnector(),
    this.fileStorage = const QuakeFileStorage()
  });
  final QuakeConnectable connectable;
  final QuakeFileStorageType fileStorage;

  @override
  Future<List<Quake>> fetchQuakes() {
    return fileStorage.fetchQuakes();
  }
}
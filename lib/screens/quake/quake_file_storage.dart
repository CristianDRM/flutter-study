import 'dart:async';
import 'dart:io';
import 'package:exercise/screens/quake/quake.dart';
import 'package:path_provider/path_provider.dart';

abstract class QuakeFileStorageType {
  const QuakeFileStorageType();
  Future<List<Quake>> fetchQuakes();
  save(List<Quake> quakes);
}

class QuakeFileStorage extends QuakeFileStorageType {
  const QuakeFileStorage();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  @override
  Future<List<Quake>> fetchQuakes() {
    return Future.wait([]);
  }

  @override
  save(List<Quake> quakes) {
    // TODO: implement save
    return null;
  }
}

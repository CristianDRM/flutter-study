import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class IO {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _file async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<String> read(String filename) async {
    try {
      final file = await _file;
      final result = await file.readAsString();
      return result;
    } catch(error) {
      return "Error";
    }
  }
  Future<File> write(String file) async {
    final file = await _file;
    return file.writeAsString('$file');
  }
}
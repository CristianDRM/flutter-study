import 'package:exercise/screens/news/api/news_repository.dart';
import 'package:exercise/screens/news/api/news_source.dart';
import 'package:sqflite/sqflite.dart';
import 'news.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class NewsDbProvider implements NewsProvider, NewsSource {
  Database db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "news.db");
    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database newDb, int version) {
          newDb.execute("""
          CREATE TABLE Items(
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER, 
            text TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          );
        """);
        }
    );
  }

  Future<List<int>> fetchTopIds() {
    return null;
  }

  Future<News> fetchItem({int id}) async {
    final maps = await db.query(
      "items",
      columns: null,
      where: "id = ?",
      whereArgs: [id]
    );
    return maps.length > 0 ? News.fromDB(maps.first) : null;
  }

  add({News news}) {
    db.insert(
        "items",
        news.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }

  Future<int> clear() {
    return db.delete("items");
  }
}

final dbProvider = NewsDbProvider();
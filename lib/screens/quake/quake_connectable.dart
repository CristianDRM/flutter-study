import 'dart:async';
import 'quake.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;

abstract class QuakeConnectable {
  const QuakeConnectable();
  Future<List<Quake>> fetchQuakes();
}

class QuakeConnector extends QuakeConnectable {
  const QuakeConnector();

  @override
  Future<List<Quake>> fetchQuakes() async {
    final client = Client();
    final url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
    final response = await client.get(url);
    final features = jsonDecode(response.body)["features"] as List;
    return features.map((item) => Quake.fromJson(item)).toList();
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exercise/screens/weather/weather.dart';

abstract class WeatherConnectable {
  const WeatherConnectable();
  Future<Weather> fetchWeather({String city});
}

class WeatherConnector extends WeatherConnectable {
  const WeatherConnector();

  final _apiKey = "9ad12bf44fed83b36c1d168d361b62c4";
  String _generateUrl({String city}) => "https://samples.openweathermap.org/data/2.5/weather\?q\=$city\&appid\=$_apiKey";

  @override
  Future<Weather> fetchWeather({String city}) async {
    http.Response response = await http.get(_generateUrl(city: city));
    return Weather.fromJson(jsonDecode(response.body));
  }
}
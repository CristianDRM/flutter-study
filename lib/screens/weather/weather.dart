class Temperature {
  const Temperature({this.current, this.min, this.max});
  final double current;
  final double min;
  final double max;
}

class Weather {
  const Weather({this.city, this.temperature, this.humidity, this.iconName});
  final String city;
  final Temperature temperature;
  final int humidity;
  final String iconName;

  factory Weather.fromJson(Map<String, dynamic> json) {
    var main = json["main"];
    return Weather(
        city: json["name"],
        temperature: Temperature(current: main["temp"], min: main["temp_min"], max: main["temp_max"]),
        humidity: main["humidity"],
        iconName: json["weather"][0]["icon"]
    );
  }
}
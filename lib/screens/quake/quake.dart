class Coordinate {
  const Coordinate({this.latitude, this.longitude});
  final String latitude;
  final String longitude;
}

class Quake {
  const Quake({this.place, this.time, this.mag, this.coordinate});
  final Coordinate coordinate;
  final String place;
  final DateTime time;
  final String mag;

  factory Quake.fromJson(Map<String, dynamic> map) {
    Coordinate coordinate = Coordinate(
        latitude: map["geometry"]["coordinates"][0].toString(),
        longitude: map["geometry"]["coordinates"][1].toString()
    );
    return Quake(
        coordinate: coordinate,
        place: map["properties"]["place"],
        time: DateTime.fromMicrosecondsSinceEpoch(map["properties"]["time"]),
        mag: map["properties"]["mag"].toString()
    );
  }
}
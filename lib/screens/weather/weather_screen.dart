import 'package:exercise/screens/weather/weather.dart';
import 'package:exercise/screens/weather/weather_connectable.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key, this.connectable = const WeatherConnector()}) : super(key: key);
  final WeatherConnectable connectable;

  @override
  State<StatefulWidget> createState() {
    return _WeatherScreenState(connectable: connectable, initialCity: "Toronto");
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  _WeatherScreenState({this.connectable, this.initialCity});
  final WeatherConnectable connectable;
  String initialCity;
  Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather"), backgroundColor: Colors.pink),
      body: FutureBuilder(
          future: connectable.fetchWeather(city: initialCity),
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return defaultLayout(context, body: _LoadedWeatherLoading());
              default:
                if(snapshot.hasError) {
                  return defaultLayout(context, body: _LoadedWeatherError(error: snapshot.error));
                }
                return defaultLayout(context, body: _LoadedWeather(weather: snapshot.data));
            }
          }
      )
    );
  }

  defaultLayout(BuildContext context, {Widget body}) {
    return Stack(
      children: [
        body,
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            color: Colors.pink,
            textColor: Colors.white,
            shape: StadiumBorder(),
            child: Text(currentWeather?.city ?? initialCity),
            onPressed: () => _changeCity(context),
          ),
        )
      ],
    );
  }

  didChangeCity(String newCity) {
    connectable
        .fetchWeather(city: newCity)
        .then((weather) => _updateWeather(weather: weather))
        .catchError((error) => print(error));
  }

  _updateWeather({Weather weather}) {
    setState(() {
      currentWeather = weather;
    });
  }

  _changeCity(BuildContext context) {
    cityController.text = initialCity;
    var alert = AlertDialog(
      title: Text("Change city"),
      content: TextField(
          controller: cityController,
          autofocus: true,
          decoration: InputDecoration(hintText: "Type the name of the city")
      ),
      actions: [
        FlatButton(
            onPressed: () {
              setState(() {
                initialCity = cityController.text ?? initialCity;
              });
              Navigator.pop(context);
            },
            child: Text("Change")
        ),
        FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.red))
        )
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}

class _LoadedWeather extends StatelessWidget {
  _LoadedWeather({Key key, this.weather}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            "images/umbrella.png",
            fit: BoxFit.cover,
            height: double.infinity
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/light_rain.png"),
              Text(
                  "${weather.temperature.current}F",
                  style: temperature()
              ),
              Text(
                  "humidity: ${weather.humidity}",
                  style: temperatureBorders()
              ),
              Text(
                  "max: ${weather.temperature.current}",
                  style: temperatureBorders()
              ),
              Text(
                  "min: ${weather.temperature.min}",
                  textAlign: TextAlign.start,
                  style: temperatureBorders()
              ),
            ],
          ),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

TextStyle temperature() => TextStyle(color: Colors.white, fontSize: 40.0);
TextStyle temperatureBorders() => TextStyle(color: Colors.white, fontSize: 20.0);

class _LoadedWeatherError extends StatelessWidget {
  _LoadedWeatherError({Key key, this.error}) : super(key: key);
  final Error error;

  @override
  Widget build(BuildContext context) {
    return Text(error.toString(), style: TextStyle(color: Colors.black));
  }
}

class _LoadedWeatherLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("Loading...", style: TextStyle(color: Colors.black))
      ]
    );
  }
}
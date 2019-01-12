import 'package:exercise/screens/newlogin//login_with_form.dart';
import 'package:flutter/material.dart';
import 'package:exercise/screens/network/network.dart';
import 'package:exercise/screens/quake/quake_screen.dart';
import 'package:exercise/screens/weather/weather_screen.dart';
import 'package:exercise/screens/bmi/bmi.dart';
import 'package:exercise/screens/planets/planets.dart';
import 'package:exercise/screens/login/login.dart';

enum _ScreenType {
  login, planets, bmi, network, quake, weather, loginWithForm
}

class Experiments extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Exercises of Udemy course"),
          backgroundColor: Colors.pink
      ),
      body: ListView(
        children: [
          _ScreenItem(
              title: "login",
              description: "login example",
              didTap: () => didTapInScreen(context, screen: _ScreenType.login)),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "login with form",
              description: "login with forma(validation and submit)",
              didTap: () => didTapInScreen(context, screen: _ScreenType.loginWithForm)),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "BMI",
              description: "IMC",
              didTap: () => didTapInScreen(context, screen: _ScreenType.bmi)),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "Planets",
              description: "A planet calculator",
              didTap: () => didTapInScreen(context, screen: _ScreenType.planets)),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "Network",
              description: "A list of posts from rest services",
              didTap: () => didTapInScreen(context, screen: _ScreenType.network)),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "Quake",
              description: "A list of items from rest service with local database",
              didTap: () => didTapInScreen(context, screen: _ScreenType.quake)),
          Container(height: 1.0, color: Colors.pinkAccent),
          Container(height: 1.0, color: Colors.pinkAccent),
          _ScreenItem(
              title: "Weather",
              description: "A weather app",
              didTap: () => didTapInScreen(context, screen: _ScreenType.weather)),
          Container(height: 1.0, color: Colors.pinkAccent),
        ],
      ),
    );
  }

  didTapInScreen(BuildContext context, {_ScreenType screen}) {
    switch(screen) {
      case _ScreenType.bmi: navigateTo(screen: BMI(), context: context); break;
      case _ScreenType.login: navigateTo(screen: Login(), context: context); break;
      case _ScreenType.planets: navigateTo(screen: Planets(), context: context); break;
      case _ScreenType.network: navigateTo(screen: Network(), context: context); break;
      case _ScreenType.quake: navigateTo(screen: QuakeScreen(), context: context); break;
      case _ScreenType.weather: navigateTo(screen: WeatherScreen(), context: context); break;
      case _ScreenType.loginWithForm: navigateTo(screen: LoginWithForm(), context: context); break;
      default: break;
    }
  }

  navigateTo<T extends Widget>({T screen, BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class _ScreenItem extends StatelessWidget {
  _ScreenItem({Key key, this.title, this.description, this.didTap}) : super(key: key);

  final String title;
  final String description;
  final VoidCallback didTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: didTap,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(this.title, style: TextStyle(fontSize: 24.0)),
                Text(this.description)
              ]
          )
        )
    );
  }
}
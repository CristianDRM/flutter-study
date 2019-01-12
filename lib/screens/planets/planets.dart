import 'package:exercise/shared/radio_group.dart';
import 'package:flutter/material.dart';

class Planets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlanetsState();
  }
}

class Planet extends RadioItem {
  Planet({this.name, this.gravity});
  String name;
  double gravity;

  String label() {
    return name;
  }
}

class _PlanetsState extends State<Planets> {

  Planet currentPlanet;
  final TextEditingController weightController = new TextEditingController();
  final List<Planet> planets = [
    Planet(name: "Pluto", gravity: 20.0),
    Planet(name: "Mars", gravity: 10.0),
    Planet(name: "Venus", gravity: 15.0)
  ];

  String result = "Please enter weight";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("Weight on planet X"), backgroundColor: Colors.black54),
      body: ListView(
        children: [
          Icon(Icons.face),
          TextField(
              controller: weightController,
              onChanged: (value) => updateMessage,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Your weight on Earth",
                  icon: Icon(Icons.person),
              )
          ),
          RadioGroup<Planet>(items: planets, didSelectItem: didChangePlanet),
          Text(result, textAlign: TextAlign.center)
        ]
      ),
    );
  }

  didChangePlanet(dynamic planet) {
    setState(() {
      currentPlanet = planet as Planet;
      updateMessage();
    });
  }

  double calculateWeight() {
    return double.parse(weightController.text) * currentPlanet.gravity;
  }

  updateMessage() {
    setState(() {
      if(weightController.text.isEmpty) {
        result = "Please enter your weight";
      } else {
        result = "Your punds in ${currentPlanet.name} is ${calculateWeight()}";
      }
    });
  }
}
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  final ageController = new TextEditingController();
  final heightController = new TextEditingController();
  final weightController = new TextEditingController();

  String bmiResult = "";
  String bmiAnalysis = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI"), backgroundColor: Colors.pink),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.ac_unit, size: 80.0),
              Container(
                decoration: BoxDecoration(color: Colors.amberAccent),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                        controller: ageController,
                        decoration: InputDecoration(
                            labelText: "Age",
                            icon: Icon(Icons.person)
                        )
                    ),
                    TextField(
                        controller: heightController,
                        decoration: InputDecoration(
                            labelText: "Height in feet",
                            icon: Icon(Icons.show_chart)
                        )
                    ),
                    TextField(
                        controller: weightController,
                        decoration: InputDecoration(
                            labelText: "Weight in lb",
                            icon: Icon(Icons.line_weight)
                        )
                    ),
                    SizedBox(height: 40.0),
                    RaisedButton(
                        onPressed: calculate,
                        color: Colors.pinkAccent,
                        textColor: Colors.white,
                        child: Text("Calculate")
                    ),
                    SizedBox(height: 20.0),
                    Text(bmiResult),
                    SizedBox(height: 20.0),
                    Text(bmiAnalysis)
                  ]
                )
              )
            ]
          )
      )
    );
  }

  calculate() {
  // finish
  }
}
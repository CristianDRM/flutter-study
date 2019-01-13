import 'package:exercise/screens/quake/quake.dart';
import 'package:exercise/screens/quake/quake_interactor.dart';
import 'package:flutter/material.dart';

class QuakeScreen extends StatefulWidget {
  QuakeScreen({Key key, this.interactor = const QuakeInteractor()}): super(key: key);
  final QuakeInteractorType interactor;

  @override
  State<StatefulWidget> createState() => _QuakeScreenState(interactor: interactor);
}

class _QuakeScreenState extends State<QuakeScreen> {
  _QuakeScreenState({this.interactor});
  final QuakeInteractorType interactor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quake"), backgroundColor: Colors.pink),
      body: FutureBuilder(
          future: interactor.fetchQuakes(),
          builder: (BuildContext context, AsyncSnapshot<List<Quake>> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: Text(
                    "Loading...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26.0),
                  ),
                );
              default:
                if(snapshot.hasError) {
                  return Text("Error ${snapshot.error}", textAlign: TextAlign.center);
                }
                return buildItems(snapshot.data);
            }
          }
      )
    );
  }

  Widget buildItems(List<Quake> quakes) {
    return ListView.builder(
        itemCount: quakes.length,
        itemBuilder: (BuildContext context, int position) {
          Quake quake = quakes[position];
          return ListTile(
            contentPadding: EdgeInsets.all(20.0),
            leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("${quake.mag}", style: TextStyle(color: Colors.white)),
            ),
            title: Text(quake.time.toIso8601String()),
            subtitle: Text(quake.place),
          );
        }
    );
  }

  didTapIn(BuildContext context, Quake quake) {
    var alert = AlertDialog(
      title: Text("Quakes", style: TextStyle(fontSize: 26.0)),
      content: Text(quake.place),
      actions: [
        RaisedButton(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
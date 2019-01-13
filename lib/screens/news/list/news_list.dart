import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: Container(child: Text("hello"))
    );
  }
}
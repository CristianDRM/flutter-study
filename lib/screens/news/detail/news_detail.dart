import 'package:exercise/screens/news/api/news.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  NewsDetail({Key key, this.news}) : super(key: key);
  final News news;
  
  @override
  State<StatefulWidget> createState() => _NewsDetail(news: news);
}

class _NewsDetail extends State<NewsDetail> {
  _NewsDetail({this.news});
  final News news;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Container(
        child: Column(
          children: [
                  
          ],
        )
      ),
    );
  }
}
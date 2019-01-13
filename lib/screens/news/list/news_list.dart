import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/news_bloc.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  final NewsBloc bloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: StreamBuilder(
          stream: bloc.news,
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
            }
            ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return newsItem(news: snapshot.data[index]);
                }
            );
          }
      )
    );
  }

  Widget newsItem({News news}) {
    return Text(news.title);
  }
}
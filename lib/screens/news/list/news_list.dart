import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/bloc/news_bloc_provider.dart';
import 'package:exercise/screens/news/list/news_tile.dart';
import 'package:exercise/screens/news/list/refresh.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  @override
  Widget build(BuildContext context) {
    final bloc = NewsBlocProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: streamBuilder(bloc: bloc)
    );
  }

  Widget streamBuilder({NewsBloc bloc}) {
    return StreamBuilder(
        stream: bloc.topIds,
        builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
          }
          return buildList(news: snapshot.data);
        }
    );
  }

  Widget buildList({List<int> news}) {
    return Refresh(
      child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewsTile(newsId: news[index]);
          }
      )
    );
  }
}
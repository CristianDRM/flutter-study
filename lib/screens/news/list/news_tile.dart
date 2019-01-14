import 'package:exercise/screens/news/api/news.dart';
import 'package:exercise/screens/news/bloc/news_bloc_provider.dart';
import 'package:exercise/screens/news/list/news_tile_shimmer.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  NewsTile({Key key, this.newsId}) : super(key: key);
  final int newsId;

  @override
  Widget build(BuildContext context) {
    final bloc = NewsBlocProvider.of(context);
    bloc.fetchItem(newsId);
    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<News>>> snapshot) {
        if(!snapshot.hasData) {
          return Text("News still loading...");
        }
        return FutureBuilder(
          future: snapshot.data[newsId],
          builder: (context, AsyncSnapshot<News> itemSnapshot) {
            if(!itemSnapshot.hasData) {
              return NewsTileShimmer();
            }
            return buildTile(news: itemSnapshot.data);
          }
        );
      }
    );
  }

  Widget buildTile({News news}) {
    return Column(
        children: [
          ListTile(
            title: Text(news.title),
            subtitle: Text("${news.score} points"),
            trailing: Column(
                children: [Icon(Icons.chat_bubble), Text("${news.descendants}")]
            )
          ),
          Divider(height: 8.0)
        ]
    );
  }
}
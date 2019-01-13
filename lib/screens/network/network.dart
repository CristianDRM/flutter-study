import 'package:exercise/screens/network/post.dart';
import 'package:exercise/screens/network/post_connectable.dart';
import 'package:flutter/material.dart';

class Network extends StatefulWidget {
  Network({Key key, this.connector = const PostConnector()}) : super(key: key);
  final PostConnectorType connector;

  @override
  State<StatefulWidget> createState() => _NetworkState(connector: connector);
}

class _NetworkState extends State<Network> {
  _NetworkState({this.connector});
  final PostConnectorType connector;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network"),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder(
          future: connector.fetchPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                      "Loading...",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24.0)
                    )
                ); break;
              default:
                if(snapshot.hasError) {
                  return Text("Error: $snapshot.error", textAlign: TextAlign.center);
                }
                return _buildPosts(snapshot.data);
            }
          }
      )
    );
  }

  ListView _buildPosts(List<Post> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int position) {
          Post post = posts[position];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
            contentPadding: EdgeInsets.all(20.0),
            onTap: () => showAlert(context, post),
          );
        }//_PostCell(post: posts[position])
    );
  }

  showAlert(BuildContext context, Post post) {
    var alert = new AlertDialog(
      title: Text(post.title),
      content: Text(post.body),
      actions: [
        FlatButton(
            child: Text("OK"),
          onPressed: () => Navigator.pop(context)
        )
      ]
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:exercise/screens/network/post.dart';

abstract class PostConnectorType {
  const PostConnectorType();
  Future<List<Post>> fetchPosts();
}

class PostConnector extends PostConnectorType {
  const PostConnector();

  Future<List<Post>> fetchPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    List<dynamic> json = jsonDecode(response.body);
    return json.map((item) => Post.fromJson(item)).toList();
  }
}
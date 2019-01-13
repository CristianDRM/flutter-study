import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'package:exercise/screens/network/post.dart';

abstract class PostConnectorType {
  const PostConnectorType();
  Future<List<Post>> fetchPosts();
}

class PostConnector extends PostConnectorType {
  const PostConnector();

  Future<List<Post>> fetchPosts() async {
    final client = Client();
    final url = "https://jsonplaceholder.typicode.com/posts";
    final response = await client.get(url);
    final json = jsonDecode(response.body) as List;
    return json.map((item) => Post.fromJson(item)).toList();
  }
}
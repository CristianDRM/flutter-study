class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) :
        userId = json["userId"],
        id = json["id"],
        title = json["title"].toString(),
        body = json["body"].toString();
}
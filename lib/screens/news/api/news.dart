class News {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  News.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        deleted = json["deleted"],
        type = json["type"],
        by = json["by"],
        time = json["time"],
        text = json["text"],
        dead = json["dead"],
        parent = json["parent"],
        kids = json["kids"],
        url = json["url"],
        score = json["score"],
        title = json["title"],
        descendants = json["descendants"];
}
import 'package:flutter/material.dart';

class NewsTileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Shimmer(width: 100.0, height: 20.0),
          subtitle: Shimmer(width: 20.0, height: 30.0)
        )
      ]
    );
  }
}

class Shimmer extends StatelessWidget {
  Shimmer({Key key, this.width, this.height}) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0)
    );
  }
}
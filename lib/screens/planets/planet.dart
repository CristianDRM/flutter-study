import 'package:exercise/shared/radio_group.dart';

class Planet extends RadioItem {
  Planet({this.name, this.gravity});
  String name;
  double gravity;

  String label() {
    return name;
  }
}
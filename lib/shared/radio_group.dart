import 'package:flutter/material.dart';

abstract class RadioItem {
  String label();
}

typedef void RadioCallback<T>(T);
class RadioGroup<T extends RadioItem>extends StatefulWidget {
  RadioGroup({Key key, this.items, this.didSelectItem}) : super(key: key);
  final List<T> items;
  final RadioCallback<T> didSelectItem;

  @override
  State<StatefulWidget> createState() {
    return _RadioGroupState(items: items, didSelectItem: didSelectItem);
  }
}

class _RadioGroupState<T extends RadioItem> extends State<RadioGroup> {
  _RadioGroupState ({this.items, this.didSelectItem}) : super();

  final List<T> items;
  final RadioCallback<T> didSelectItem;
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .asMap()
            .entries.map((entry) =>
            Row(
                children: [
                  Text(entry.value.label()),
                  Radio<int>(value: entry.key, groupValue: radioValue, onChanged: onSelectItem)]
            ))
            .toList()
    );
  }

  onSelectItem(int value) {
    setState(() {
      radioValue = value;
      this.didSelectItem(items[value]);
    });
  }
}
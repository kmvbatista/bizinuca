import 'package:flutter/material.dart';

class UsersList {
  List<DropdownMenuItem<String>> _dropDownItems = new List();

  List<DropdownMenuItem<String>> getDropdownItems() {
    _dropDownItems
        .add(new DropdownMenuItem(value: 'mateus', child: new Text('Mateus')));
    _dropDownItems.add(
        new DropdownMenuItem(value: 'kennedy', child: new Text('Kennedy')));
    _dropDownItems.add(
        new DropdownMenuItem(value: 'marcelo', child: new Text('Marcelo')));
    _dropDownItems.add(
        new DropdownMenuItem(value: 'jonatan', child: new Text('Jonattan')));
    return _dropDownItems;
  }
}

import 'package:flutter/material.dart';

class DialogService {
  static void showConfirmationDialog(
      BuildContext context, Function onPress, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text("Não"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(child: Text("Sim"), onPressed: onPress),
            ],
          );
        });
  }
}

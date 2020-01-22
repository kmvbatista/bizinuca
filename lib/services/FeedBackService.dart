import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FeedBackService {
  static void showYesNoDialog(
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

  static showCalbackConfimationDialog(
      BuildContext context, String text, Function callback) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                  callback();
                },
              )
            ],
          );
        });
  }

  static showAlertDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  static Widget showSpinner(Color color) {
    return SpinKitCircle(
      color: color,
      size: 50.0,
    );
  }
}

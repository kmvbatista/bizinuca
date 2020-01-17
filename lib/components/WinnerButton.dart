import 'package:swipe_button/swipe_button.dart';
import 'package:flutter/material.dart';

class WinnerButton extends StatefulWidget {
  @override
  _WinnerButtonState createState() => _WinnerButtonState();
}

class _WinnerButtonState extends State<WinnerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwipeButton(
        onChanged: null,
        thumb: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

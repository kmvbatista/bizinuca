import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final Function onPress;
  final String buttonText;

  BlackButton(this.buttonText, this.onPress);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: MaterialButton(
          splashColor: Colors.green,
          child: Text(buttonText,
              style: TextStyle(fontSize: 15, color: Colors.white)),
          color: Colors.black,
          onPressed: onPress,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ));
  }
}

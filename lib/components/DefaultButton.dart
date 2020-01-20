import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function onPress;
  final String buttonText;
  final Color buttonColor;

  DefaultButton(this.buttonText, this.onPress, this.buttonColor);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: MaterialButton(
          child: Text(buttonText,
              style: TextStyle(fontSize: 15, color: Colors.white)),
          color: buttonColor,
          onPressed: onPress,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ));
  }
}

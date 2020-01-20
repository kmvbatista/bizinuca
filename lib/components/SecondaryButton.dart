import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function onPress;
  final String buttonText;

  SecondaryButton(this.buttonText, this.onPress);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF66BB6A),
                Color(0xFF388E3C),
                Color(0xFF1B5E20),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: SizedBox.expand(
          child: FlatButton(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onPressed: onPress,
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.buttonText, this.onPress, this.buttonColor);

  final Function onPress;
  final String buttonText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: MaterialButton(
        color: buttonColor,
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}

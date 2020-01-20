import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  final String text;
  final TextInputType inputType;
  final bool obscureText;

  PrimaryInput(this.text, this.inputType, {this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 20),
      ),
      autofocus: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

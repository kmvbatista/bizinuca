import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  final String _text;
  final TextInputType _inputType;
  final bool obscureText;
  final TextEditingController _inputController;

  PrimaryInput(this._text, this._inputType, this._inputController,
      {this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _inputController,
      keyboardType: _inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: _text,
        labelStyle: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 15),
      ),
      autofocus: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

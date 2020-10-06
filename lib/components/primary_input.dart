import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  const PrimaryInput(this._text, this._inputType, this._inputController,
      {this.obscureText = false});

  final String _text;
  final TextInputType _inputType;
  final bool obscureText;
  final TextEditingController _inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _inputController,
      keyboardType: _inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: _text,
        labelStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      autofocus: true,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}

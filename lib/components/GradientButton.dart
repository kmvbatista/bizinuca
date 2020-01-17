import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String _buttonText;
  final Function onPressCallback;

  GradientButton(this._buttonText, this.onPressCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: onPressCallback,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF1B5E20),
                  Color(0xFF388E3C),
                  Color(0xFF66BB6A),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(_buttonText, style: TextStyle(fontSize: 20))),
      ),
    );
  }
}

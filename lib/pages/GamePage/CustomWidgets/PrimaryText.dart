import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;

  PrimaryText(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

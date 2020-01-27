import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
          color: Colors.green,
          fontStyle: FontStyle.italic,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      title: base.headline.copyWith(
          color: Colors.green, fontSize: 17, fontWeight: FontWeight.w600),
      display1: base.display1.copyWith(
          color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
      display2: base.display2.copyWith(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      display3: base.display3.copyWith(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.green,
  );
}

import 'package:bizinuca/components/GradientButton.dart';
import 'package:flutter/material.dart';
import '../components/GradientButton.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bizinuca"),
      ),
      body: Center(
          child: GradientButton(
              "Fazer Login", () => Navigator.pushNamed(context, '/main'))),
    );
  }
}

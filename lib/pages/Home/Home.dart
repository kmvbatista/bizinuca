import 'package:bizinuca/components/GradientButton.dart';
import 'package:bizinuca/components/Menu.dart';
import 'package:flutter/material.dart';
import '../../components/GradientButton.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bizinuca"),
      ),
      drawer: Menu(),
      body: Center(
          child: GradientButton(
              "Fazer Login", () => Navigator.pushNamed(context, '/gamePage'))),
    );
  }
}

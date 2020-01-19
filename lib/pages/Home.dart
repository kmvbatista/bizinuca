import 'package:bizinuca/components/Menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Bem vindo ao Bizinuca"),
      ),
      body: Center(
        child: Container(
          child: Text('As regras são as seguintes'),
        ),
      ),
    );
  }
}

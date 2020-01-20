import 'package:bizinuca/pages/Home.dart';
import 'package:bizinuca/pages/Login.dart';
import 'package:bizinuca/pages/Signup.dart';
import 'package:flutter/material.dart';

import './pages/Statistics/Statistics.dart';
import './pages/GamePage/Game.dart';

void main() => runApp(Bizinuca());

class Bizinuca extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bizinuca',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/gamePage': (context) => GamePage(),
        '/statistics': (context) => Statistics()
      },
    );
  }
}

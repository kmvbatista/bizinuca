import 'package:flutter/material.dart';

import './pages/Login.dart';
import './pages/Game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bizinuca',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/gamePage': (context) => GamePage(),
      },
    );
  }
}

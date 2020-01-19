import 'package:flutter/material.dart';

import './pages/Home/Home.dart';
import './pages/GamePage/Game.dart';
import './pages/ranking.dart';

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
        '/': (context) => Home(),
        '/gamePage': (context) => GamePage(),
        '/ranking': (context) => Ranking()
      },
    );
  }
}

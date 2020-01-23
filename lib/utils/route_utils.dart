import 'package:bizinuca/pages/GamePage/GamePage.dart';
import 'package:bizinuca/pages/Login/Login.dart';
import 'package:bizinuca/pages/Ranking/Ranking.dart';
import 'package:bizinuca/pages/SignUp/Signup.dart';
import 'package:bizinuca/pages/Statistics/Statistics.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Ranking(),
    '/login': (context) => Login(),
    '/signup': (context) => SignUp(),
    '/gamePage': (context) => GamePage(),
    '/statistics': (context) => Statistics()
  };

  static Map<String, Widget Function(BuildContext)> getRoutes() => routes;

  static Widget getByName(BuildContext context, String routeName) =>
      routes[routeName](context);
}

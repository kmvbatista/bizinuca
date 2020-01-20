import 'package:bizinuca/pages/Home.dart';
import 'package:bizinuca/pages/Login/Login.dart';
import 'package:bizinuca/pages/SignUp/Signup.dart';
import 'package:bizinuca/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      onGenerateRoute: (RouteSettings route) {
        print(route.name);
        if (route.name != '/gamePage') {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
        }
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteUtils.getByName(context, route.name));
      },
    );
  }
}

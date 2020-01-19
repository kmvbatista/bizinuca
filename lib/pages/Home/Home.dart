import 'package:bizinuca/components/Menu.dart';
import 'package:fluttie/fluttie.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FluttieAnimationController animationController;

  prepareAnimation() async {
    var instance = Fluttie();
    var checkAnimation =
        await instance.loadAnimationFromJson("assets/billiardAnimation.json");

    animationController = await instance.prepareAnimation(checkAnimation,
        repeatCount: RepeatCount.dontRepeat(), repeatMode: RepeatMode.REVERSE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bizinuca"),
      ),
      drawer: Menu(),
      body: FluttieAnimation(animationController),
    );
  }
}

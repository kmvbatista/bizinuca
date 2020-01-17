import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/GradientButton.dart';

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: Image.asset('images/bolas.png'),
            title: Text(
              "Bizinuca Chalenge",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            trailing: Icon(Icons.dehaze, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('aaaaaaaaa')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GradientButton('Finalizar', () => print('Finalizar'))
            ],
          )
        ],
      ),
    ));
  }
}

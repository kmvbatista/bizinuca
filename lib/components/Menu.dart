import 'dart:ui';

import 'package:bizinuca/services/authentication_service.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF66BB6A),
                  Color(0xFF388E3C),
                  Color(0xFF1B5E20),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: Image.asset("images/billiardPerson.png",
                      width: 100, height: 100),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text("Para onde, Bizinuqueiro?",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
          BaseListTile(
              Image.asset("images/yellowBall.png", width: 40, height: 40),
              "Jogar agora",
              () => Navigator.popAndPushNamed(context, '/gamePage')),
          BaseListTile(
              Image.asset("images/top-three.png", width: 40, height: 40),
              "Ranking",
              () => Navigator.popAndPushNamed(context, '/')),
          BaseListTile(
              Image.asset("images/analytics64.png", width: 40, height: 40),
              "Estatísticas",
              () => Navigator.popAndPushNamed(context, '/statistics')),
          BaseListTile(
              Image.asset("images/exit.png", width: 40, height: 40), "Logout",
              () {
            AuthenticationService.logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          }),
        ],
      ),
    );
  }
}

class BaseListTile extends StatelessWidget {
  const BaseListTile(this._image, this._text, this._onPress);

  final Image _image;
  final String _text;
  final Function _onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(_text,
              style: TextStyle(color: Theme.of(context).primaryColor)),
          trailing: _image,
          onTap: _onPress,
        ),
        const Divider(
          height: 10.0,
        ),
      ],
    );
  }
}

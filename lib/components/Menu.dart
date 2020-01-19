import 'dart:ui';

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF1B5E20),
                  Color(0xFF388E3C),
                  Color(0xFF66BB6A),
                ],
              )),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Image.asset("images/billiardPerson.png",
                          width: 100, height: 100),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Bem vindo, Bizinuqueiro!",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
            BaseListTile(
                Image.asset("images/c.png", width: 40, height: 40),
                Icons.directions_run,
                "Jogar agora",
                () => Navigator.pushNamed(context, '/gamePage')),
            BaseListTile(
                Image.asset("images/ranking.png", width: 40, height: 40),
                Icons.poll,
                "Ranking",
                () => Navigator.pushNamed(context, '/ranking')),
            BaseListTile(
                Image.asset("images/logout5.png", width: 40, height: 40),
                Icons.subdirectory_arrow_left,
                "Logout",
                () => {}),
          ],
        ),
      ),
    );
  }
}

class BaseListTile extends StatelessWidget {
  final Image _image;
  final String _text;
  final Function _onPress;
  final IconData _icon;

  BaseListTile(this._image, this._icon, this._text, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(_icon, color: Colors.green),
          title: Text(_text, style: TextStyle(color: Colors.green)),
          trailing: _image,
          onTap: _onPress,
        ),
        Divider(
          height: 10.0,
        ),
      ],
    );
  }
}

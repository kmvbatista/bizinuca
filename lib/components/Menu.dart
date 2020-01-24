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
                    Color(0xFF66BB6A),
                    Color(0xFF388E3C),
                    Color(0xFF1B5E20),
                  ],
                ),
              ),
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
                      child: Text("Para onde, Bizinuqueiro?",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
            BaseListTile(
                Image.asset("images/c.png", width: 40, height: 40),
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
            BaseListTile(Image.asset("images/exit.png", width: 40, height: 40),
                "Logout", () => Navigator.popAndPushNamed(context, '/login')),
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

  BaseListTile(this._image, this._text, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
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

import 'package:flutter/material.dart';

class GameHistory extends StatefulWidget {
  @override
  _GameHistoryState createState() => _GameHistoryState();
}

class _GameHistoryState extends State<GameHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Text('Your Game History'),
        ),
      ),
    );
  }
}

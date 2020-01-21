import 'package:bizinuca/models/User.dart';
import 'package:bizinuca/pages/GamePage/GameLogic.dart';

class Game {
  List<String> players;
  int valuePoints;
  List<String> winnerPlayers;
  String date;

  Game({this.players, this.valuePoints, this.winnerPlayers, this.date});

  Game.fromJson(Map<String, dynamic> json) {
    players = json['players'].cast<String>();
    valuePoints = json['valuePoints'];
    winnerPlayers = json['winnerPlayers'].cast<String>();
    winnerPlayers = json['date'].cast<DateTime>();
  }
}

class GamePostModel {
  List<User> players;
  int valuePoints;
  DateTime date;
  WinnerSide winnerSide;
  int expectedPoints;

  GamePostModel(
      {this.players,
      this.valuePoints,
      this.date,
      this.winnerSide,
      this.expectedPoints});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['players'] = this.players.map((x) => x.toJson()).toList();
    data['valuePoints'] = this.valuePoints;
    data['date'] = this.date;
    data['winnerSide'] = this.winnerSide.index;
    data['expectedPoints'] = this.expectedPoints;
    return data;
  }
}

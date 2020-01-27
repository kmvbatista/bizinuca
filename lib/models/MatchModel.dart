import 'package:bizinuca/models/UserModel.dart';

class MatchModel {
  List<String> players;
  int valuePoints;
  List<String> winnerPlayers;
  String date;
  int expectedPoints;

  MatchModel({this.players, this.valuePoints, this.winnerPlayers, this.date});

  MatchModel.fromJson(Map<String, dynamic> json) {
    players = json['players'].cast<String>();
    valuePoints = json['valuePoints'];
    winnerPlayers = json['winnerPlayers'].cast<String>();
    winnerPlayers = json['date'].cast<DateTime>();
    winnerPlayers = json['expectedPoints'];
  }
}

class MatchPostModel {
  List<UserModel> players;
  int valuePoints;
  DateTime date;
  List<UserModel> winners;
  List<UserModel> losers;

  MatchPostModel(
      {this.players, this.valuePoints, this.date, this.winners, this.losers});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['players'] = this.players;
    data['valuePoints'] = this.valuePoints;
    data['date'] = this.date.millisecondsSinceEpoch;
    data['winners'] = this.winners;
    data['losers'] = this.losers;
    return data;
  }
}

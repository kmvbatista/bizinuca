import 'package:bizinuca/models/user_model.dart';

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
  MatchPostModel(
      {this.players, this.valuePoints, this.date, this.winners, this.losers});

  List<UserModel> players;
  int valuePoints;
  DateTime date;
  List<UserModel> winners;
  List<UserModel> losers;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['players'] = players;
    data['valuePoints'] = valuePoints;
    data['date'] = date.millisecondsSinceEpoch;
    data['winners'] = winners;
    data['losers'] = losers;
    return data;
  }
}

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
    winnerPlayers = json['date'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['players'] = this.players;
    data['valuePoints'] = this.valuePoints;
    data['winnerPlayers'] = this.winnerPlayers;
    data['date'] = this.date;
    return data;
  }
}

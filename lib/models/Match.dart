class Match {
  List<String> players;
  int valuePoints;
  List<String> winnerPlayers;

  Match({this.players, this.valuePoints, this.winnerPlayers});

  Match.fromJson(Map<String, dynamic> json) {
    players = json['players'].cast<String>();
    valuePoints = json['valuePoints'];
    winnerPlayers = json['winnerPlayers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['players'] = this.players;
    data['valuePoints'] = this.valuePoints;
    data['winnerPlayers'] = this.winnerPlayers;
    return data;
  }
}

class PointsPerDay {
  PointsPerDay(this.points, this.date, this.playerName);

  PointsPerDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    playerName = json['playerName'];
    points = json['points'];
  }

  String playerName;
  int points;
  DateTime date;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['date'] = date;
    data['playerName'] = playerName;
    data['points'] = points;
    return data;
  }
}

class PointsPerDay {
  String playerName;
  int points;
  DateTime date;

  PointsPerDay(this.points, this.date, this.playerName);

  PointsPerDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    playerName = json['playerName'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['playerName'] = this.playerName;
    data['points'] = this.points;
    return data;
  }
}

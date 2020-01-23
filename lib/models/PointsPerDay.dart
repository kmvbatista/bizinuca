class PointsPerDay {
  String date;
  String playerId;

  PointsPerDay(this.date, this.playerId);

  PointsPerDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    playerId = json['playerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['playerId'] = this.playerId;
    return data;
  }
}

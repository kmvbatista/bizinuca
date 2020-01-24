import 'package:cloud_firestore/cloud_firestore.dart';

class PointsPerDay {
  String playerId;
  int points;
  DateTime date;

  PointsPerDay(this.points, this.date, this.playerId);

  PointsPerDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    playerId = json['playerId'];
    playerId = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['playerId'] = this.playerId;
    data['points'] = this.playerId;
    return data;
  }
}

import 'package:bizinuca/models/MatchModel.dart';
import 'package:bizinuca/models/StatisticsModel.dart';
import 'package:bizinuca/pages/Statistics/CustomWidgets/ChartInLine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class StatisticsRepository {
  static final Dio dio = Dio();

  static List<MatchModel> parseGames(List<DocumentSnapshot> responseBody) {
    return responseBody.map((game) {
      List<String> players = game.data['players'].cast<String>();
      return new MatchModel(
          players: players,
          valuePoints: game.data['valuePoints'],
          date:
              DateFormat("dd-MM-yyyy HH:mm").format(game.data['date'].toDate()),
          winnerPlayers: game.data['winnerPlayers']);
    }).toList();
  }

  StatisticsModel parseStatistics(List<DocumentSnapshot> responseBody) {
    return new StatisticsModel();
  }

  static Future getStatistics() async {
    try {
      var result = await dio.post(
          'https://us-central1-bizinuca.cloudfunctions.net/getOverallStatistics',
          data: {"name": "jose"});
      print(result);
    } catch (e) {
      print(e);
    }
  }

  static Future postGame(GamePostModel game) {
    return Firestore.instance.collection('matches').add(game.toJson());
  }

  static List<PointsPerDay> getUserPointsPerDay() {
    var graphData = [
      new PointsPerDay(1000, new DateTime(2019, 01, 1)),
      new PointsPerDay(1000, new DateTime(2019, 01, 2)),
      new PointsPerDay(1000, new DateTime(2019, 01, 3)),
      new PointsPerDay(1000, new DateTime(2019, 01, 4)),
      new PointsPerDay(1200, new DateTime(2019, 01, 5)),
      new PointsPerDay(1000, new DateTime(2019, 01, 6)),
      new PointsPerDay(1580, new DateTime(2019, 01, 7)),
      new PointsPerDay(1000, new DateTime(2019, 01, 8)),
      new PointsPerDay(900, new DateTime(2019, 01, 9)),
      new PointsPerDay(1000, new DateTime(2019, 01, 10)),
      new PointsPerDay(1000, new DateTime(2019, 01, 11)),
      new PointsPerDay(1000, new DateTime(2019, 01, 12)),
      new PointsPerDay(1000, new DateTime(2019, 01, 13)),
      new PointsPerDay(1000, new DateTime(2019, 01, 14)),
      new PointsPerDay(1200, new DateTime(2019, 01, 15)),
      new PointsPerDay(1125, new DateTime(2019, 01, 16)),
      new PointsPerDay(1230, new DateTime(2019, 01, 17)),
      new PointsPerDay(1300, new DateTime(2019, 01, 19)),
      new PointsPerDay(1400, new DateTime(2019, 01, 20)),
      new PointsPerDay(1225, new DateTime(2019, 01, 21)),
      new PointsPerDay(1300, new DateTime(2019, 01, 22)),
      new PointsPerDay(1100, new DateTime(2019, 01, 23)),
      new PointsPerDay(1300, new DateTime(2019, 01, 24)),
      new PointsPerDay(1300, new DateTime(2019, 01, 25)),
      new PointsPerDay(1210, new DateTime(2019, 01, 26)),
      new PointsPerDay(1300, new DateTime(2019, 01, 27)),
      new PointsPerDay(1300, new DateTime(2019, 01, 28)),
      new PointsPerDay(1100, new DateTime(2019, 01, 29)),
      new PointsPerDay(1300, new DateTime(2019, 01, 30)),
    ];
    return graphData;
  }
}

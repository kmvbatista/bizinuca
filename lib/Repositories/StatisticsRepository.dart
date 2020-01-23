import 'package:bizinuca/models/MatchModel.dart';
import 'package:bizinuca/models/PointsPerDay.dart';
import 'package:bizinuca/models/StatisticsModel.dart';
import 'package:bizinuca/pages/Statistics/CustomWidgets/ChartInLine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class StatisticsRepository {
  static final Dio dio = Dio();

  static List<MatchModel> parseMatches(List<DocumentSnapshot> responseBody) {
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

  static StatisticsModel parseStatistics(Map response) {
    return new StatisticsModel(
        response['totalPlayedMatches'],
        response['pointsPerDay'].cast<PointsPerDay>(),
        response['totalWonMatches'],
        response['userMatches'].cast<MatchModel>(),
        response['totalWonMatchesThisMonth'],
        response['mostWinnerPartner']);
  }

  static Future<StatisticsModel> getStatistics() async {
    try {
      var result = await dio.post(
          'https://us-central1-bizinuca.cloudfunctions.net/getOverallStatistics',
          data: {"name": "jose", "id": "1"});
      var parsed = parseStatistics(result.data);
      return parsed;
    } catch (e) {
      print(e);
    }
  }

  static Future postGame(GamePostModel game) {
    return Firestore.instance.collection('matches').add(game.toJson());
  }
}

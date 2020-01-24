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

  static List<MatchModel> parseMatches(List<dynamic> responseBody) {
    return responseBody.map((game) {
      List<String> players = game['players'].cast<String>();
      return new MatchModel(
          players: players,
          date: DateFormat("dd-MM-yyyy HH:mm")
              .format(parseDateFromTimeStamp(game['date']['_seconds'])),
          winnerPlayers: game['winners'].cast<String>());
    }).toList();
  }

  static DateTime parseDateFromTimeStamp(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  static List<PointsPerDay> parsePointsPerDay(List<dynamic> responseBody) {
    return responseBody.map((point) {
      var date = parseDateFromTimeStamp(point['date']['_seconds']);
      return new PointsPerDay(point['points'], date, point['playerId']);
    }).toList();
  }

  static StatisticsModel parseStatistics(Map response) {
    return new StatisticsModel(
        response['totalPlayedMatches'],
        parsePointsPerDay(response['pointsPerDay']),
        response['totalWonMatches'],
        parseMatches(response['userMatches']),
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

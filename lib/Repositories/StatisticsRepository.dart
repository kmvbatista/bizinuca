import 'package:bizinuca/models/Game.dart';
import 'package:bizinuca/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatisticsRepository {
  static List<Game> parseGames(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map(
          (game) => new Game(
            players: game.data['players'].cast<String>(),
            valuePoints: game.data['valuePoints'],
            winnerPlayers: game.data['winnerPlayers'].cast<String>(),
            date: DateFormat("dd-MM-yyyy HH:mm")
                .format(game.data['date'].toDate()),
          ),
        )
        .toList();
  }

  static Future getUserGames() async {
    var loggedUser = await FirebaseAuth.instance.currentUser();
    print(loggedUser.displayName);
    var result = await Firestore.instance
        .collection('matches')
        .where('players', arrayContains: loggedUser.displayName)
        .getDocuments();
    return parseGames(result.documents);
  }

  static Future getStatistics() async {
    var result = await Firestore.instance
        .collection('points')
        .where('userId', isEqualTo: '1')
        .orderBy(
          'date',
          descending: true,
        )
        .getDocuments();
    return parseGames(result.documents);
  }

  static Future postGame(GamePostModel game) {
    return Firestore.instance.collection('matches').add(game.toJson());
  }
}

import 'package:bizinuca/models/Game.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatisticsRepository {
  static List<Game> parseGames(List<DocumentSnapshot> responseBody) {
    return responseBody.map((game) {
      List<String> players = game.data['players'].cast<String>();
      return new Game(
        players: players,
        valuePoints: game.data['valuePoints'],
        date: DateFormat("dd-MM-yyyy HH:mm").format(game.data['date'].toDate()),
        winnerPlayers: game.data['winnerSide'] == 0
            ? players.sublist(0, 2)
            : players.sublist(2, 4),
      );
    }).toList();
  }

  static Future getUserGames() async {
    var loggedUser = await FirebaseAuth.instance.currentUser();
    var result = await Firestore.instance
        .collection('matches')
        .where('players', arrayContains: 'jose')
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

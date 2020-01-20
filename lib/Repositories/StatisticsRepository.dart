import 'package:bizinuca/models/Game.dart';
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
            date: DateFormat("dd-MM-yyyy").format(game.data['date'].toDate()),
          ),
        )
        .toList();
  }

  static Future getUserGames() async {
    var result = await Firestore.instance
        .collection('matches')
        .where('players', arrayContains: 'jose')
        .getDocuments();
    return parseGames(result.documents);
  }
}

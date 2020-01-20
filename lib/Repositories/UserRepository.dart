import 'package:bizinuca/models/Game.dart';

import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future getUsers() async {
    var response = await Firestore.instance
        .collection('users')
        .orderBy('points', descending: true)
        .getDocuments();
    return parseUser(response.documents);
  }

  static List<User> parseUser(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map((res) => new User(
            name: res.data['name'],
            points: res.data['points'],
            id: res.documentID))
        .toList();
  }

  static List<Game> parseGames(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map((game) => new Game(
            players: game.data['players'].cast<String>(),
            valuePoints: game.data['valuePoints'],
            winnerPlayers: game.data['winnerPlayers'].cast<String>(),
            date: game.data['date'].toString()))
        .toList();
  }

  static Future updateUsers(List<User> users) async {
    return Future.delayed(Duration(seconds: 1));
  }

  static Future getUserGames() async {
    var result = await Firestore.instance.collection('matches').getDocuments();
    return parseGames(result.documents);
  }
}

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

  static List<Match> parseMatches(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map((res) => new Match(
            name: res.data['name'],
            points: res.data['points'],
            id: res.documentID))
        .toList();
  }

  static Future updateUsers(List<User> users) async {
    return Future.delayed(Duration(seconds: 1));
  }

  static Future getUsersMatches() async {
    var result = await Firestore.instance
        .collection('matches')
        .where('players', arrayContains: 'users/1')
        .getDocuments();
    print(result.documents.data);
  }
}

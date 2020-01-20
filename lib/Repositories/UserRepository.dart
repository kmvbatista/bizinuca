import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future getUsers() async {
    var response = await Firestore.instance
        .collection('users')
        .orderBy('points')
        .getDocuments();
    return parseServices(response.documents);
  }

  static List<User> parseServices(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map((res) => new User(
            name: res.data['name'],
            points: res.data['points'],
            id: res.documentID))
        .toList();
  }
}

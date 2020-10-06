import 'package:bizinuca/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future getUsers() async {
    var response = await Firestore.instance
        .collection('users')
        .orderBy('points', descending: true)
        .getDocuments();
    return parseUser(response.documents);
  }

  static List<UserModel> parseUser(List<DocumentSnapshot> responseBody) {
    return responseBody
        .map((res) => UserModel(
            name: res.data['name'],
            points: res.data['points'],
            id: res.documentID))
        .toList();
  }
}

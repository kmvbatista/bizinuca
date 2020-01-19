import 'package:http/http.dart' as http;
import '../models/User.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class UserService {
  static Future<List<User>> getUsers() async {
    var response = await http.Client()
        .get("https://my.api.mockaroo.com/users?key=f4030c00");
    return parseServices(response.body);
  }

  static List<User> parseServices(String responseBody) {
    return (json.decode(responseBody) as List)
        .map((data) => new User.fromJson(data))
        .toList();
  }
}

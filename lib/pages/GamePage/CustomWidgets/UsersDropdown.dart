import 'package:bizinuca/models/UserModel.dart';
import 'package:flutter/material.dart';

class UsersDropDown extends StatelessWidget {
  final UserModel user;
  final List<DropdownMenuItem<UserModel>> usersDropdown;
  final Function onChange;

  UsersDropDown(this.user, this.usersDropdown, this.onChange);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<UserModel>(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        value: user,
        items: usersDropdown,
        onChanged: onChange);
  }
}

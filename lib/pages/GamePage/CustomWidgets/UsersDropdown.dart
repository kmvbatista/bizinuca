import 'package:bizinuca/models/User.dart';
import 'package:flutter/material.dart';

class UsersDropDown extends StatelessWidget {
  final User user;
  final List<DropdownMenuItem<User>> usersDropdown;
  final Function onChange;

  UsersDropDown(this.user, this.usersDropdown, this.onChange);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<User>(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        value: user,
        items: usersDropdown,
        onChanged: onChange);
  }
}

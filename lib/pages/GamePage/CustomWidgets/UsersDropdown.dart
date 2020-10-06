import 'package:bizinuca/models/user_model.dart';
import 'package:flutter/material.dart';

class UsersDropDown extends StatelessWidget {
  const UsersDropDown(this.user, this.usersDropdown, this.onChange);

  final UserModel user;
  final List<DropdownMenuItem<UserModel>> usersDropdown;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<UserModel>(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        value: user,
        items: usersDropdown,
        onChanged: onChange);
  }
}

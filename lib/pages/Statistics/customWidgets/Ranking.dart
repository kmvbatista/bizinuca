import 'package:bizinuca/models/User.dart';
import 'package:bizinuca/services/UserService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  final List<User> usersList;
  Ranking({this.usersList});
  @override
  _RankingState createState() => _RankingState(usersList);
}

class _RankingState extends State<Ranking> {
  List<DataRow> _dataRows;
  List<User> _usersList;
  _RankingState(this._usersList);
  @override
  void initState() {
    getDataRows();
    super.initState();
  }

  getUsers() async {
    UserService.getUsers().then((users) {
      setState(() {
        _usersList = users;
      });
      getDataRows();
    });
  }

  getDataRows() {
    setState(() {
      _dataRows = _usersList
          .map((user) => DataRow(cells: [
                DataCell(Text(user.name)),
                DataCell(Text(user.points.toString()))
              ]))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dataRows == null
          ? SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            )
          : SingleChildScrollView(
              child: DataTable(
                sortColumnIndex: 1,
                sortAscending: true,
                columns: [
                  DataColumn(label: Text("Jogador"), numeric: false),
                  DataColumn(
                    label: Text("Pontos"),
                    numeric: true,
                  ),
                ],
                rows: _dataRows,
              ),
            ),
    );
  }
}

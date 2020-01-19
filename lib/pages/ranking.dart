import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/services/GetUsersList.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  List<DataRow> _dataRows;

  @override
  void initState() {
    getDataRows();
    super.initState();
  }

  getDataRows() async {
    UserService.getUsers().then((users) {
      setState(() {
        _dataRows = users
            .map((user) => DataRow(cells: [
                  DataCell(Text(user.name)),
                  DataCell(Text(user.points.toString()))
                ]))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bizinuca"),
        ),
        drawer: Menu(),
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
              ));
  }
}

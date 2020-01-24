import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/models/UserModel.dart';
import 'package:bizinuca/Repositories/UserRepository.dart';
import 'package:bizinuca/services/authentication_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  final List<UserModel> usersList;
  Ranking({this.usersList});
  @override
  _RankingState createState() => _RankingState(usersList);
}

class _RankingState extends State<Ranking> {
  List<DataRow> _dataRows;
  List<UserModel> _usersList;
  _RankingState(this._usersList);
  String _username;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUserLogged() {
    AuthenticationService.getUserLogged().then((user) {
      setState(() {
        _username = user.displayName;
      });
    });
  }

  getUsers() async {
    UserRepository.getUsers().then((users) {
      setState(() {
        _usersList = users;
      });
      getDataRows();
    });
  }

  getUserTextStyle(String name, String userLoggedName) {
    return name == userLoggedName
        ? TextStyle(
            color: Colors.blue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 17)
        : TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
  }

  getDataRows() async {
    var userLoggedname =
        (await AuthenticationService.getUserLogged()).displayName;
    TextStyle textStyle;
    setState(() {
      int position = 1;
      _dataRows = _usersList.map((user) {
        textStyle = getUserTextStyle(user.name, userLoggedname);
        return DataRow(cells: [
          DataCell(
            Text(
              '${position++}º',
              style: textStyle,
            ),
          ),
          DataCell(Text(user.name, style: textStyle)),
          DataCell(
            Text(
              user.points.toString(),
              style: textStyle,
            ),
          ),
        ]);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Olhe quem está no topo"),
      ),
      body: _dataRows == null
          ? SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            )
          : ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset("images/podium.png"),
                ),
                SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text("Pos."),
                        numeric: true,
                      ),
                      DataColumn(label: Text("Jogador"), numeric: false),
                      DataColumn(
                        label: Text("Pontos"),
                        numeric: false,
                      ),
                    ],
                    rows: _dataRows,
                  ),
                ),
              ],
            ),
    );
  }
}

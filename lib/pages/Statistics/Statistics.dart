import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/models/User.dart';
import 'package:bizinuca/pages/Gamehistory.dart';
import 'package:bizinuca/pages/graphs.dart';
import 'package:bizinuca/services/UserService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import './customWidgets/Ranking.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<User> _usersList;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 3);
    getUsers();
    super.initState();
  }

  getUsers() async {
    UserService.getUsers().then((users) {
      setState(() {
        _usersList = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Bizinuca Ranking"),
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              text: "Ranking",
            ),
            new Tab(
              text: "Statistics",
            ),
            new Tab(
              text: "History",
            )
          ],
        ),
      ),
      body: _usersList == null
          ? SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            )
          : TabBarView(
              controller: _tabController,
              children: <Widget>[
                Ranking(usersList: _usersList),
                GameHistory(),
                Graphs()
              ],
            ),
    );
  }
}

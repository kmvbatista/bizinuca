import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:bizinuca/Repositories/StatisticsRepository.dart';
import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/models/MatchModel.dart';
import 'package:bizinuca/models/UserModel.dart';
import 'Tabs/Gamehistory.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<UserModel> _usersList;
  List<MatchModel> _userGames;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 1);
    getStatistics();
    getUserGames();
    super.initState();
  }

  getStatistics() async {
    StatisticsRepository.getStatistics();
  }

  getUserGames() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Estatísticas"),
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              child: Icon(Icons.poll),
            ),
            // new Tab(
            //   child: Icon(Icons.event),
            // ),
            // new Tab(
            //   child: Icon(Icons.library_books),
            // )
          ],
        ),
      ),
      body: _usersList == null || _userGames == null
          ? SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            )
          : TabBarView(
              controller: _tabController,
              children: <Widget>[
                GameHistory(_userGames),
              ],
            ),
    );
  }
}

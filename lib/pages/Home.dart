import 'package:bizinuca/components/Menu.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Series<PointsPerDay, int>> parseUserPointsPerDay(
      List<PointsPerDay> points) {
    var list = new List<Series<PointsPerDay, int>>();
    list.add(new Series(
        data: points,
        domainFn: (PointsPerDay pointsPerDay, _) => pointsPerDay.day,
        measureFn: (PointsPerDay pointsPerDay, _) => pointsPerDay.points,
        id: 'Points per day'));
    return list;
  }

  getUserPointsPerDay() {
    var graphData = [
      new PointsPerDay(1000, 1),
      new PointsPerDay(1000, 2),
      new PointsPerDay(1000, 3),
      new PointsPerDay(700, 4),
      new PointsPerDay(1200, 5),
      new PointsPerDay(1000, 6),
      new PointsPerDay(1580, 7),
      new PointsPerDay(1000, 8),
      new PointsPerDay(900, 9),
      new PointsPerDay(1000, 10),
      new PointsPerDay(1000, 11),
      new PointsPerDay(1000, 12),
      new PointsPerDay(1000, 13),
      new PointsPerDay(1000, 14),
      new PointsPerDay(1200, 15),
      new PointsPerDay(1125, 16),
      new PointsPerDay(1230, 17),
      new PointsPerDay(1300, 19),
      new PointsPerDay(1400, 20),
      new PointsPerDay(1225, 21),
      new PointsPerDay(1300, 22),
      new PointsPerDay(1100, 23),
      new PointsPerDay(1300, 24),
      new PointsPerDay(1300, 25),
      new PointsPerDay(1210, 26),
      new PointsPerDay(1300, 27),
      new PointsPerDay(1300, 28),
      new PointsPerDay(1390, 29),
      new PointsPerDay(1100, 29),
      new PointsPerDay(1300, 30),
    ];
    return parseUserPointsPerDay(graphData);
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text("Flutter charts"),
            bottom: new TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                new Tab(
                  text: "Gráficos",
                ),
                new Tab(
                  text: "blablabla",
                ),
                new Tab(
                  text: "blablabla",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Seus pontos por dia",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: LineChart(getUserPointsPerDay()),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PointsPerDay {
  final int points;
  final int day;

  PointsPerDay(this.points, this.day);
}

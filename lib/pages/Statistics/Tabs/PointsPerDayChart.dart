import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/models/PointsPerDay.dart';
import 'package:bizinuca/pages/Statistics/CustomWidgets/ChartInLine.dart';
import 'package:flutter/material.dart';

class PointsPerDayChart extends StatefulWidget {
  final List<PointsPerDay> pointsPerDay;

  PointsPerDayChart(this.pointsPerDay);

  @override
  _PointsPerDayChartState createState() => _PointsPerDayChartState();
}

class _PointsPerDayChartState extends State<PointsPerDayChart>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        drawer: Menu(),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Clique em um jogo para ver os jogadores!",
                        style: TextStyle(
                            color: Colors.green,
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(child: PointsLineChart(widget.pointsPerDay))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

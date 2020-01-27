import 'package:bizinuca/components/Menu.dart';
import 'package:bizinuca/components/PrimaryButton.dart';
import 'package:bizinuca/models/PointsPerDay.dart';
import 'package:bizinuca/pages/Statistics/CustomWidgets/ChartInLine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PointsPerDayChart extends StatefulWidget {
  final List<PointsPerDay> pointsPerDay;

  PointsPerDayChart(this.pointsPerDay);

  @override
  _PointsPerDayChartState createState() => _PointsPerDayChartState();
}

class _PointsPerDayChartState extends State<PointsPerDayChart>
    with SingleTickerProviderStateMixin {
  List<DataRow> _dataRows;

  @override
  void initState() {
    super.initState();
    getDataRows();
  }

  getDataRows() {
    var textStyle = TextStyle(color: Colors.green);
    setState(() {
      _dataRows = widget.pointsPerDay.map((point) {
        return DataRow(cells: [
          DataCell(Text(DateFormat("dd-MM-yyyy").format(point.date),
              style: textStyle)),
          DataCell(
            Text(
              point.points.toString(),
              style: textStyle,
            ),
          ),
        ]);
      }).toList();
    });
  }

  showDetailsModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text("Dia"),
                      ),
                      DataColumn(
                        label: Text(
                          "Pontos",
                        ),
                      ),
                    ],
                    rows: _dataRows,
                  ),
                ),
              )
            ]),
          ),
          actions: <Widget>[
            FlatButton(
                child: Text("Sair"),
                onPressed: () => Navigator.of(context).pop())
          ],
        );
      },
    );
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
                  child: widget.pointsPerDay?.length == 0
                      ? Text('Não há dados para exibir.')
                      : Column(
                          children: <Widget>[
                            Text(
                              "Variação de pontos por dia jogado!",
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: PointsLineChart(widget.pointsPerDay)),
                            SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                                "Ver Lista Completa",
                                showDetailsModal,
                                Theme.of(context).primaryColor)
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

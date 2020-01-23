import 'dart:math';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

class PointsLineChart extends StatefulWidget {
  final bool animate;
  final List<PointsPerDay> points;

  PointsLineChart(this.points, {this.animate});

  @override
  _PointsLineChartState createState() => _PointsLineChartState();
}

class _PointsLineChartState extends State<PointsLineChart> {
  CustomCircleSymbolRenderer render = new CustomCircleSymbolRenderer('');

  List<Series<PointsPerDay, DateTime>> parseUserPointsPerDay(
      List<PointsPerDay> points) {
    var list = new List<Series<PointsPerDay, DateTime>>();
    list.add(new Series(
        data: points,
        domainFn: (PointsPerDay pointsPerDay, _) => pointsPerDay.day,
        measureFn: (PointsPerDay pointsPerDay, _) => pointsPerDay.points,
        id: 'Points per day',
        colorFn: (PointsPerDay points, _) =>
            ColorUtil.fromDartColor(Colors.green),
        labelAccessorFn: (PointsPerDay points, _) => '${points.points}'));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new TimeSeriesChart(
      parseUserPointsPerDay(widget.points),
      behaviors: [LinePointHighlighter(symbolRenderer: render)],
      selectionModels: [
        SelectionModelConfig(changedListener: (SelectionModel model) {
          render.label = model.selectedSeries[0]
              .measureFn(model.selectedDatum[0].index)
              .toString();
        })
      ],
      defaultRenderer: new LineRendererConfig(
          includePoints: true, strokeWidthPx: 1.2, includeArea: true),
    );
  }
}

class PointsPerDay {
  final int points;
  final DateTime day;

  PointsPerDay(this.points, this.day);
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  String label;

  CustomCircleSymbolRenderer(this.label);
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    var textStyle = style.TextStyle();
    textStyle.fontSize = 15;
    textStyle.color = Color.black;
    canvas.drawText(TextElement(label, style: textStyle), (bounds.left).round(),
        (bounds.top - 28).round());
  }
}

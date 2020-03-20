import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../common_widgets/responsive_padding.dart';

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class ChartBox extends StatelessWidget {
  ChartBox(this.seriesList, {this.animate});
  final List<charts.Series> seriesList;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: EdgeInsets.only(bottom: 9.0, right: 68.0, left: 68.0, top: 16.0),
      child: Container(
        width: 200.0,
        height: 200.0,
        child: new charts.TimeSeriesChart(
          seriesList,
          animate: animate,
          // domainAxis: new charts.EndPointsTimeAxisSpec(),
        )
      ),
    );
  }
}
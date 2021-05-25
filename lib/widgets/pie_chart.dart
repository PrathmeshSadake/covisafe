import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreenPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const HomeScreenPieChart({this.seriesList, this.animate});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: charts.PieChart(
        seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
          arcRendererDecorators: [
            new charts.ArcLabelDecorator(
                // labelPosition: charts.ArcLabelPosition.auto
                ),
          ],
        ),
      ),
    );
  }
}

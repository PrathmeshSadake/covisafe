import 'package:covisafe/models/pie_chart_stats.dart';
import 'package:covisafe/models/prevention.dart';
import 'package:covisafe/models/summary.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covisafe/utils/styles.dart';
import 'package:covisafe/widgets/legends_container.dart';
import 'package:covisafe/widgets/pie_chart.dart';
import 'package:covisafe/widgets/prevention_data.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Summary covidSummary;
  List<Prevention> preventionData = [];
  bool isLoading = false;

  num total;
  num confirmedCasesIndian;
  num confirmedCasesForeign;
  num discharged;
  num deaths;
  num confirmedButLocationUnidentified;

  loadSummaryData() async {
    setState(() {
      isLoading = true;
    });
    covidSummary = await Summary.getSummaryData();
    preventionData = await Prevention.getPreventionData();
    total = covidSummary.total;
    confirmedCasesIndian = covidSummary.confirmedCasesIndian;
    confirmedCasesForeign = covidSummary.confirmedCasesForeign;
    discharged = covidSummary.discharged;
    deaths = covidSummary.deaths;
    confirmedButLocationUnidentified =
        covidSummary.confirmedButLocationUnidentified;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                            'Total Cases in India: $total',
                            style: Styles.heading,
                          ),
                        ),
                      ),
                      Container(
                        child: HomeScreenPieChart(
                          seriesList: _createSampleData(),
                          animate: true,
                        ),
                      ),
                      LegendsContainer(
                        covidSummary: covidSummary,
                      ),
                      PreventionData(
                        preventionData: preventionData,
                      )
                    ],
                  ),
                ),
              ));
  }

  List<charts.Series<PieStats, String>> _createSampleData() {
    final data = [
      // new PieStats('Total', total),
      new PieStats(
          'Confirmed Indians', confirmedCasesIndian, Color(0xFF6050DC)),
      new PieStats(
          'Confirmed Foreigners', confirmedCasesForeign, Color(0xFFD52DB7)),
      new PieStats('Discharged', discharged, Color(0xFFFF2E7E)),
      new PieStats('Deaths', deaths, Color(0xFFFF6B45)),
      new PieStats('Confirmed But Location Unidentified',
          confirmedButLocationUnidentified, Color(0xFFFFAB05)),
    ];

    return [
      new charts.Series<PieStats, String>(
        id: 'Covid Summary',
        data: data,
        domainFn: (PieStats stat, _) => stat.title,
        measureFn: (PieStats stat, _) => stat.count,
        colorFn: (PieStats stat, _) =>
            charts.ColorUtil.fromDartColor(stat.color),
        labelAccessorFn: (PieStats row, _) => '${row.count}',
      )
    ];
  }
}

import 'package:covisafe/models/summary.dart';
import 'package:flutter/material.dart';

import 'legend.dart';

class LegendsContainer extends StatelessWidget {
  final Summary covidSummary;

  const LegendsContainer({this.covidSummary});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Legend(
            color: Color(0xFF6050DC),
            label: 'Confirmed Indians',
            count: covidSummary.confirmedCasesIndian,
          ),
          Legend(
            color: Color(0xFFD52DB7),
            label: 'Confirmed Foreigners',
            count: covidSummary.confirmedCasesForeign,
          ),
          Legend(
            color: Color(0xFFFF2E7E),
            label: 'Recovered',
            count: covidSummary.discharged,
          ),
          Legend(
            color: Color(0xFFFF6B45),
            label: 'Deaths',
            count: covidSummary.deaths,
          ),
          Legend(
            color: Color(0xFFFFAB05),
            label: 'Confirmed But Location Unidentified',
            count: covidSummary.confirmedButLocationUnidentified,
          ),
        ],
      ),
    );
  }
}

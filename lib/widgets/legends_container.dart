import 'package:covisafe/models/summary.dart';
import 'package:flutter/material.dart';

import 'legend.dart';

class LegendsContainer extends StatelessWidget {
  final Summary covidSummary;

  const LegendsContainer({this.covidSummary});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 10, // blur radius
            offset: Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
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

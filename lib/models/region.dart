import 'package:flutter/material.dart';

class Region {
  final String loc;
  final num confirmedCasesIndian;
  final num confirmedCasesForeign;
  final num discharged;
  final num deaths;
  final num totalConfirmed;

  Region({
    @required this.loc,
    @required this.confirmedCasesIndian,
    @required this.confirmedCasesForeign,
    @required this.discharged,
    @required this.deaths,
    @required this.totalConfirmed,
  });
}

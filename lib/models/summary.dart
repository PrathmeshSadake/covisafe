import 'package:flutter/foundation.dart';

class Summary {
  final num total;
  final num confirmedCasesIndian;
  final num confirmedCasesForeign;
  final num discharged;
  final num deaths;
  final num confirmedButLocationUnidentified;

  Summary({
    @required this.total,
    @required this.confirmedCasesIndian,
    @required this.confirmedCasesForeign,
    @required this.discharged,
    @required this.deaths,
    @required this.confirmedButLocationUnidentified,
  });
}

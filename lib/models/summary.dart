import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
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

  static Future<Summary> getSummaryData() async {
    var url = Uri.https(
        'api.rootnet.in', '/covid19-in/stats/latest', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = convert.jsonDecode(response.body);
      final summaryData = decodedData['data']['summary'];

      Summary covidSummary = Summary(
        total: summaryData['total'],
        confirmedCasesIndian: summaryData['confirmedCasesIndian'],
        confirmedCasesForeign: summaryData['confirmedCasesForeign'],
        discharged: summaryData['discharged'],
        deaths: summaryData['deaths'],
        confirmedButLocationUnidentified:
            summaryData['confirmedButLocationUnidentified'],
      );
      return covidSummary;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

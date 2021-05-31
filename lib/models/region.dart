import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Utils
import '../utils/date_formatter.dart';

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

  static List<Region> regionalDataList = [];
  static dynamic lastOriginUpdate;

  static Future<List<Region>> getRegionalData() async {
    var url = Uri.https(
        'api.rootnet.in', '/covid19-in/stats/latest', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = convert.jsonDecode(response.body);
      final regionalData = decodedData['data']['regional'];
      lastOriginUpdate =
          DateFormatter.formatter(decodedData['lastOriginUpdate']);
      regionalData.forEach((region) => {
            regionalDataList.add(
              Region(
                loc: region['loc'],
                confirmedCasesIndian: region['confirmedCasesIndian'],
                confirmedCasesForeign: region['confirmedCasesForeign'],
                discharged: region['discharged'],
                deaths: region['deaths'],
                totalConfirmed: region['totalConfirmed'],
              ),
            )
          });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return regionalDataList;
  }
}

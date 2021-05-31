import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// Utils
import 'package:covisafe/utils/date_formatter.dart';

class World {
  final dynamic name;
  final dynamic code;
  final dynamic population;
  final dynamic updatedAt;
  final dynamic deaths;
  final dynamic recovered;
  final dynamic confirmed;
  final dynamic critical;
  final dynamic recoveryRate;
  final dynamic deathRate;

  World({
    @required this.name,
    @required this.code,
    @required this.population,
    @required this.updatedAt,
    @required this.deaths,
    @required this.recovered,
    @required this.confirmed,
    @required this.critical,
    @required this.recoveryRate,
    @required this.deathRate,
  });

  static List<World> worldData = [];
  static bool isCountryNameValid;

  static Future<List<World>> getWorldData() async {
    var url = Uri.parse('https://corona-api.com/countries');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = convert.jsonDecode(response.body);
      final worldDecodedData = decodedData['data'];
      worldDecodedData.forEach((country) => {
            isCountryNameValid = isAscii(country['name']),
            if (isCountryNameValid)
              {
                worldData.add(
                  World(
                    name: country['name'],
                    code: country['code'],
                    population: country['population'],
                    updatedAt: DateFormatter.formatter(country['updated_at']),
                    deaths: country['latest_data']['deaths'],
                    recovered: country['latest_data']['recovered'],
                    confirmed: country['latest_data']['confirmed'],
                    critical: country['latest_data']['critical'],
                    recoveryRate: country['latest_data']['calculated']
                        ['recovery_rate'],
                    deathRate: country['latest_data']['calculated']
                        ['death_rate'],
                  ),
                )
              }
          });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return worldData;
  }
}

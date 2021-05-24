import 'package:covisafe/models/world.dart';
import 'package:flutter/material.dart';

class CountryData extends StatelessWidget {
  final World country;

  const CountryData({@required this.country});

  formatRate(dynamic rate) {
    return rate.toStringAsFixed(2) + '%';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 10, // blur radius
            offset: Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Country: ${country.name.toString()}'),
            Text('Population: ${country.population.toString()}'),
            Text('Cases Confirmed: ${country.confirmed.toString()}'),
            Text('Deaths: ${country.deaths.toString()}'),
            Text('Critical: ${country.critical.toString()}'),
            Text('Recovered: ${country.recovered.toString()}'),
            Text(
                'Death rate: ${country.deathRate != null ? formatRate(country.deathRate) : 'undefined'}'),
            Text(
                'Recovery rate: ${country.recoveryRate != null ? formatRate(country.recoveryRate) : 'undefined'}'),
            Text('Refreshed at ${country.updatedAt.toString()}'),
          ],
        ),
      ),
    );
  }
}

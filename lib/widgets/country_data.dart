import 'package:covisafe/models/world.dart';
import 'package:flutter/material.dart';

class CountryData extends StatelessWidget {
  final World country;

  const CountryData({@required this.country});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(country.name),
    );
  }
}

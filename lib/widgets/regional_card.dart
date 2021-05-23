import 'package:covisafe/models/region.dart';
import 'package:flutter/material.dart';

class RegionCard extends StatelessWidget {
  final Region region;

  const RegionCard({@required this.region});
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
            Text('Location: ${region.loc}'),
            Text(
                'Confirmed Indian cases in India: ${region.confirmedCasesIndian.toString()}'),
            Text(
                'Confirmed foreign cases in India: ${region.confirmedCasesForeign.toString()}'),
            Text('Total confirmed cases: ${region.totalConfirmed.toString()}'),
            Text('Patients Discharged: ${region.discharged.toString()}'),
            Text('Total Deaths: ${region.deaths.toString()}'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// Models
import '../models/region.dart';
// Utils
import '../utils/styles.dart';

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
          vertical: 10,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Location: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.loc,
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Confirmed Indian cases in India: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.confirmedCasesIndian.toString(),
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Confirmed foreign cases in India: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.confirmedCasesForeign.toString(),
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Total confirmed cases: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.totalConfirmed.toString(),
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Patients Discharged: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.discharged.toString(),
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Total Deaths: ',
                style: Styles.title,
                children: [
                  TextSpan(
                    text: region.deaths.toString(),
                    style: Styles.regionLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

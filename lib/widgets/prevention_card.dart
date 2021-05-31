import 'package:flutter/material.dart';
// Models
import '../models/prevention.dart';
// Utils
import '../utils/styles.dart';

class PreventionCard extends StatelessWidget {
  final Prevention data;
  PreventionCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: Styles.title,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.description,
              style: Styles.content,
            ),
          ],
        ),
      ),
    );
  }
}

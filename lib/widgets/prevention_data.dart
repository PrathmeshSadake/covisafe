import 'package:flutter/material.dart';
// Models
import '../models/prevention.dart';
// Utils
import '../utils/styles.dart';
// Widgets
import '../widgets/prevention_card.dart';

class PreventionData extends StatefulWidget {
  final List<Prevention> preventionData;

  const PreventionData({this.preventionData});

  @override
  _PreventionDataState createState() => _PreventionDataState();
}

class _PreventionDataState extends State<PreventionData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '7 Tips to keep you safe from Covid-19',
            style: Styles.homeHeading,
          ),
          ...widget.preventionData.map((data) => PreventionCard(data)).toList()
        ],
      ),
    );
  }
}

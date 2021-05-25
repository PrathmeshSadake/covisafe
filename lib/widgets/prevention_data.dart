import 'package:covisafe/models/prevention.dart';
import 'package:flutter/material.dart';

class PreventionData extends StatefulWidget {
  final List<Prevention> preventionData;

  const PreventionData({this.preventionData});

  @override
  _PreventionDataState createState() => _PreventionDataState();
}

class _PreventionDataState extends State<PreventionData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...widget.preventionData.map((e) => Text(e.title)).toList()],
    );
  }
}

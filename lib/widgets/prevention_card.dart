import 'package:covisafe/models/prevention.dart';
import 'package:flutter/material.dart';

class PreventionCard extends StatelessWidget {
  final Prevention data;
  PreventionCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title),
          Text(data.description),
        ],
      ),
    );
  }
}

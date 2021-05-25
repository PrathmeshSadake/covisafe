import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  final Color color;
  final String label;
  final num count;

  const Legend({this.color, this.label, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: color,
          height: 10,
          width: 10,
        ),
        SizedBox(
          width: 20,
        ),
        Text('$label - $count'),
      ],
    );
  }
}

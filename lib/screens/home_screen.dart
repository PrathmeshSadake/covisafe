import 'package:covisafe/models/summary.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Summary covidSummary;
  bool isLoading = false;
  loadSummaryData() async {
    setState(() {
      isLoading = true;
    });
    covidSummary = await Summary.getSummaryData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Center(
                child: Text(covidSummary.total.toString()),
              ),
            ),
    );
  }
}

import 'package:covisafe/models/world.dart';
import 'package:covisafe/widgets/country_data.dart';
import 'package:flutter/material.dart';

class WorldStatsScreen extends StatefulWidget {
  @override
  _WorldStatsScreenState createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> {
  List<World> worldCovidData;
  loadSummaryData() async {
    worldCovidData = await World.getWorldData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: worldCovidData == null || worldCovidData.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) => CountryData(
                    country: worldCovidData[index],
                  ),
                  itemCount: worldCovidData.length,
                ),
        ),
      ),
    );
  }
}

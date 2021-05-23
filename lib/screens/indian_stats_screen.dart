import 'package:covisafe/models/region.dart';
import 'package:covisafe/widgets/regional_card.dart';
import 'package:flutter/material.dart';

class IndianStats extends StatefulWidget {
  @override
  _IndianStatsState createState() => _IndianStatsState();
}

class _IndianStatsState extends State<IndianStats> {
  List<Region> regionalData = [];

  loadRegionalData() async {
    regionalData = await Region.getRegionalData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadRegionalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Indian Regions',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: regionalData.isEmpty || regionalData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  color: Colors.transparent,
                  child: Text(
                      'Last updated on: ${Region.lastOriginUpdate.toString()}'),
                ),
                Expanded(
                  // margin: EdgeInsets.only(top: 50),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) =>
                        RegionCard(region: regionalData[index]),
                    itemCount: regionalData.length,
                  ),
                ),
              ],
            ),
    );
  }
}

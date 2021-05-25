import 'package:covisafe/models/world.dart';
import 'package:covisafe/widgets/country_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldStatsScreen extends StatefulWidget {
  @override
  _WorldStatsScreenState createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> {
  List<World> worldCovidData = [];
  List<World> searchCountryCovidData = [];

  loadSummaryData() async {
    setState(() {
      worldCovidData = [];
    });
    worldCovidData = await World.getWorldData();
    setState(() {});
  }

  addSearchedDataToList() {
    for (var country in worldCovidData) {
      if (country.name
          .toString()
          .toLowerCase()
          .contains(searchField.toLowerCase())) {
        searchCountryCovidData.add(country);
      }
    }
  }

  _setInput(value) {
    searchCountryCovidData = [];
    setState(() {
      searchCountryCovidData = [];
      searchField = value;
      addSearchedDataToList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadSummaryData();
  }

  String searchField = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'World',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: worldCovidData == null || worldCovidData.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: TextField(
                        autofocus: false,
                        onChanged: _setInput,
                        onSubmitted: _setInput,
                        decoration: InputDecoration(
                            hintText: 'Search for Country',
                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 5),
                            suffixIcon: Icon(CupertinoIcons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13))),
                      ),
                    ),
                    Expanded(
                      child: searchField == null || searchField == ''
                          ? ListView.builder(
                              itemBuilder: (ctx, index) => CountryData(
                                country: worldCovidData[index],
                              ),
                              itemCount: worldCovidData.length,
                            )
                          : ListView.builder(
                              itemBuilder: (ctx, index) => CountryData(
                                country: searchCountryCovidData[index],
                              ),
                              itemCount: searchCountryCovidData.length,
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import './screens/home_screen.dart';
import './screens/world_stats_screen.dart';
// Widgets
import './widgets/custom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covisafe - Corona Virus Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVISAFE 😷',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.globe),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WorldStatsScreen()))),
        ],
      ),
      body: SafeArea(
        child: HomeScreen(),
      ),
      drawer: CustomDrawer(),
    );
  }
}

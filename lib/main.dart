import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './widgets/custom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covisafe - Corona Virus Tracker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: HomeScreen(),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}

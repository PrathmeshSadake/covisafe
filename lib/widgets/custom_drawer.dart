import 'package:covisafe/screens/contact_screen.dart';
import 'package:covisafe/screens/home_screen.dart';
import 'package:covisafe/screens/hospitals_screen.dart';
import 'package:covisafe/screens/news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.covid19india.org/';
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                margin: EdgeInsets.zero,
                accountName: Text('Prathmesh Sadake'),
                accountEmail: Text('prathmeshsadake@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fuploads-ssl.webflow.com%2F5bcd190539ce888450a18425%2F5fa05058e0db65254ab9d161_mememoji.png&f=1&nofb=1',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'Home',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.map_pin,
                  color: Colors.white,
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'India',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.news,
                  color: Colors.white,
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'News',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HospitalsScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.bed_double_fill,
                  color: Colors.white,
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'Hospitals & beds',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'Contact & helpline',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                _launched = _launchInBrowser(toLaunch);
              }),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.link,
                  color: Colors.indigo[900],
                ),
                horizontalTitleGap: 1.0,
                title: Text(
                  'covid19india.org',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.indigo[900],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

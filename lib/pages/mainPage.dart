import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:risk_resq/methods/commonMethods.dart';
import 'package:risk_resq/models/alerts.dart';
import 'package:risk_resq/pages/alerts.dart';
import 'package:risk_resq/pages/donate.dart';
import 'package:risk_resq/pages/home.dart';
import 'package:risk_resq/pages/profile/profile.dart';
import 'package:risk_resq/pages/profile/settings.dart';
import 'package:risk_resq/pages/profile/sos.dart';
import 'package:risk_resq/widgets/alertWidget.dart';
import 'package:risk_resq/widgets/menuDrawer.dart';
import 'package:risk_resq/widgets/myAppBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //final user = FirebaseAuth.instance.currentUser!;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Add your other pages to this list
  List<Widget> pages = [
    HomePage(),
    DisasterAlertWidget(),
    const SOS(),
    const Donate(),
    Settings(),
  ];

   List<String> titles =[
    "Home",
    "Alerts",
    "SOS",
    "Donate",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, title: titles[_currentIndex]),
      drawer: CustomDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.sos_outlined, size: 30),
          Icon(Icons.monetization_on, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Color.,
        buttonBackgroundColor: Color.fromARGB(255, 228, 208, 98),
        backgroundColor: Colors.transparent, // Set to transparent or the desired background color
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      body: pages[_currentIndex],
    );
  }
}



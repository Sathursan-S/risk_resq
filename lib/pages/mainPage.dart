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
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 228, 208, 98),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor:Color.fromARGB(255, 0, 4, 7),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
            backgroundColor:Color.fromARGB(255, 0, 4, 7),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'SOS',
            backgroundColor:Color.fromARGB(255, 0, 4, 7),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Donate',
            backgroundColor:Color.fromARGB(255, 0, 4, 7),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor:Color.fromARGB(255, 0, 4, 7),
          ),
        ],
      ),

      body: pages[_currentIndex],
    );
  }
}



import 'package:flutter/material.dart';

import '../models/user/user_data.dart';
import '../pages/profile/profile_page.dart';
import '../methods/commonMethods.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonMethods cm = CommonMethods();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 4, 7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Kumar Samaraweera',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.location_city_rounded,
              color: Color.fromARGB(255, 0, 4, 7),
              size: 35,
            ),
            title: const Text(
              'Change Location',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 4, 7), fontSize: 15),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 4, 7),
              size: 35,
            ),
            title: const Text(
              'My Profile',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 4, 7), fontSize: 15),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_emergency,
              color: Color.fromARGB(255, 0, 4, 7),
              size: 35,
            ),
            title: const Text(
              'Contact us',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 4, 7), fontSize: 15),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.question_mark,
              color: Color.fromARGB(255, 0, 4, 7),
              size: 35,
            ),
            title: const Text('Helps and FAQs',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 4, 7), fontSize: 15)),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 0, 4, 7),
              size: 35,
            ),
            title: const Text('Logout',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 4, 7), fontSize: 15)),
            onTap: () {
              cm.signOut(context);
            },
          ),
        ],
      ),
    );
  }
}

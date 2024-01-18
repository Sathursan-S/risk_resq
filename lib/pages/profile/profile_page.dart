import 'dart:async';
import 'package:flutter/material.dart';
import 'package:risk_resq/pages/profile/edit_description.dart';
import 'package:risk_resq/pages/profile/edit_email.dart';
import 'package:risk_resq/pages/profile/edit_name.dart';
import 'package:risk_resq/pages/profile/edit_phone.dart';

import '../../models/user/user.dart';
import '../../models/user/user_data.dart';
import '../../widgets/display_image_widget.dart';
import 'edit_image.dart';

// This class handles the Page to display the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData ud = UserData();
  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    final fetchedUser = await ud.getCurrentUser();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 228, 208, 98),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigateSecondPage(EditImagePage());
            },
            child: DisplayImage(
              imagePath: user?['imagePath'] ?? '', // Use '' or provide a default value
              onPressed: () {},
            ),
          ),
          buildUserInfoDisplay(user?['name'] ?? '', 'Name', EditNameFormPage()),
          buildUserInfoDisplay(user?['phone'] ?? '', 'Phone', EditPhoneFormPage()),
          buildUserInfoDisplay(user?['email'] ?? '', 'Email', EditEmailFormPage()),
          buildUserInfoDisplay(
            '${user?['age']} years, ${user?['gender']?.toString()?.split('.').last ?? ''}, ${user?['location'] ?? ''}',
            'Age, Gender, Location',
            EditAgeGenderLocationFormPage(),
          ),
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        navigateSecondPage(editPage);
                      },
                      child: Text(
                        getValue,
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  // Refreshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

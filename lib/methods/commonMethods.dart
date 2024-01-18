import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/login.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async {
    var connectionResults = await Connectivity().checkConnectivity();

    if (connectionResults != ConnectivityResult.mobile &&
        connectionResults != ConnectivityResult.wifi) {
      if (!context.mounted) return;
      displaySnackBar(

          "Internet Notworking /n Check the internet Connection", context);
    }
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
        (route) => false);
  }

  void displaySnackBar(String messageText, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(
        messageText,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        textColor: Colors.white,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool showAlert(
      BuildContext context, String title , String content, String actionText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(actionText))
            ],
          );
        });
    return false;
  }



}
import 'package:flutter/material.dart';

Widget buildSocialLoginButton(
    String imagePath, String text, VoidCallback onPressed) {
  return Container(
    width: 300,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(width: 10),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
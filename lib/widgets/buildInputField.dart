
import 'package:flutter/material.dart';

Widget buildInputField(
    IconData icon,
    String hintText,
    TextEditingController controller, {
      bool obscureText = false,
    }) {
  return Container(
    width: 357,
    height: 56,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
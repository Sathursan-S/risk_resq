import 'dart:ui';
import 'package:flutter/material.dart';


Widget buildButton(String text, VoidCallback onPressed) {
  return Container(
    width: 271,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 4, 7),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 228, 208, 98),
          fontSize: 18,
        ),
      ),
    ),
  );
}
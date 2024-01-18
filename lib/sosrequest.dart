import 'package:flutter/material.dart';

class SOSRescueReqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOS Rescue Request')),
      body: Stack(
        children:[
          Image.network('[^1^][1]', fit: BoxFit.cover),
          Positioned(
            bottom :10,
            left :10,
            child : ElevatedButton.icon(onPressed : (){}, icon : Icon(Icons.location_on), label : Text("Confirm Location"))
          )
        ]
      ),
    );
  }
}

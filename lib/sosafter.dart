import 'package:flutter/material.dart';

class SOSAfterScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
appBar : AppBar(title : Text("SOS - After")),
body :
Center(child :
Column(mainAxisAlignment: MainAxisAlignment.center, children:[
Icon(Icons.notification_important, size :100),
Text("Help is on the way!"),
ElevatedButton(onPressed: () {Navigator.pop(context);}, child:
Text("Got it!"))
])
)
);
}
}

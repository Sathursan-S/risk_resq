// import 'package:flutter/material.dart';
// import 'package:risk_resq/sosafter.dart';
// class SOS extends StatefulWidget {
//   const SOS({super.key});
//
//   @override
//   State<SOS> createState() => _SOSState();
// }
//
// class _SOSState extends State<SOS> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         SOSAfterScreen();
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:risk_resq/emergency.dart';
import 'package:risk_resq/sosafter.dart';

class SOS extends StatefulWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Use a button or any other widget to trigger the navigation
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SOSAfterScreen()),
          );
        },
        child: Text('Navigate to Emergency'),
      ),
    );
  }
}

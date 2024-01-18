import 'package:flutter/material.dart';

class EmergencyServiceButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const EmergencyServiceButton({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap
        print('Button tapped: $label');
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyServicesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emergency Services App'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            EmergencyServiceButton(
              icon: Icons.add_alert,
              label: 'SOS Rescue Request',
            ),
            EmergencyServiceButton(
              icon: Icons.family_restroom,
              label: 'Safe & Well Family Safety',
            ),
            EmergencyServiceButton(
              icon: Icons.healing,
              label: 'Basic Life Support',
            ),
            EmergencyServiceButton(
              icon: Icons.book,
              label: 'Medical Emergency Guidelines',
            ),
            EmergencyServiceButton(
              icon: Icons.local_hospital,
              label: 'First Aid Guide',
            ),
            EmergencyServiceButton(
              icon: Icons.contact_phone,
              label: 'Emergency Contacts',
            ),
            EmergencyServiceButton(
              icon: Icons.search,
              label: 'Medical Facility Search',
            ),
            EmergencyServiceButton(
              icon: Icons.description,
              label: 'My Clinical Records',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(EmergencyServicesApp());
}

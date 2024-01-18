import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey, // You can set a default color or use an image
              ),
              child: Center(
                child: Text(
                  'Add\nImage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEditPage()),
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 16),
            // About Me TextField
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'About Me',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Change About Me Button
            ElevatedButton(
              onPressed: () {
                // Handle change about me logic here
                print('Changing About Me...');
              },
              child: Text('Change About Me'),
            ),
            SizedBox(height: 16),
            // Interests Subtitle
            Text(
              'Interests',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Interest Options
            Column(
              children: [
                InterestOption('Technology'),
                InterestOption('New Knowledge'),
                InterestOption('Weather'),
                InterestOption('Farming'),
                InterestOption('Sensor'),
                InterestOption('Other'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InterestOption extends StatefulWidget {
  final String option;

  InterestOption(this.option);

  @override
  _InterestOptionState createState() => _InterestOptionState();
}

class _InterestOptionState extends State<InterestOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.option),
      leading: Checkbox(
        value: isSelected,
        onChanged: (value) {
          setState(() {
            isSelected = value ?? false;
          });
        },
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Implement the ProfileEditPage similar to the previous example
  // with the necessary text fields and logic for updating the profile.

  @override
  Widget build(BuildContext context) {
    // Implement the UI for the profile edit page.
    return Scaffold(
      // ...
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ProfilePage(),
//   ));
// }

import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/user/user_data.dart';

class EditAgeGenderLocationFormPage extends StatefulWidget {
  @override
  _EditAgeGenderLocationFormPageState createState() =>
      _EditAgeGenderLocationFormPageState();
}

class _EditAgeGenderLocationFormPageState
    extends State<EditAgeGenderLocationFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  UserData ud = UserData();
  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  @override
  void dispose() {
    ageController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void updateUserInfo(int age, String gender, String location) {
    Map<String , dynamic> user={
      "age": age,
      "gender" : gender,
      "location" : location,
    };
    ud.updateCurrentUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit more info'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Age', style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 60,
                width: 350,
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter your age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age.';
                    }
                    return 'Please enter a valid age.';
                  },
                ),
              ),
            ),
            Text('Gender', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: genders
                    .map(
                      (gender) => Row(
                    children: [
                      Radio<String>(
                        value: gender,
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      Text(gender),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
            Text('Location', style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 60,
                width: 350,
                child: TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location.';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateUserInfo(
                          int.tryParse(ageController.text) ?? 0,
                          selectedGender ?? '', // Replace with the actual gender logic
                          locationController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

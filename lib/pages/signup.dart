import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:risk_resq/models/user/user_data.dart';
import 'package:risk_resq/pages/home.dart';
import 'package:risk_resq/pages/mainPage.dart';

import '../methods/commonMethods.dart';
import '../widgets/buildButton.dart';
import '../widgets/buildInputField.dart';
import '../widgets/buildSocialButtons.dart';
import '../widgets/loadingDialog.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  CommonMethods cMethods = CommonMethods();
  UserData ud = UserData();

  checkIfNetworkAvailabe() {
    cMethods.checkConnectivity(context);
    signUpFormValidation();
  }

  signUpFormValidation() {
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar(
          "Your name Must have 4 or more characters", context);
    } else if (!emailTextEditingController.text.contains("@")) {
      cMethods.displaySnackBar("Please enter a valid email address", context);
    } else if (passwordTextEditingController.text.trim().length < 6) {
      cMethods.displaySnackBar(
          "Your password must have 6 or more characters", context);
    } else if (passwordTextEditingController.text !=
        confirmPasswordTextEditingController.text) {
      cMethods.displaySnackBar("Password does not match", context);
    } else {
      registerNewUser();
    }
  }

  registerNewUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(messageText: "Registering Your account..."),
    );

    final User? userFirebase = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((errorMessage) {
      Navigator.pop(context);
      cMethods.displaySnackBar(errorMessage.toString(), context);
    }))
        .user;

    ud.createUser({
      "name": userNameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "uid" : userFirebase!.uid,
    });

    if (!context.mounted) return;
    Navigator.pop(context);
    //
    // DatabaseReference usersRef =
    //     FirebaseDatabase.instance.ref().child("User").child(userFirebase!.uid);
    //
    // Map userDataMap = {
    //   "name": userNameTextEditingController.text.trim(),
    //   "email": emailTextEditingController.text.trim(),
    //   "id": userFirebase.uid,
    //   "blockStatus": "no",
    // };
    //
    // usersRef.set(userDataMap);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (c) => MainPage()), (route) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              buildInputField(
                Icons.person,
                'Full Name',
                userNameTextEditingController,
              ),
              SizedBox(height: 15),
              buildInputField(
                Icons.email,
                'abc@email.com',
                emailTextEditingController,
              ),
              SizedBox(height: 15),
              buildInputField(
                Icons.lock,
                'Enter your password',
                passwordTextEditingController,
                obscureText: true,
              ),
              SizedBox(height: 15),
              buildInputField(
                Icons.lock,
                'Confirm Password',
                confirmPasswordTextEditingController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              buildButton('SIGN UP', () {
                checkIfNetworkAvailabe();
              }),
              SizedBox(height: 20),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              buildSocialLoginButton(
                'assets/images/google.jpeg',
                'Login with Google',
                () {
                  // Implement your Google sign-in logic here
                },
              ),
              // SizedBox(height: 10),
              // buildSocialLoginButton(
              //   'assets/images/facebook.jpeg',
              //   'Login with Facebook',
              //       () {
              //     // Implement your Facebook sign-in logic here
              //   },
              // ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alraday have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signin()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

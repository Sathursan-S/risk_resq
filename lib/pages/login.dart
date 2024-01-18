import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:risk_resq/pages/home.dart';
import 'package:risk_resq/pages/mainPage.dart';
import 'package:risk_resq/pages/signup.dart';

import '../methods/commonMethods.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 248, 248),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                height: 120,
                width: 120,
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              buildInputField(Icons.email, 'Enter your email', emailController),
              SizedBox(height: 15),
              buildInputField(
                  Icons.lock, 'Enter your password', passwordController,
                  obscureText: true),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Implement your forgot password logic here
                  forgetPassword(context);
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildButton('SIGN IN', () {
                signin();
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
                  'assets/images/google.jpeg', 'Login with Google', () {
                // Implement your Google sign-in logic here
              }),
              // SizedBox(height: 10),
              // buildSocialLoginButton('assets/images/facebook.jpeg', 'Login with Facebook', () {
              //   // Implement your Facebook sign-in logic here
              // }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Text(
                      'Sign up',
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

  Widget buildInputField(
      IconData icon, String hintText, TextEditingController controller,
      {bool obscureText = false}) {
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
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
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

  void forgetPassword(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reset Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  sendPasswordResetEmail(emailController.text);
                },
                child: Text("Send Reset Email"),
              ),
            ],
          ),
        );
      },
    );
  }

  void sendPasswordResetEmail(String email) async {
    if(isValidEmail(email)) {
      cMethods.displaySnackBar("Invalid Email", context);
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      cMethods.displaySnackBar("Password reset email sent. Check your inbox.", context);
    } catch (e) {
      cMethods.displaySnackBar("Error: $e", context);
    }
  }

  Future<void> signin() async {
    if (!verifyForm()) {
      cMethods.displaySnackBar("Invalid Email or Password", context);
      passwordController.clear();
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = FirebaseAuth.instance.currentUser;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (route) => true,
      );
    } on FirebaseAuthException catch (e) {
      // Handle authentication exceptions if needed
      print('Error signing in: $e');
    }
  }

  verifyForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (isValidEmail(emailController.text)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

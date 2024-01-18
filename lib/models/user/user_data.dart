import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // static late SharedPreferences _preferences;
  // static const _keyUser = 'user';
  final db = FirebaseFirestore.instance;

  // static User myUser = User(
  //   image:
  //   "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
  //   name: 'Test Test',
  //   email: 'test.test@gmail.com',
  //   phone: '(208) 206-5039',
  //   age: 25,
  //   location: 'Test City',
  //   gender: 'Female',
  // );
  //
  // static Future init() async =>
  //     _preferences = await SharedPreferences.getInstance();
  //
  // static Future setUser(User user) async {
  //   final json = jsonEncode(user.toJson());
  //
  //   await _preferences.setString(_keyUser, json);
  // }
  //
  // static User getUser() {
  //   final json = _preferences.getString(_keyUser);
  //
  //   return json == null ? myUser : User.fromJson(jsonDecode(json));
  // }

  Future<Map<String,dynamic>> getCurrentUser() async{
    try{
      DocumentSnapshot doc = await db.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get();
      print(doc.data() as Map<String,dynamic>);
      return doc.data() as Map<String,dynamic>;
    }catch(e){
      print(e);
      return {};
    }
  }

  createUser(Map<String, dynamic> data) async{
    try{
      await db.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).set(data);
    }catch(e){
      print(e);
    }
  }

  updateCurrentUser(Map<String, dynamic> data) async{
    try{
      await db.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).update(data);
    }catch(e){
      print(e);
    }
  }

  deleteCurrentUser() async{
    try{
      await db.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).delete();
      return "success";
    }catch(e){
      print(e);
    }
  }
}

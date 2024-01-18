import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

class User {
  String image;
  String name;
  String email;
  String phone;
  int? age;
  String location;
  String gender; // Add 'gender' field

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.location,
    required this.gender,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    int? age,
    String? location,
    String? gender,
  }) =>
      User(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        age: age ?? this.age,
        location: location ?? this.location,
        gender: gender ?? this.gender,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    image: json['imagePath'],
    name: json['name'],
    email: json['email'],
    age: json['age'],
    location: json['location'],
    phone: json['phone'],
    gender: json['gender'], // Convert int to Gender enum
  );

  Map<String, dynamic> toJson() => {
    'imagePath': image,
    'name': name,
    'email': email,
    'age': age,
    'location': location,
    'phone': phone,
    'gender': gender, // Convert Gender enum to int
  };

}

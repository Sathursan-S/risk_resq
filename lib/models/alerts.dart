// create alert class
import 'dart:ui';

class Alert {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Image image;

  Alert({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.image,
  });

factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      image: json['image'],
    );
  }
}
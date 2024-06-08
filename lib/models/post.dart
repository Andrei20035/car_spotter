import 'package:car_spotter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Post {
  String id;
  final ImageProvider image;
  final User user;
  String? location;
  String? description;
  int points;
  final DateTime time;
  final String car;
  int likes;
  bool liked;
  final List<String>? comments;

  Post({
    String? id,
    this.description,
    required this.image,
    required this.user,
    required this.points,
    required this.car,
    this.location,
    this.likes = 0,
    this.liked = false,
    List<String>? comments,
  })  : id = id ?? Uuid().v4(),
        time = DateTime.now(),
        comments = comments ?? [];

  void editDescription(String newDescription) {
    description = newDescription;
  }

  String getId() {
    return id;
  }

  void addComment(String newComment) {
    comments!.add(newComment);
  }
}

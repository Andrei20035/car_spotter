import 'package:car_spotter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SpottedCar {
  String id;
  final ImageProvider image;
  final User user;
  String? location;
  String? description;
  int points;
  final DateTime time;
  final String car;

  SpottedCar(
      {String? id,
      this.description,
      required this.image,
      required this.user,
      required this.points,
      required this.car,
      this.location})
      : id = id ?? Uuid().v4(),
        time = DateTime.now();

  void editDescription(String newDescription) {
    description = newDescription;
  }
}

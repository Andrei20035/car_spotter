import 'package:flutter/material.dart';

class Car {
  final String make;
  final String model;
  final int year;
  ImageProvider? picture;

  Car({
    required this.make,
    required this.model,
    required this.year,
    this.picture
  });

  void updateCarPicture(ImageProvider newPicture) {
    picture = newPicture;
  }

  String getMake() => make;
  String getModel() => model;
  int getYear() => year;
}

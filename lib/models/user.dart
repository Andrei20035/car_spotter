import 'package:car_spotter/models/spotted_car.dart';
import 'package:car_spotter/models/user_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class User {
  String id;
  ImageProvider? profilePicture;
  String firstName;
  String lastName;
  String username;
  String country;
  int spotScore;
  Car? car;
  final List<SpottedCar> posts;
  final List<SpottedCar> currentDayPosts;

  User({
    String? id,
    this.profilePicture,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.country,
    this.spotScore = 0,
    this.car,
    List<SpottedCar>? currentDayPosts,
    List<SpottedCar>? posts
  })  : id = id ?? Uuid().v4(),
        posts = posts ?? [],
        currentDayPosts = currentDayPosts ?? [];


  void updateProfilePicture(ImageProvider newProfilePicture) {
    profilePicture = newProfilePicture;
  }

  ImageProvider? getProfilePicture() {
    return profilePicture;
  }

  void updateFirstName(String newFirstName) {
    firstName = newFirstName;
  }

  void updateLastName(String newLastName) {
    lastName = newLastName;
  }

  void updateUsername(String newUsername) {
    username = newUsername;
  }

  void updateCountry(String newCountry) {
    country = newCountry;
  }

  void updateCar(Car newCar) {
    car = newCar;
  }

  void addPost(SpottedCar newPost) {
    posts.add(newPost);
    currentDayPosts.add(newPost);
  }

  void deletePost(String id) {
    posts.removeWhere((post) => post.id == id);
    currentDayPosts.removeWhere((post) => post.id == id);
  }

  void resetTodayPosts() {
    currentDayPosts.clear();
  }
}

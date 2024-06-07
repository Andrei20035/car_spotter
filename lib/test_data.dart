import 'package:car_spotter/models/post.dart';
import 'package:car_spotter/models/user.dart';
import 'package:flutter/material.dart';

const ImageProvider profilePictureme =
    AssetImage('assets/images/profile_picture.jpg');
const ImageProvider profilePicture1 =
    AssetImage('assets/images/profile_picture1.jpg');
const ImageProvider profilePicture2 =
    AssetImage('assets/images/profile_picture2.jpg');

final User dummyUser = User(
  profilePicture: profilePictureme,
  username: "Andrei20035",
  firstName: "Andrei",
  lastName: "Rusu",
  country: "Romania",
);

final User friend1 = User(
  profilePicture: profilePicture1,
  username: "Friend1",
  firstName: "FirstName1",
  lastName: "LastName1",
  country: "Country1",
);

final User friend2 = User(
  profilePicture: profilePicture2,
  username: "Friend2",
  firstName: "FirstName2",
  lastName: "LastName2",
  country: "Country2",
);

final List<Post> postsDummyUser = [
  Post(
    image: const AssetImage('assets/images/dummyCar.png'),
    user: dummyUser,
    points: 300,
    car: "BMW E9",
  ),
  Post(
    image: const AssetImage('assets/images/posts/image1.jpg'),
    user: dummyUser,
    points: 300,
    car: "Lamborghini Aventador",
  ),
  Post(
    image: const AssetImage('assets/images/posts/image2.jpg'),
    user: dummyUser,
    points: 300,
    car: "Porsche Panamera",
  ),
];

final List<Post> postsFriend1 = [
  Post(
    image: const AssetImage('assets/images/posts/image3.jpg'),
    user: friend1,
    points: 300,
    car: "Ferrari LaFerrari",
    description: "Socate socate Socate socate Socate socate Socate socate "

  ),
  Post(
    image: const AssetImage('assets/images/posts/image4.jpg'),
    user: friend1,
    points: 300,
    car: "Mercedes E-class",
  ),
  Post(
    image: const AssetImage('assets/images/posts/image5.jpg'),
    user: friend1,
    points: 300,
    car: "Dodge Challenger",
  ),
];

final List<Post> postsFriend2 = [
  Post(
    image: const AssetImage('assets/images/posts/image6.jpg'),
    user: friend2,
    points: 300,
    car: "Audi R8",
  ),
  Post(
    image: const AssetImage('assets/images/posts/image7.jpg'),
    user: friend2,
    points: 300,
    car: "Lamborghini Aventador SV",
  ),
  Post(
    image: const AssetImage('assets/images/posts/image8.jpg'),
    user: friend2,
    points: 300,
    car: "McLaren 765LT",
  ),
];

final List<User> users = List.generate(10, (index) {
  return User(
    profilePicture: profilePictureme,
    username: 'User $index',
    firstName: 'FirstName $index',
    lastName: 'LastName $index',
    country: 'Country $index',
  );
});

void loadTestData() {
  dummyUser.addPost(postsDummyUser[0]);
  dummyUser.addPost(postsDummyUser[1]);
  dummyUser.addPost(postsDummyUser[2]);

  friend1.addPost(postsFriend1[0]);
  friend1.addPost(postsFriend1[1]);
  friend1.addPost(postsFriend1[2]);

  friend2.addPost(postsFriend2[0]);
  friend2.addPost(postsFriend2[1]);
  friend2.addPost(postsFriend2[2]);

  dummyUser.addFriend(friend1);
  dummyUser.addFriend(friend2);
}

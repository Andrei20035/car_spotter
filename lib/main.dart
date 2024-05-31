import 'package:car_spotter/models/spotted_car.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/models/user_car.dart';
import 'package:car_spotter/ui/screens/app_presentation.dart';
import 'package:car_spotter/models/list_of_screens.dart';
import 'package:car_spotter/ui/screens/feed.dart';
import 'package:car_spotter/ui/screens/login.dart';
import 'package:car_spotter/ui/screens/profile_customization.dart';
import 'package:car_spotter/ui/screens/your_car.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF080C30),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/AI_cars.png"), context);
    precacheImage(const AssetImage("assets/images/google-logo.png"), context);
    precacheImage(
        const AssetImage("assets/app_presentation/app_presentation_1.png"),
        context);
    precacheImage(
        const AssetImage("assets/app_presentation/app_presentation_2.png"),
        context);
    precacheImage(
        const AssetImage("assets/app_presentation/app_presentation_3.png"),
        context);
    precacheImage(
        const AssetImage("assets/app_presentation/app_presentation_4.png"),
        context);
    precacheImage(
        const AssetImage("assets/images/magnifying_glass.png"), context);
    precacheImage(const AssetImage("assets/images/podium.png"), context);




    const ImageProvider profilePictureme =
        AssetImage('assets/images/profile_picture.jpg');
    final User dummyUser = User(
        profilePicture: profilePictureme,
        username: "Andrei20035",
        firstName: "Andrei",
        lastName: "Rusu",
        country: "Romania");
    final SpottedCar dummyCar1 = SpottedCar(
      image: const AssetImage('assets/images/dummyCar.png'),
      user: dummyUser,
      points: 300,
      car: "BMW E9",
    );
    dummyUser.addPost(dummyCar1);

    final SpottedCar dummyCar2 = SpottedCar(
      image: const AssetImage('assets/images/dummyCar.png'),
      user: dummyUser,
      points: 300,
      car: "BMW E9",
    );
    dummyUser.addPost(dummyCar2);




    return MaterialApp(
      initialRoute: '/AppPresentation',
      routes: {
        '/AppPresentation': (context) =>
            AppPresentation(screens: ScreenList().screens),
        '/login': (context) => const LogInScreen(),
        '/profileCustomization': (context) => const ProfileCustomization(),
        '/yourCar': (context) => const YourCar(),
        '/feed': (context) => FeedScreen(user: dummyUser)
      },
    );
  }
}

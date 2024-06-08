import 'package:car_spotter/models/post.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/test_data.dart';
import 'package:car_spotter/ui/screens/app_presentation.dart';
import 'package:car_spotter/models/list_of_screens.dart';
import 'package:car_spotter/ui/screens/feed.dart';
import 'package:car_spotter/ui/screens/login.dart';
import 'package:car_spotter/ui/screens/profile_customization.dart';
import 'package:car_spotter/ui/screens/your_car.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF080C30),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  loadTestData();
  
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
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

    

    return MaterialApp(
      initialRoute: '/feed',
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

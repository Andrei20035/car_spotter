import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/widgets/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: const ButtonStyle(
            iconSize: WidgetStatePropertyAll(30),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color.fromARGB(255, 5, 8, 29),
            ],
            stops: [
              0,
              0.5,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.125),
              const EditProfile(),
              SizedBox(height: screenHeight * 0.0325),
              Text(
                'Account',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF8D8D8D),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

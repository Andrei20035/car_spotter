import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF000000), // Black color
            Color(0xFF080C30), // Dark blue color
          ],
          stops: [
            0.0,
            0.31,
          ],
        )),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenHeight * 0.025,
            right: screenHeight * 0.02,
            top: screenHeight * 0.14375,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Become a top spotter 🌟",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFDFA3A3),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.only(right: screenHeight * 0.07),
                child: Text(
                  "Engage in challenges, earn badges, and climb the leaderboard.",
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                      height: 1.5),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Image.asset(
                'assets/images/icons/podium.png',
                height: screenHeight * 0.4375,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

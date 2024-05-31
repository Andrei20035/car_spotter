import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/screens/login.dart';
import 'package:car_spotter/ui/widgets/screen_pill.dart';
import 'package:flutter/material.dart';

class ScreenPres4 extends StatelessWidget {
  const ScreenPres4({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final double tapPosition = details.localPosition.dx;
          if (tapPosition < screenWidth * 0.3) {
            Navigator.of(context).pop();
          } else if (tapPosition >= screenWidth * 0.3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          }
        },
        child: Container(
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
                      height: 1.5
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Image.asset(
                  'assets/images/podium.png',
                  height: screenHeight * 0.4375,
                ),
                const Spacer(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: screenHeight * 0.0625),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const ScreenPill(
                //         color: Color(0xFF878787),
                //       ),
                //       const SizedBox(width: 3),
                //       const ScreenPill(
                //         color: Color(0xFF878787),
                //       ),
                //       const SizedBox(width: 3),
                //       const ScreenPill(
                //         color: Color(0xFF878787),
                //       ),
                //       const SizedBox(width: 3),
                //       Container(
                //         height: screenHeight * 0.016,
                //         width: screenHeight * 0.095,
                //         decoration: const BoxDecoration(
                //           color: Color(0xFF465A93),
                //           borderRadius: BorderRadius.all(Radius.circular(20)),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

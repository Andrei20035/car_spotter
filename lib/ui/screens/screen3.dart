import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/app_presentation/app_presentation_3.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: screenHeight * 0.025,
                right: screenHeight * 0.02,
                top: screenHeight * 0.1125),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Capture the Moment",
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
                    "Snap and share your automotive encounters. Get recognized by a community of enthusiasts.",
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                      height: 1.5,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/icons/AI_cars.png',
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

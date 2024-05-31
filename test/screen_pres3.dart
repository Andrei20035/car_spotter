import 'package:car_spotter/main.dart';
import 'package:car_spotter/screens/test/screen_pres4.dart';
import 'package:car_spotter/ui/widgets/screen_pill.dart';
import 'package:flutter/material.dart';

class ScreenPres3 extends StatelessWidget {
  const ScreenPres3({super.key});

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
                  return const ScreenPres4();
                },
              ),
            );
          }
        },
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/app_presentation/app_presentation_3.png"),
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
                    'assets/images/AI_cars.png',
                    height: screenHeight * 0.4375,
                  ),
                  const Spacer(),
                ],
              ),
            )),
      ),
    );
  }
}

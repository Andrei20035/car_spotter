import 'package:car_spotter/main.dart';
import 'package:car_spotter/screens/test/screen_pres3.dart';
import 'package:car_spotter/ui/widgets/screen_pill.dart';
import 'package:flutter/material.dart';

class ScreenPres2 extends StatelessWidget {
  const ScreenPres2({super.key});

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
                  return const ScreenPres3();
                },
              ),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/app_presentation/app_presentation_2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: screenHeight * 0.025,
                right: screenHeight * 0.02,
                top: screenHeight * 0.22875),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Spot the Unseen",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFDFA3A3),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: screenHeight * 0.0625),
                  child: Text(
                    "Uncover hidden gems on the streets, from vintage classics to the latest supercars.",
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.0625,
                ),
                Image.asset(
                  "assets/images/magnifying_glass.png",
                  height: screenHeight * 0.25,
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
                //       Container(
                //         height: screenHeight * 0.016,
                //         width: screenHeight * 0.095,
                //         decoration: const BoxDecoration(
                //           color: Color(0xFF465A93),
                //           borderRadius: BorderRadius.all(Radius.circular(20)),
                //         ),
                //       ),
                //       const SizedBox(width: 3),
                //       const ScreenPill(
                //         color: Color(0xFF878787),
                //       ),
                //       const SizedBox(width: 3),
                //       const ScreenPill(
                //         color: Color(0xFF878787),
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

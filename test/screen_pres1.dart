import 'package:car_spotter/main.dart';
import 'package:car_spotter/screens/test/screen_pres2.dart';
import 'package:car_spotter/ui/widgets/screen_pill.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ScreenPres1 extends StatelessWidget {
  const ScreenPres1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final double tapPosition = details.localPosition.dx;
          if (tapPosition < screenWidth * 0.3) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          } else if (tapPosition >= screenWidth * 0.3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ScreenPres2();
                },
              ),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/app_presentation/app_presentation_1.png"),
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
                  "Welcome to",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                GradientText(
                  "CarSpotter!",
                  colors: const [
                    Color(0xFF4285F4),
                    Color(0xFF9B72CB),
                    Color(0xFFD96570),
                    Color(0xFFA470A8),
                  ],
                  stops: const [
                    0.03,
                    0.31,
                    0.84,
                    1,
                  ],
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
                const Spacer(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: screenHeight * 0.0625),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
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

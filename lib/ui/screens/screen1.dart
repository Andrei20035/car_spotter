import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/app_presentation/app_presentation_1.png"),
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
            ],
          ),
        ),
      ),
    );
  }
}

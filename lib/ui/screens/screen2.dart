import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/app_presentation/app_presentation_2.png"),
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
                "assets/images/icons/magnifying_glass.png",
                height: screenHeight * 0.25,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

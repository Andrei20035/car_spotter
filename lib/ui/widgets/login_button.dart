import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.color,
      required this.onPressed,
      this.icon = false,
      required this.text});

  final Color color;
  final Function()? onPressed;
  final bool icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        alignment: Alignment.center,
        minimumSize: Size(double.infinity, screenHeight * 0.06),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: icon, 
            child: Image.asset(
              'assets/images/icons/google-logo.png',
              width: screenHeight * 0.0325,
            ),
          ),
          Visibility(
            visible: icon,
            child: SizedBox(width: screenHeight * 0.02125),
          ),
          Text(
            text,
            style: theme.textTheme.bodyLarge!.copyWith(
                color: const Color(0xFF000000),
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

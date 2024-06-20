import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 0.1475 * screenHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 0.067 * screenHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color(0xFF38394A),
            ),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.044),
                const Icon(Icons.person_outline, color: Colors.white, size: 32),
                SizedBox(width: screenWidth * 0.044),
                Text(
                  "Personal info",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.067 * screenHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Color(0xFF38394A),
            ),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.044),
                const Icon(Icons.notifications_active_outlined,
                    color: Colors.white, size: 32),
                SizedBox(width: screenWidth * 0.044),
                Text(
                  "Notifications settings",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

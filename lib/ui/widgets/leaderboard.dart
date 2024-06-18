import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.212,
      width: double.infinity,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFFE79209),
        //     Color(0xFFFFC05B),
        //   ],
        //   stops: [
        //     0,
        //     0.7,
        //   ],
        //   begin: Alignment(-1, 1),
        //   end: Alignment(1, -1),
        // ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
            image: AssetImage("assets/images/leaderboard.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Leaderboard",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: Text(
                "Check your rank within the car-spotting community.",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

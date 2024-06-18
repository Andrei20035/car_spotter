import 'package:car_spotter/main.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/ui/widgets/semicircular_progress_bar.dart';
import 'package:flutter/material.dart';

class SpotScore extends StatelessWidget {
  const SpotScore({super.key, required this.user});

  final User user;

  double _calculateFontSize(int score) {
    if (score.toString().length <= 4) {
      return 60;
    } else {
      return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.2025,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFD96570),
            Color(0xFFA470BE),
          ],
          stops: [
            0,
            0.8,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "SpotScore",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Text(
                    "${user.spotScore}",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: _calculateFontSize(user.spotScore),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${user.calculateRemainingPoints()} until next rank",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.0555,
                  right: screenWidth * 0.0555,
                  bottom: screenHeight * 0.0625),
              child: SemicircularProgressBar(
                progress: user.calculateProgress(),
                range: user.calculateRange(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

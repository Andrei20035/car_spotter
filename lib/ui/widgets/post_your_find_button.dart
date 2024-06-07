import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class PostYourFindButton extends StatelessWidget {
  const PostYourFindButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFD96570),
              Color(0xFFA470BE),
            ],
          ),
        ),
        child: Container(
          width: screenWidth * 0.5888,
          height: screenHeight * 0.0625,
          alignment: Alignment.center,
          child: Text(
            "Post your find",
            style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

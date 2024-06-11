import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class AutoScrollRow extends StatelessWidget {
  const AutoScrollRow({super.key, required this.text, this.fontWeight = FontWeight.w600, this.size = 14});

  final String text;
  final FontWeight fontWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextScroll(
        text,
        mode: TextScrollMode.bouncing,
        velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
        delayBefore: const Duration(seconds: 2),
        numberOfReps: 500,
        pauseBetween: const Duration(seconds: 2),
        fadedBorder: true,
        fadeBorderSide: FadeBorderSide.right,
        pauseOnBounce: const Duration(seconds: 2),
        style: theme.textTheme.bodyLarge!.copyWith(
            color: const Color(0xFFFFFFFF),
            fontSize: size,
            fontWeight: fontWeight),
      ),
    );
  }
}

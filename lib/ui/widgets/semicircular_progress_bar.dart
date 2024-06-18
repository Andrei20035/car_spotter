import 'dart:math';
import 'package:flutter/material.dart';

class SemicircularProgressBar extends StatelessWidget {
  final double progress;
  final List<int>? range;

  const SemicircularProgressBar(
      {super.key, required this.progress, required this.range});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CustomPaint(
          painter: _SemicircularProgressPainter(progress),
          size: Size(screenHeight * 0.15, screenHeight * 0.075),
        ),
      ],
    );
  }
}

double degreesToRadians(double degrees) {
  return degrees * pi / 180;
}

class _SemicircularProgressPainter extends CustomPainter {
  final double progress;

  _SemicircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 20
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height * 2),
      degreesToRadians(145),
      degreesToRadians(252),
      false,
      paint,
    );

    paint.color = Colors.blue;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height * 2),
      degreesToRadians(145),
      degreesToRadians(252) * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

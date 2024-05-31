import 'package:flutter/material.dart';

class ScreenPill extends StatefulWidget {
  const ScreenPill({
    super.key,
    required this.id,
    required this.tabController,
    this.color = const Color(0xFF878787),
    this.heightPercentage = 0.009,
  });

  final Color color;
  final double heightPercentage;
  final int id;
  final TabController tabController;

  @override
  State<ScreenPill> createState() => _ScreenPillState();
}

class _ScreenPillState extends State<ScreenPill> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Radius roundness = Radius.circular(screenHeight * 0.105 * 0.1);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: screenWidth / 4 - 1.6,
      height: widget.tabController.index == widget.id
          ? screenHeight * 0.014
          : screenHeight * widget.heightPercentage,
      decoration: BoxDecoration(
        color: widget.tabController.index == widget.id
            ? const Color(0xFF465A93)
            : widget.color,
        borderRadius: BorderRadius.only(topLeft: roundness, topRight: roundness),
      ),
    );
  }
}

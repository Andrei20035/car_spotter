import 'package:car_spotter/ui/widgets/screen_pill.dart';
import 'package:flutter/material.dart';

class ScreenPillRow extends StatefulWidget {
  const ScreenPillRow({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  State<ScreenPillRow> createState() => _ScreenPillRowState();
}

class _ScreenPillRowState extends State<ScreenPillRow> {
  final percentageHeightForCurrent = 0.0625;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ScreenPill(id: 0,color: const Color(0xFF878787), tabController: widget.tabController,),
          ScreenPill(id: 1,color: const Color(0xFF878787), tabController: widget.tabController,),
          ScreenPill(id: 2,color: const Color(0xFF878787), tabController: widget.tabController,),
          ScreenPill(id: 3,color: const Color(0xFF878787), tabController: widget.tabController,),
        ],
      );
  }
}

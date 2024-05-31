import 'package:car_spotter/ui/widgets/screen_pill_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppPresentation extends StatefulWidget {
  const AppPresentation({super.key, required this.screens});

  final List<Widget> screens;

  @override
  State<AppPresentation> createState() {
    return _AppPresentationState();
  }
}

class _AppPresentationState extends State<AppPresentation>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTapUp: (details) {
              final double tapPosition = details.localPosition.dx;
              final double threshold = screenWidth * 0.4;
              if (_currentPageIndex == 3 && tapPosition >= threshold) {
                Navigator.pushNamed(context, '/login');
              } else if (tapPosition < threshold) {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCirc);
              } else if (tapPosition >= threshold) {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCirc);
              }
            },
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: _handlePageViewChanged,
              children: widget.screens,
            ),
          ),
          Positioned(
            bottom: 0,
            width: screenWidth,
            child: ScreenPillRow(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            ),
          ),
        ],
      ),
    );
  }
}

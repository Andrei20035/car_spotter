import 'package:car_spotter/main.dart';
import 'package:car_spotter/models/post.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/providers/current_day_post_provider.dart';
import 'package:car_spotter/ui/widgets/scrolling_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CurrentDayPosts extends ConsumerStatefulWidget {
  const CurrentDayPosts({super.key, required this.user});

  final User user;

  @override
  ConsumerState<CurrentDayPosts> createState() {
    return _CurrentDayPostsState();
  }
}

class _CurrentDayPostsState extends ConsumerState<CurrentDayPosts> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int currentPage = _pageController.page?.round() ?? 0;
      ref.read(currentDayPostProvider.notifier).setPage(currentPage);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();    
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenWidth * 0.542,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.user.currentDayPosts.length,
        itemBuilder: (context, index) {
          Post post = widget.user.currentDayPosts[index];
          return Row(
            children: [
              Expanded(
                child: Image(
                  image: post.image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05555,
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/points.png',
                            scale: 1.7,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${post.points} points",
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 3),
                          Image.asset(
                            'assets/images/icons/clock.png',
                            scale: 2,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            DateFormat('d MMMM HH:mm').format(post.time),
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 3),
                          Image.asset(
                            'assets/images/icons/car.png',
                            scale: 2,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            post.car,
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 3),
                          Image.asset(
                            'assets/images/icons/gps.png',
                            scale: 2,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "London, UK",
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

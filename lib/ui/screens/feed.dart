import 'package:car_spotter/main.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/providers/current_day_post_provider.dart';
import 'package:car_spotter/test_data.dart';
import 'package:car_spotter/ui/widgets/current_day_posts.dart';
import 'package:car_spotter/ui/widgets/feed_posts.dart';
import 'package:car_spotter/ui/widgets/post_your_find_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.user});

  final User user;

  @override
  State<FeedScreen> createState() {
    return _FeedScreenState();
  }
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.12,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.people,
                color: Colors.white,
                size: 30,
              )),
        ),
        title: GradientText(
          "CarSpotter",
          colors: const [
            Color(0xFF4285F4),
            Color(0xFF9B72CB),
            Color(0xFFD96570),
            Color(0xFFA470A8),
          ],
          stops: const [
            0.03,
            0.31,
            0.84,
            1,
          ],
          style: theme.textTheme.titleLarge!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.044),
            child: CircleAvatar(
                backgroundImage: widget.user.getProfilePicture(),
                radius: screenWidth * 0.055),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF080C30),
            ],
            stops: [
              0.0,
              0.54,
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.17),
                CurrentDayPosts(user: widget.user),
                SizedBox(height: screenHeight * 0.04),
                Consumer(builder: (context, ref, child) {
                  final currentPage = ref.watch(currentDayPostProvider);
                  final numberOfPages = widget.user.posts.length;
                  return Wrap(
                    spacing: 30,
                    children: List.generate(numberOfPages, (index) {
                      return Icon(
                        Icons.circle,
                        color: currentPage == index
                            ? Colors.white
                            : const Color(0xFF696969),
                        size: 12,
                      );
                    }),
                  );
                }),
                SizedBox(height: screenHeight * 0.04),
                const PostYourFindButton(),
                SizedBox(height: screenHeight * 0.04),
                FeedPosts(user: dummyUser),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

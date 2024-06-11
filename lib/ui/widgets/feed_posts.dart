import 'dart:ui';

import 'package:car_spotter/main.dart';
import 'package:car_spotter/models/post.dart';
import 'package:car_spotter/models/user.dart';
import 'package:car_spotter/ui/widgets/scrolling_row.dart';
import 'package:flutter/material.dart';

class FeedPosts extends StatefulWidget {
  const FeedPosts({super.key, required this.user});

  final User user;

  @override
  State<FeedPosts> createState() => _FeedPostsState();
}

class _FeedPostsState extends State<FeedPosts> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<User> friends = widget.user.friends;

    List<Post> allPosts = [];
    for (final friend in friends) {
      allPosts.addAll(friend.currentDayPosts);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allPosts.length,
      itemBuilder: (context, index) {
        final post = allPosts[index];
        return Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: post.user.getProfilePicture(),
                  radius: screenHeight * 0.0246875,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.username,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/car.png',
                            scale: 3,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${post.car},',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/icons/gps.png',
                            scale: 3,
                          ),
                          const SizedBox(width: 3),
                          AutoScrollRow(
                            text: post.location ?? "N/A",
                            size: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/icons/three-dots.png",
                    scale: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: post.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: screenHeight * 0.05626,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 3,
                    bottom: -3,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (post.liked == false) {
                                setState(() {
                                  post.liked = !post.liked;
                                  post.likes++;
                                });
                              } else {
                                setState(() {
                                  post.liked = !post.liked;
                                  post.likes--;
                                });
                              }
                            },
                            icon: Image.asset(
                              'assets/images/icons/like.png',
                              scale: 2,
                              color: post.liked == false
                                  ? Colors.white
                                  : Colors.red,
                            )),
                        Text(
                          "${post.likes}",
                          style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/icons/comment.png',
                              scale: 2),
                        ),
                        Text(
                          "${post.comments!.length}",
                          style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (post.description != null)
              Text(
                post.description!,
                overflow: TextOverflow.fade,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: screenHeight * 0.04)
          ],
        );
      },
    );
  }
}

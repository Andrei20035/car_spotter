import 'package:car_spotter/main.dart';
import 'package:car_spotter/models/post.dart';
import 'package:car_spotter/models/user.dart';
import 'package:flutter/material.dart';

class FeedPosts extends StatelessWidget {
  const FeedPosts({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);

    final List<User> friends = user.friends;

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
                  Column(
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
                          Text(
                            post.location ?? "No location found",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/icons/three-dots.png",
                        scale: 20, color: Colors.white,),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                child: Container(
                  height: screenHeight * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: post.image,
                      fit: BoxFit.cover,
                    ),
                  ),
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

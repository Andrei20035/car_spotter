import 'package:car_spotter/main.dart';
import 'package:car_spotter/providers/friends_switch_provider.dart';
import 'package:car_spotter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsList extends ConsumerStatefulWidget {
  const FriendsList({super.key});

  @override
  ConsumerState<FriendsList> createState() {
    return _FriendsListState();
  }
}

class _FriendsListState extends ConsumerState<FriendsList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final currentUser = ref.watch(userNotifierProvider);
    final isFriendsSelected = ref.watch(friendsSelectionProvider);
    final friendsList =
        isFriendsSelected ? currentUser.friends : currentUser.friendRequests;
    print(isFriendsSelected);

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      shrinkWrap: true,
      itemCount: friendsList.length,
      itemBuilder: (context, index) {
        final user = friendsList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            height: screenHeight * 0.067,
            width: screenWidth * 0.9166,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFF38394A),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.profilePicture,
                    radius: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    user.username,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  if (!isFriendsSelected) ...[
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(userNotifierProvider.notifier)
                            .acceptFriendRequest(user);
                      },
                      child: Container(
                        height: screenHeight * 0.0425,
                        width: screenWidth * 0.1083,
                        decoration: const BoxDecoration(
                            color: Color(0xFF3A9AFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.done,
                            color: Color(0xFF0051B1), size: 25),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(userNotifierProvider.notifier)
                            .removeFriendRequest(user);
                      },
                      child: Container(
                        height: screenHeight * 0.0425,
                        width: screenWidth * 0.1083,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFB5B5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.close_rounded,
                            color: Color(0xFFE8546E), size: 25),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

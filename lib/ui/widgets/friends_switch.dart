import 'package:car_spotter/main.dart';
import 'package:car_spotter/providers/friends_switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsSwitch extends ConsumerStatefulWidget {
  const FriendsSwitch({super.key});

  @override
  ConsumerState<FriendsSwitch> createState() => _FriendsSwitchState();
}

class _FriendsSwitchState extends ConsumerState<FriendsSwitch> {
  bool _isFriendsSelected = true;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(friendsSelectionProvider.notifier).state = true;
            setState(() {
              _isFriendsSelected = true;
            });
          },
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.4166,
                height: screenHeight * 0.0525,
                decoration: BoxDecoration(
                  color: _isFriendsSelected
                      ? const Color(0xFF2B8CFE)
                      : const Color(0xFF4A4A4A),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    "Friends",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Icon(
                Icons.circle,
                color: _isFriendsSelected
                    ? const Color(0xFF2B8CFE)
                    : Colors.transparent,
                size: 8,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(friendsSelectionProvider.notifier).state = false;
            setState(() {
              _isFriendsSelected = false;
            });
          },
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.4166,
                height: screenHeight * 0.0525,
                decoration: BoxDecoration(
                  color: _isFriendsSelected
                      ? const Color(0xFF4A4A4A)
                      : const Color(0xFF2B8CFE),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    "Requests",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Icon(
                Icons.circle,
                color: _isFriendsSelected
                    ? Colors.transparent
                    : const Color(0xFF2B8CFE),
                size: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

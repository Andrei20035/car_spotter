import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/widgets/friends_list.dart';
import 'package:car_spotter/ui/widgets/friends_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class FriendsScreen extends ConsumerStatefulWidget {
  const FriendsScreen({super.key});

  @override
  ConsumerState<FriendsScreen> createState() {
    return _FriendsScreenState();
  }
}

class _FriendsScreenState extends ConsumerState<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize.screenHeight;
    final double screenWidth = ScreenSize.screenWidth;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon:
                const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color.fromARGB(255, 5, 8, 29),
            ],
            stops: [
              0,
              0.5,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.125),
            const FriendsSwitch(),
            SizedBox(height: screenHeight * 0.035),
            const FriendsList(),
          ],
        ),
      ),
    );
  }
}

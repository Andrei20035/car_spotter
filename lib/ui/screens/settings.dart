import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/widgets/settings_screen/account_options.dart';
import 'package:car_spotter/ui/widgets/settings_screen/edit_profile.dart';
import 'package:car_spotter/ui/widgets/settings_screen/other_settings.dart';
import 'package:car_spotter/ui/widgets/settings_screen/security_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(200, 0, 0, 0),
                Color.fromARGB(70, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
              stops: [
                0.4,
                0.6,
                0.8,
                0.9,
              ],
            ),
          ),
          child: AppBar(
            scrolledUnderElevation: 0.0,
            toolbarHeight: screenHeight * 0.1,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: const ButtonStyle(
                iconSize: WidgetStatePropertyAll(30),
              ),
            ),
            title: Text(
              "Settings",
              style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.125),
                const EditProfile(),
                SizedBox(height: screenHeight * 0.0325),
                Text(
                  'Account',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF8D8D8D),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const AccountOptions(),
                SizedBox(height: screenHeight * 0.0325),
                Text(
                  'Security',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF8D8D8D),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SecurityOptions(),
                SizedBox(height: screenHeight * 0.0325),
                Text(
                  'Others',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF8D8D8D),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const OtherSettings(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout_outlined,
                        size: 30, color: Colors.red),
                    const SizedBox(width: 5),
                    Text(
                      'Log out',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

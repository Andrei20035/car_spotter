import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/widgets/login_button.dart';
import 'package:car_spotter/ui/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final double containerHeightLogIn = 0.5717;
  final double containerHeightSignUp = 0.6728;
  final double titleSpaceSignUp = 0.0723;
  final double titleSpaceLogIn = 0.123;

  double containerHeight = 0.571;
  double titleSpace = 0.123;

  List<String> fields = ["Email address", "Password"];

  bool isSignUp = false;

  void signUp() {
    setState(() {
      isSignUp = true;
      containerHeight = containerHeightSignUp;
      titleSpace = titleSpaceSignUp;
      fields.insert(0, 'Username');
    });
  }

  void logIn() {
    setState(() {
      isSignUp = false;
      containerHeight = containerHeightLogIn;
      titleSpace = titleSpaceLogIn;
      fields.removeAt(0);
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
              0.24,
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.055),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * titleSpace),
                    child: Column(
                      children: [
                        GradientText(
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
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          "Spot. Snap. Share.",
                          style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: screenHeight * 0.1),
                  Container(
                    height: screenHeight * containerHeight,
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    child: Form(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * 0.05),
                            for (var field in fields)
                              Column(
                                children: [
                                  TextInputField(
                                    text: field,
                                    controller: TextEditingController(),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                ],
                              ),
                            SizedBox(height: screenHeight * 0.095),
                            LoginButton(
                              text: isSignUp ? "Sign Up" : "Log In",
                              color: const Color(0xFFF0AB25),
                              onPressed: () {Navigator.pushNamed(context, "/profileCustomization");},
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            LoginButton(
                              text: isSignUp
                                  ? "Sign Up with Google"
                                  : "Log In with Google",
                              color: const Color(0xFFD9D9D9),
                              onPressed: () {Navigator.pushNamed(context, "/profileCustomization");},
                              icon: true,
                            ),
                            SizedBox(height: screenHeight * 0.025),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSignUp ? "Already have an account?" : "Don't have an acount?" ,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    isSignUp ? logIn() : signUp();
                                  },
                                  child: Text(
                                    isSignUp ? " Log In" : " Sign Up",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontSize: 13,
                                      color: const Color(0xFFF0AB25),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:car_spotter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF000000),
                Color(0xFF080C30),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.31,
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.19),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Spot. Snap. Share.",
                style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(height: height * 0.086),
              Expanded(
                child: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.06),
                      Padding(
                        padding: EdgeInsets.only(left: height * 0.06),
                        child: Text(
                          "Email address",
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF717171),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: height * 0.03,
                          right: height * 0.03,
                          top: 4,
                        ),
                        height: height * 0.06,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(300)),
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.03),
                          child: TextField(
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFF434343),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                            cursorColor: const Color(0xFF434343),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFF434343),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: EdgeInsets.only(left: height * 0.06),
                        child: Text(
                          "Password",
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF717171),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: height * 0.03, right: height * 0.03, top: 4),
                        height: height * 0.06,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(300)),
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

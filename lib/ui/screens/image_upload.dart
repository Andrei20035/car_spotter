import 'dart:io';

import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key, required this.image});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final File imageFile = File(image.path);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
          style: const ButtonStyle(iconSize: WidgetStatePropertyAll(30)),
        ),
        title: Text(
          "Upload photo",
          style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color.fromARGB(255, 5, 8, 29),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              0.7,
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.125),
                    Container(
                      height: screenHeight * 0.405,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: FileImage(imageFile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

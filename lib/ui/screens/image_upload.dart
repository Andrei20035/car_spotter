import 'dart:io';

import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key, required this.image});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: FileImage(imageFile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CarDropdownButton(
                      height: screenHeight * 0.06,
                      hint: "Brand",
                    ),
                    const SizedBox(height: 16),
                    CarDropdownButton(
                      height: screenHeight * 0.06,
                      hint: "Model",
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: screenHeight * 0.09,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        child: TextFormField(
                          controller: TextEditingController(
                              text: "Tell them more about your find..."),
                          cursorColor: const Color(0xFF4E4E4E),
                          cursorHeight: 20,
                          maxLines: 4,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF4E4E4E),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFD96570),
                              Color(0xFFA470BE),
                            ],
                          ),
                        ),
                        child: Container(
                          width: screenWidth * 0.5888,
                          height: screenHeight * 0.0625,
                          alignment: Alignment.center,
                          child: Text(
                            "Post",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
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

// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';

import 'package:car_spotter/main.dart';
import 'package:car_spotter/ui/screens/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostYourFindButton extends StatelessWidget {
  const PostYourFindButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey widgetKey = GlobalKey();

    void showOverlay(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        key: widgetKey,
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                              "assets/images/post_with_camera.png"),
                          radius: screenWidth * 0.1805,
                        ),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.camera,
                            maxHeight: 1024,
                            maxWidth: 1024,
                          );
                          if (image != null &&
                              widgetKey.currentContext != null) {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImageUploadScreen(image: image),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(width: screenWidth * 0.1),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                              "assets/images/post_from_gallery.png"),
                          radius: screenWidth * 0.1805,
                        ),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                            maxHeight: 1024,
                            maxWidth: 1024,
                          );
                          if (image != null &&
                              widgetKey.currentContext != null) {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImageUploadScreen(image: image),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        showOverlay(context);
      },
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
            "Post your find",
            style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

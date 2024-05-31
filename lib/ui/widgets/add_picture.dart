import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({super.key});

  @override
  State<AddPicture> createState() {
    return _AddPictureState();
  }
}

class _AddPictureState extends State<AddPicture> {
  File? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 1000, maxWidth: 1000,);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Container(
        width: screenWidth * 0.5,
        height: screenWidth * 0.5,
        decoration: BoxDecoration(
          border: _selectedImage != null ? Border.all(
            color: Color.fromARGB(255, 88, 88, 88),
            width: 3
          ) : Border.symmetric(),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _selectedImage != null
                ? FileImage(_selectedImage!) as ImageProvider
                : const AssetImage('assets/images/placeholder.png'),
            fit: BoxFit.cover,
            // Image cropper
          ),
        ),
      ),
      onTap: () {
        _pickImageFromGallery();
      },
    );
  }
}

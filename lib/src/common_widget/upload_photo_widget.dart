import 'dart:io';

import 'package:berayean/src/theme_manager/color_manager.dart';
import 'package:flutter/material.dart';

class UploadPhotoWidget extends StatelessWidget {
  const UploadPhotoWidget({super.key, required this.image});

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180.0,
          height: 180.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 8.0,
              color: ColorManager.secondary,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: image != null ? Image(image: FileImage(image!), fit: BoxFit.cover,) : const Image(
              image: AssetImage(
                'assets/images/profile_icon.png'
                ),
                fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -25.0,
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Image(
              image: AssetImage('assets/images/icon_add_color.png')
              ),
          ),
        )
      ],
    );
  }
}
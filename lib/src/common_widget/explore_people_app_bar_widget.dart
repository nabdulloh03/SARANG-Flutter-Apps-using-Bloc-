import 'dart:io';

import 'package:berayean/src/common_widget/logo_widget.dart';
import 'package:berayean/src/features/authentication/data/data_user_account_local.dart';
import 'package:berayean/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:berayean/src/features/likes_you/presentation/people_loved.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  const ExplorePeopleAppBarWidget({super.key, required this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      //Agar ada space antara element
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            UserAccountRegister.userAccountLogout();
            Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.routeName, (route) => false);
          },
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imagePath != null ? FileImage(File(imagePath!)) : AssetImage(
                  'assets/images/user_image.png'
                ) as ImageProvider,
                fit: BoxFit.cover,
                ),
            ),
          ),
        ),
        const LogoWidget(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context, 
              PeopleLoved.routeName,
              );
          },
          child: Container(
            width: AppSize.s24,
            height: AppSize.s24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/icon_notification.png'
                ),
                ),
            ),
          ),
        )
      ],
    );
  }
}
import 'package:berayean/src/theme_manager/color_manager.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../features/likes_you/domain/user.dart';
import '../features/likes_you/presentation/people_profile_screen.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(user.imagePath),
              fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 10.0,
                color: ColorManager.secondary,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              borderRadius: BorderRadius.circular(70.0),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PeopleProfileScreen.routeName, arguments: user);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: AppPadding.p24,
            ),
            width: double.infinity,
            height: 80,
            margin: EdgeInsets.symmetric(
              vertical: 26.0,
              horizontal: 30.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.0),
              image: DecorationImage(
                image: AssetImage('assets/images/glass.png'),
                fit: BoxFit.cover,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.fullName}',
                      style: getWhiteTextStyle(
                        fontSize: FontSizeManager.f24,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ),
                    Text(
                      '${user.age}, ${user.occupation}',
                      style: getWhiteTextStyle(
                        fontSize: FontSizeManager.f14,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/icon_profile.png'),
                      fit: BoxFit.cover,
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
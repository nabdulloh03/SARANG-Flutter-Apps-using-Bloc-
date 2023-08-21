import 'package:berayean/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:berayean/src/theme_manager/color_manager.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../features/likes_you/domain/user.dart';
import '../theme_manager/style_manager.dart';

class PeopleLovedCardWidget extends StatelessWidget {
  const PeopleLovedCardWidget({super.key, required this.users});

  final User users;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PeopleProfileScreen.routeName, arguments: users);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSize.s24,
          vertical: AppSize.s12,
        ),
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('${users.imagePath}'),
                ),
            ),
          ),
          title: Text(
              '${users.fullName}',
              style: getWhiteTextStyle(
                fontSize: FontSizeManager.f20,
                fontWeight: FontWeightManager.semiBold
              ),      
              ),
          subtitle: Text(
              '${users.age}, ${users.occupation}',
              style: getBlack30TextStyle(
                fontSize: FontSizeManager.f14,
                fontWeight: FontWeightManager.regular,
              ),      
              ),
        ),
      ),
    );
  }
}
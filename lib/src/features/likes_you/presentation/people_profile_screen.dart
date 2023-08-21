import 'package:berayean/src/common_widget/custom_button_widget.dart';
import 'package:berayean/src/common_widget/match_button_widget.dart';
import 'package:berayean/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../domain/user.dart';

class PeopleProfileScreen extends StatefulWidget {
  static const String routeName = '/people_screen';
  const PeopleProfileScreen({super.key});

  @override
  State<PeopleProfileScreen> createState() => _nameState();
}

class _nameState extends State<PeopleProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 420.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      '${user.imagePath}',
                      ),
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p40,
                  vertical: AppPadding.p24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MatchButtonWidget(
                      onTap: () {
                        Navigator.pop(context);
                      }, 
                      iconPath: 'assets/images/icon_arrow_left.png',
                      dimension: 20.0,
                      ),
                    Text(
                      'Lover Profile\nDetails',
                      textAlign: TextAlign.center,
                      style: getWhiteTextStyle(
                        fontSize: AppSize.s20,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ),
                    MatchButtonWidget(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, ExplorePeoleScreen.routeName, (route) => false);
                      }, 
                      iconPath: 'assets/images/icon_close_circle.png',
                      dimension: 20.0,
                      ),
                  ],
                ),
              )
            ],
            
          ),
          SizedBox(
            height: AppSize.s30,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.fullName}',
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f28,
                    fontWeight: FontWeightManager.semiBold
                  ),
                ),
                Text(
                  '${user.age}, ${user.occupation}',
                  style: getBlack60TextStyle(
                    fontSize: FontSizeManager.f16,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Text(
                  '${user.description}',
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f16,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            margin: EdgeInsets.only(
              left: AppMargin.m24,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80.0,
                  width: 120,
                  margin: EdgeInsets.only(
                    right: AppMargin.m16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s18),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/hobby2_image.png'),
                      ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: AppSize.s40,
          ),
          Container(
            margin: EdgeInsets.only(
              left: AppMargin.m24,
              right: AppMargin.m24,
              bottom: AppMargin.m39,
            ),
            child: CustomButtonWidget(
              title: 'Chat Now', 
              onTap: () {}
              ),
          ),
        ],
      ),
    );
  }
}
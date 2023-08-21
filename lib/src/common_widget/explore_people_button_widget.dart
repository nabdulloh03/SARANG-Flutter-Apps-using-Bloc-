import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:berayean/src/common_widget/match_button_widget.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/People_Loved/people_loved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({super.key, required this.controller});


  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          MatchButtonWidget(
            onTap: () {
              controller.swipeLeft();
            }, 
            iconPath: 'assets/images/icon_close.png'
            ),
          MatchButtonWidget(
            dimension: 80.0,
            onTap: () {
              // controller.swipeUp();
              // context.read<PeopleLovedBloc>().add(AddPeopleToLovedList(user: user))

              controller.swipe();
            }, 
            iconPath: 'assets/images/icon_love.png'
            ),
          MatchButtonWidget(
            onTap: () {
              controller.swipeRight();
            }, 
            iconPath: 'assets/images/icon_favorite.png'
            ),
        ],
    );
  }
}
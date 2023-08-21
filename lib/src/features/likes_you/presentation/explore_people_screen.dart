import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:berayean/src/common_widget/custom_button_widget.dart';
import 'package:berayean/src/common_widget/explore_people_app_bar_widget.dart';
import 'package:berayean/src/common_widget/explore_people_button_widget.dart';
import 'package:berayean/src/common_widget/match_card_widget.dart';
import 'package:berayean/src/features/authentication/data/data_user_account_local.dart';
import 'package:berayean/src/features/authentication/domain/user_account.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/People_Loved/people_loved_bloc.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/explore_people_bloc.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePeoleScreen extends StatefulWidget {
  static const String routeName = '/explore-people';
  const ExplorePeoleScreen({super.key});

  @override
  State<ExplorePeoleScreen> createState() => _ExplorePeoleScreenState();
}

class _ExplorePeoleScreenState extends State<ExplorePeoleScreen> {
  UserAccount? account;

  final cardController = AppinioSwiperController();

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserFromStorage();
    final result = UserAccount.fromMap(data);
    account = result;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    getDataUserAccount();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p40,
          horizontal: AppPadding.p24,
        ),
        child: Column(
          children: [
            ExplorePeopleAppBarWidget(
              imagePath: account?.profileImage,
            ),
            const SizedBox(
              height: 50.0,
            ),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                  if (state is ExplorePeopleloaded) {
                    final users = state.result;
                    List<Widget> cards = [];
                    for (var user in users) {
                      cards.add(MatchCardWidget(user: user));
                    }
                    return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'No More People to Swipe!', 
                                style: getWhiteTextStyle(
                                fontSize: FontSizeManager.f14
                              ),
                              textAlign: TextAlign.center,
                              ),
                              AppinioSwiper(
                              direction: AppinioSwiperDirection.top,
                              onSwipe: (index, direction) {
                                if (direction == AppinioSwiperDirection.top) {
                                  context.read<PeopleLovedBloc>().add(AddPeopleToLovedList(user: users[index-1]));
                                }
                              },
                              controller: cardController,
                              cardsBuilder: (context, index) {
                          
                              final card = cards[index];
                          
                              return card;
                          
                              },
                              padding: EdgeInsets.all(0),
                          
                              cardsCount: cards.length,
                              ),
                            ]
                          ),
                          ),
                        
                        SizedBox(
                          height: 50.0,
                        ),
                        ExplorePeopleButtonWidget(controller: cardController,),
                      ],
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:berayean/src/common_widget/people_loved_card_widget.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/People_Loved/people_loved_bloc.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleLoved extends StatefulWidget {
  static const String routeName = '/people-loved';
  const PeopleLoved({super.key});

  @override
  State<PeopleLoved> createState() => _PeopleLovedState();
}

class _PeopleLovedState extends State<PeopleLoved> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PeopleLovedBloc>().add(PeopleLovedList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'People You\nLoved',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: AppSize.s30,
              )),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppSize.s50,
          ),
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {

              if (state is PeopleLovedSucess) {

                  final users = state.userMatch;
                  if (users.isEmpty) {
                    return Center(
                      child: 
                      
                      Text('No Data Available!', style: getWhiteTextStyle(
                        fontSize: FontSizeManager.f16
                      ),),
                    );
                  }
                  return Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PeopleLovedCardWidget(users: users[index],);
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}

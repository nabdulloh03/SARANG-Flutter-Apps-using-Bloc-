import 'package:berayean/src/app.dart';
import 'package:berayean/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/People_Loved/people_loved_bloc.dart';
import 'package:berayean/src/features/likes_you/presentation/bloc/explore_people_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ExplorePeopleBloc()),
        BlocProvider(create: (context) => PeopleLovedBloc()),
      ],
      child: AppScreen(),
    );
  }
}

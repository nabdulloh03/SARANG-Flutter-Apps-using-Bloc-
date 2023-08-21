import 'package:berayean/src/features/authentication/data/data_user_account_local.dart';
import 'package:berayean/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:berayean/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:berayean/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:berayean/src/features/likes_you/presentation/people_loved.dart';
import 'package:berayean/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:flutter/material.dart';
import 'features/authentication/presentation/sign_up_age_job_screen.dart';
import 'theme_manager/theme_data_manager.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegister = false;

  isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegister();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserRegister();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: getApplicationThemeData(),
      home: isRegister == true ? const ExplorePeoleScreen() : const SignUpScreen(),
      routes: {
        SignUpScreen.routeName:(context) => const SignUpScreen(),
        SignUpUploadPhotoScreen.routeName:(context) => const SignUpUploadPhotoScreen(),
        ExplorePeoleScreen.routeName:(context) => const ExplorePeoleScreen(),
        PeopleLoved.routeName:(context) => const PeopleLoved(),
        PeopleProfileScreen.routeName:(context) => const PeopleProfileScreen(),
      },
    );
  }
}
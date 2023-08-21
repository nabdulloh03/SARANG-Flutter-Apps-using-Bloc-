import 'dart:io';

import 'package:berayean/src/common_widget/custom_button_widget.dart';
import 'package:berayean/src/common_widget/custom_text_button.dart';
import 'package:berayean/src/common_widget/logo_and_tagline.dart';
import 'package:berayean/src/common_widget/upload_photo_widget.dart';
import 'package:berayean/src/features/authentication/domain/user_account.dart';
import 'package:berayean/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:berayean/src/theme_manager/font_manager.dart';
import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:berayean/src/utils/image_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  static const routeName = '/upload-photo-screen';
  const SignUpUploadPhotoScreen({super.key});

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  String? validationInput() {
    if (image == null) {
      return 'Upload an Image First!';
    }

    return null;
  }

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, ExplorePeoleScreen.routeName, (route) => false);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p24,
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              LogoAndTaglineWidget(),
              SizedBox(
                height: AppSize.s50,
              ),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(AppPadding.p24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      getImageProfile(GetImageFrom.camera);
                                    },
                                    icon: Icon(
                                      Icons.camera,
                                      size: AppSize.s50,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      getImageProfile(GetImageFrom.gallery);
                                    },
                                    icon: Icon(
                                      Icons.photo,
                                      size: AppSize.s50,
                                    )),
                              ],
                            ),
                          );
                        });
                  },
                  child: UploadPhotoWidget(
                    image: image,
                  )),
              SizedBox(
                height: AppSize.s43,
              ),
              Text(
                '${userAccount.fullName}',
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f22,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              Text(
                '${userAccount.age}, ${userAccount.occupation}',
                style: getBlackTextStyle(
                  fontSize: FontSizeManager.f16,
                  fontWeight: FontWeightManager.regular,
                ),
              ),
              SizedBox(
                height: 240.0,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                  return CustomButtonWidget(
                      title: 'Update My Profile', 
                      onTap: () {
                        final message = validationInput();
                        if (message != null) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xffff0000),
                            content: Text(message)
                            ),
                        );

                        return;
                        }

                        userAccount.profileImage = image?.path;
                        context.read<AuthBloc>().add(
                          RegisterAuthEvent(userAccount: userAccount, isRegister: true),
                        );
                      });
                },
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              CustomTextButton(
                title: 'Skip For Now',
                onPressed: () {
                  context.read<AuthBloc>().add(RegisterAuthEvent(
                      userAccount: userAccount, isRegister: true));
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}

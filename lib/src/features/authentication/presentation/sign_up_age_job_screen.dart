import 'package:berayean/src/common_widget/custom_button_widget.dart';
import 'package:berayean/src/common_widget/custom_text_field.dart';
import 'package:berayean/src/common_widget/top_section.dart';
import 'package:berayean/src/features/authentication/domain/user_account.dart';
import 'package:berayean/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const routeName = '/sign-up-age-job';
  const SignUpAgeJobScreen({super.key, required this.fullName, required this.email, required this.password});

  final String fullName;
  final String email;
  final String password;

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {

  final jobController = TextEditingController();
  final ageController = TextEditingController();

  String? validationInput() {
    if (jobController.text.isEmpty || ageController.text.isEmpty) {
      return 'All field must be filled!';
    }

    return null;
  }

  @override
  void dispose() {
    jobController.clear();
    jobController.dispose();
    ageController.clear();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24,
        ),
        child: SingleChildScrollView (
          child: Column(
            children: [
              TopSection(),
              CustomTextFieldWidget(
                labelName: 'Occupation', 
                hintText: 'Write your occupation', 
                controller: jobController
                ),
              CustomTextFieldWidget(
                labelName: 'Age', 
                hintText: 'How old are you', 
                controller: ageController
                ),
                SizedBox(height: 117.0,),
                CustomButtonWidget(
                  title: 'Sign Up', 
                  onTap: () {
                    final message = validationInput();
                    if (message != null) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xffff0000),
                          content: Text(message),
                        )
                      );

                      return;
                    }

                    UserAccount userAccount = UserAccount(
                      fullName: widget.fullName, 
                      email: widget.email, 
                      password: widget.password, 
                      occupation: jobController.text, 
                      age: ageController.text
                      );
                    Navigator.pushNamed(
                      context, 
                      SignUpUploadPhotoScreen.routeName,
                      arguments: userAccount
                      );
                  }
                  ),
            ],
          ),
          ) 
      ),
    );
  }
}
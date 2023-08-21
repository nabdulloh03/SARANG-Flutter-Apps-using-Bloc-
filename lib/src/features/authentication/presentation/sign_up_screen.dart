import 'package:berayean/src/common_widget/custom_button_widget.dart';
import 'package:berayean/src/common_widget/custom_text_button.dart';
import 'package:berayean/src/common_widget/custom_text_field.dart';
import 'package:berayean/src/common_widget/top_section.dart';
import 'package:berayean/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:berayean/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   @override
  void initState() {
    // menghilangkan status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  String? validationInput() {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      return 'All field must be filled!';
    }

    if (!emailController.text.contains('@')) {
      return 'Email Invalid!';
    }

    return null;
  }

  @override
  void dispose() {

    nameController.clear();
    nameController.dispose();
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopSection(),
              CustomTextFieldWidget(
                labelName: "Complete Name", 
                hintText: 'Write Your Name', 
                controller: nameController
              ),
              CustomTextFieldWidget(
                labelName: "Email Address", 
                hintText: 'Write Your Mail Address', 
                controller: emailController
              ),
              CustomTextFieldWidget(
                labelName: "Password", 
                hintText: 'Write Your Password',
                isObsecure: true, 
                controller: passwordController
              ),
              SizedBox(height: AppSize.s16,),
              CustomButtonWidget(
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

                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => SignUpAgeJobScreen(
                        fullName: nameController.text, 
                        email: emailController.text, 
                        password: passwordController.text,
                        )
                      )
                    );
                },
                title: 'Get Started',
              ),
              SizedBox(height: AppSize.s20,),
              CustomTextButton(title: 'Sign In to My Account', onPressed: () {})
            ],
          ),
        ),
        ),
    );
  }
}
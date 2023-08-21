import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      width: 183.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo_image.png'),
        ),
      ),
    );
  }
}
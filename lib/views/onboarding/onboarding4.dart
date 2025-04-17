import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/onboard/onboard_screen_widget.dart';
import 'package:gyaanplant_learning_app/views/login/login.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: onBoardingWidget(
        image: Image.asset('assets/images/onboard/image2361.png'),
        text1: 'Interactive Exams',
        text2:
            "By boosting your productivity we help\n you achieve your purpose",
        buttonText: 'Login',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
      ),
    );
  }
}

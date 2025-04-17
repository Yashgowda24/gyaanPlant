import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/views/login/otp.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: LoginWidget(
          image:
              Image.asset('assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
          heading: 'Login',
          subText: "Enter your Mobile Number to receive\n OTP",
          buttonText: 'Submit',
          hintText: 'Enter your number',
          isOtpField: false,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

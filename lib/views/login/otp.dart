import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/views/role/role.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: LoginWidget(
          image:
              Image.asset('assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
          heading: 'Enter OTP',
          subText: 'Verify Aadhaat OTP',
          buttonText: 'Continue',
          hintText: 'Enter your number',
          isOtpField: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseRole(),
              ),
            );
          },
        ),
      ),
    );
  }
}

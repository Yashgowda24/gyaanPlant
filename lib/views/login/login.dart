import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/urls/url.dart';
import 'package:gyaanplant_learning_app/views/login/otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
  }

  void _handleSendOtp() async {
    final phoneNumber = _phoneController.text.trim();

    if (phoneNumber.isNotEmpty) {
      await AppUrl.sendOtp(phoneNumber);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully!'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
            phoneNumber: phoneNumber,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your mobile number!'),
        ),
      );
    }
  }

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
          phoneNumberController: _phoneController,
          onPressed: _handleSendOtp,
        ),
      ),
    );
  }
}

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorText;

  void _handleSendOtp() async {
    setState(() {
      _errorText = null;
    });

    final phoneNumber = _phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      setState(() {
        _errorText = 'Please enter your mobile number!';
      });
      return;
    }

    if (phoneNumber.length != 10 ||
        !RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      setState(() {
        _errorText = 'Please enter a valid 10-digit mobile number!';
      });
      return;
    }

    bool isVerified = await AppUrl.sendOtp(phoneNumber);
    if (isVerified) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent successfully!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNumber: phoneNumber),
        ),
      );
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send OTP. Try again!')),
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Form(
          key: _formKey,
          child: LoginWidget(
            image: Image.asset(
                'assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
            heading: 'Login',
            subText: "Enter your Mobile Number to receive\n OTP",
            buttonText: 'Submit',
            hintText: 'Enter your number',
            isOtpField: false,
            phoneNumberController: _phoneController,
            errorText: _errorText,
            onPressed: _handleSendOtp,
          ),
        ),
      ),
    );
  }
}

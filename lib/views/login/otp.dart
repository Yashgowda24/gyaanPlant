import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/page_transition/page_transition.dart';
import 'package:gyaanplant_learning_app/urls/url.dart';
import 'package:gyaanplant_learning_app/views/role/role.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String _enteredOtp = '';

  void _handleVerifyOtp() async {
    if (_enteredOtp.length == 4) {
      bool isVerified = await AppUrl.verifyOtp(widget.phoneNumber, _enteredOtp);
      if (isVerified) {
        print('Otp after api call: ${_enteredOtp}');
        print('Phone num: ${widget.phoneNumber}');

        if (!mounted) return;

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ChooseRole(),
        //   ),
        // );
        Navigator.push(context, SlideLeftRoute(page: const ChooseRole()));
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid or expired OTP.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid 4-digit OTP')));
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
          heading: 'Enter OTP',
          subText: 'OTP sent on your Mobile Number',
          buttonText: 'Continue',
          hintText: '',
          isOtpField: true,
          onOtpSubmit: (otp) {
            setState(() {
              _enteredOtp = otp;
            });
          },
          onPressed: _handleVerifyOtp,
        ),
      ),
    );
  }
}

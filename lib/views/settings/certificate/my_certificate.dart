import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';

class MyCertificateScreen extends StatelessWidget {
  const MyCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                spreadRadius: 0,
                offset: Offset(0, 0),
                color: Color.fromRGBO(179, 32, 115, 0.18),
              )
            ],
          ),
          child: AppBar(
            title: const Text(
              'My Certificates',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CertificateWidget(
              text1: 'Congratulations on completing the',
              text2: 'Web Development\ncourse',
              size: 20,
            ),
            Image.asset(
              'assets/images/home/Certificate.png',
            ),
            CertificateWidget(
              text1: 'You\'ve successfully completed the course on',
              text2: '02 May 2025',
              size: 16,
            ),
            GreenButton(
              text: 'Download Certificate',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CertificateWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final double size;

  const CertificateWidget({
    required this.text1,
    required this.text2,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          text1,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 14.0,
            color: Color.fromRGBO(121, 123, 125, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text2,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: size,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

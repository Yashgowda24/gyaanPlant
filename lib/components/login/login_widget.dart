import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';

class LoginWidget extends StatelessWidget {
  final Image image;
  final String heading;
  final String subText;
  final String hintText;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOtpField;
  final bool showTextField;
  final bool showButton;
  final Widget? customChild;

  LoginWidget({
    required this.image,
    required this.heading,
    required this.subText,
    required this.buttonText,
    required this.hintText,
    required this.onPressed,
    this.isOtpField = false,
    this.showTextField = true,
    this.showButton = true,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image,
          SizedBox(
            height: 60,
          ),
          Text(
            heading,
            style: kGilroy28700,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            subText,
            style: kGilroy16500,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          // Conditionally show text field or OTP field
          if (showTextField)
            isOtpField
                ? OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color.fromRGBO(217, 217, 217, 1),
                    focusedBorderColor: Color.fromRGBO(61, 123, 66, 1),
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(12),
                    fieldWidth: 60,
                    autoFocus: true,
                    filled: true,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(33, 33, 33, 1),
                    ),
                    fillColor: Colors.white,
                    onSubmit: (String verificationCode) {
                      print("OTP Entered: $verificationCode");
                    },
                  )
                : Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(33, 33, 33, 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
          if (showTextField) const SizedBox(height: 30),

          if (customChild != null) ...[
            SizedBox(height: 30),
            customChild!,
          ],

          // Conditionally show button
          if (showButton)
            GreenButton(
              text: buttonText,
              onPressed: onPressed,
            ),
        ],
      ),
    );
  }
}

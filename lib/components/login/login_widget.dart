import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';

class LoginWidget extends StatefulWidget {
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
  final void Function(String)? onOtpSubmit;
  final TextEditingController? phoneNumberController;
  final String? errorText;

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
    this.phoneNumberController,
    this.onOtpSubmit,
    this.errorText,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.image,
          SizedBox(
            height: 60,
          ),
          Text(
            widget.heading,
            style: kGilroy28700,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget.subText,
            style: kGilroy16500,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          // Conditionally show text field or OTP field
          if (widget.showTextField)
            widget.isOtpField
                ? OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color.fromRGBO(217, 217, 217, 1),
                    focusedBorderColor: Color.fromRGBO(61, 123, 66, 1),
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(12),
                    fieldWidth: 60,
                    autoFocus: false,
                    filled: true,
                    textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 22.0,
                      color: Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    fillColor: Colors.white,
                    onSubmit: widget.onOtpSubmit,
                  )
                : Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: TextField(
                      controller: widget.phoneNumberController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        errorText: widget.errorText,
                        hintStyle: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16.0,
                          color: Color.fromRGBO(33, 33, 33, 1),
                          fontWeight: FontWeight.w500,
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
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
          if (widget.showTextField) const SizedBox(height: 30),

          if (widget.customChild != null) ...[
            SizedBox(height: 30),
            widget.customChild!,
          ],

          // Conditionally show button
          if (widget.showButton)
            GreenButton(
              text: widget.buttonText,
              onPressed: widget.onPressed,
            ),
        ],
      ),
    );
  }
}

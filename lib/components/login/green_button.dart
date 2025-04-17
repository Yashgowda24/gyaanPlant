import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}

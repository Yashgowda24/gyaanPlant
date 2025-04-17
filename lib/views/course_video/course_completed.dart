import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPopup extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget? bottomWidget; // Optional for XP/Coins display
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? backgroundColor;

  const CustomPopup({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.bottomWidget,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color.fromRGBO(245, 249, 255, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Image.asset(imageAsset),
            const SizedBox(height: 30),
            Text(
              title,
              style: titleStyle ??
                  GoogleFonts.jost(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(32, 34, 68, 1),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 11),
            Text(
              subtitle,
              style: subtitleStyle ??
                  GoogleFonts.mulish(
                    fontSize: 13.03,
                    color: Color.fromRGBO(84, 84, 84, 1),
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            if (bottomWidget != null) ...[
              const SizedBox(height: 16),
              bottomWidget!,
            ],
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: onButtonPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

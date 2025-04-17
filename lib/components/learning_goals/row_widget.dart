import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningGoalsRowWidget extends StatelessWidget {
  final Image image1;
  final String text1;
  final Image image2;
  final String text2;
  final List<String> selectedGoals;
  final Function(String) onTap;

  LearningGoalsRowWidget({
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    required this.selectedGoals,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected1 = selectedGoals.contains(text1);
    bool isSelected2 = selectedGoals.contains(text2);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTap(text1),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: isSelected1 ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(149, 157, 165, 0.2),
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                    blurRadius: 24,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image1,
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    text1,
                    style: GoogleFonts.monda(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () => onTap(text2),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: isSelected2 ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(149, 157, 165, 0.2),
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                    blurRadius: 24,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image2,
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    text2,
                    style: GoogleFonts.monda(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/views/assessmet/web_dev/congrats.dart';

class WebDevAssessmentPg2 extends StatefulWidget {
  const WebDevAssessmentPg2({super.key});

  @override
  State<WebDevAssessmentPg2> createState() => _WebDevAssessmentPg2State();
}

class _WebDevAssessmentPg2State extends State<WebDevAssessmentPg2> {
  int selectedIndex = -1;

  final List<String> options = [
    '<heading>',
    '<h6>',
    '<head>',
    '<h1>',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            title: const Text(
              'Web Development',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Centered text
                  Center(
                    child: Text(
                      'Question 2 of 10',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Row aligned to the start
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 14,
                            color: const Color.fromRGBO(118, 118, 118, 1),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Previous',
                            style: GoogleFonts.baloo2(
                              fontSize: 14.0,
                              color: const Color.fromRGBO(118, 118, 118, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Text(
              'Choose the correct HTML tag\nfor the largest heading',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // MCQ Options
            ...List.generate(options.length, (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color.fromARGB(255, 161, 161, 161)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          options[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(
                        isSelected ? Icons.check : Icons.radio_button_unchecked,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 45,
            ),
            GreenButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CongratsScreen(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

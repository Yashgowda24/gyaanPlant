import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/views/assessmet/select_assessment.dart';

class AssessmetScreen extends StatelessWidget {
  const AssessmetScreen({super.key});

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
              'Assessment',
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
            SizedBox(
              height: 35.0,
            ),
            Image.asset(
              'assets/images/onboard/GyaanPlant_Latest_Logo_1.png',
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              'Important Points to\n Remember',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Column(
              children: [
                AssessmentWidget(
                  text: 'Explore Courses -1',
                ),
                AssessmentWidget(
                  text: 'Give minimum 8 Answers -2',
                ),
                AssessmentWidget(
                  text: 'Submit Responses -3',
                ),
                AssessmentWidget(
                  text: 'Track Progress -4',
                ),
                AssessmentWidget(
                  text: 'Total Assessment -5',
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            GreenButton(
                text: 'Start the Test',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectAssessmentCategory(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class AssessmentWidget extends StatelessWidget {
  final String text;

  const AssessmentWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 20.0),
      child: Row(
        children: [
          Icon(
            Icons.star_border_rounded,
            color: Color.fromARGB(255, 37, 37, 20),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(24, 25, 31, 1),
            ),
          ),
        ],
      ),
    );
  }
}

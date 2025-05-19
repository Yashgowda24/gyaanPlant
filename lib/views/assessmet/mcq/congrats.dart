import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/views/assessmet/select_assessment.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';

class CongratsScreen extends StatelessWidget {
  final Map<String, dynamic> result;
  const CongratsScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // final int _correctAnswers = result['score'];
    // final int _totalMarks = result['totalMarks'];
    // final int _wrongAnswers = _totalMarks - _correctAnswers;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(17, 12, 46, 0.15),
                      blurRadius: 100,
                      offset: Offset(0, 48),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Web Development Complete',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color.fromRGBO(107, 114, 128, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Congratulations! You have\ncompleted your Test with',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(17, 24, 39, 1),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Marks obtained',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color.fromRGBO(107, 114, 128, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${result['percentage']}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.green,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              // '$_correctAnswers Correct Answers',
                              '10 Wrong Answers',
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                color: Color.fromRGBO(107, 114, 128, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              // '$_wrongAnswers Wrong Answers',
                              '0 Wrong Answers',
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                color: Color.fromRGBO(107, 114, 128, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Your certificate will be sent on\nyour email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(17, 24, 39, 1),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                GreenButton(
                    text: 'Try Again',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectAssessmentCategory(),
                        ),
                      );
                    }),
                const SizedBox(height: 12),
                FractionallySizedBox(
                  widthFactor: 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Color.fromRGBO(61, 123, 66, 1),
                            width: 2.0,
                          )),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Home',
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(61, 123, 66, 1),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
